---
name: restyle-mobbin
description: Search Mobbin for a UI pattern (a flow, screen, or section) and restyle it into a target design system's real tokens — the user's own or a named brand's — reading exact values from a getdesign.md-style file in design-tokens/, then writing the result directly into Figma (or an HTML preview if Figma isn't connected). Use whenever a designer wants inspiration from real products adapted into a specific design language, e.g. "find onboarding flows and restyle them in our system" or "pull Stripe's checkout and restyle in Airbnb's style."
---

# Restyle Mobbin → design tokens → Figma

## What this does, and what it doesn't

This accelerates the gap between "browsing inspiration" and "first draft in my own system" —
it does not make design decisions. Every output is a starting point for a designer to react to,
not a finished screen. Say so when handing off results.

## Step 0 — Gather the request interactively, if it isn't already complete

Two things are always needed before anything else can happen: which target design system, and
what pattern to search for. If the user's message already names both clearly (e.g. "pull Stripe's
checkout and restyle in Airbnb's style"), skip straight to Step 1 — don't interrupt someone who
already gave you everything.

Otherwise, ask before searching, using `AskUserQuestion` rather than one open-ended "what do you
want?" prompt:

- **List the real options.** Check `design-tokens/*.md` for what actually exists right now and
  offer each as a choice, plus an option for "my own system" (which routes into Step 1's
  no-matching-file handling). Don't hardcode brand names in this skill file — the set of reference
  files will grow, and a stale hardcoded list is worse than reading the directory each time.
- **Ask about search granularity too, if unclear.** Step 3 needs to know whether this is a flow, a
  screen, or a section — that choice changes which Mobbin tool runs and materially changes the
  results. A few concrete example patterns as options (with room to type something else) beats
  guessing wrong and having to redo the search.
- **One structured question beats several round-trips.** Ask target and pattern together in a
  single `AskUserQuestion` call rather than sequentially — the person already knows both answers,
  no reason to make them wait through two turns to give them.

The reasoning: Step 1 already refuses to silently substitute a stand-in design system when the
user's own doesn't exist, and a wrong guess at search granularity means a wasted Mobbin call. A
short upfront question is cheaper than discovering the mismatch after the fact — but only when the
request actually leaves something open. A fully-specified request deserves to be run immediately,
not gated behind a checklist for its own sake.

## Step 1 — Resolve the target design system

The user names a target either as "our/my system" (their own) or a specific brand ("Coinbase's
style", "Apple's style") — or, per Step 0, picks one from a presented list. Resolve it to one file
in `design-tokens/*.md`.

- If "our/my system" has no matching file in `design-tokens/`, say so explicitly before
  proceeding — do not silently substitute a different brand's file as a stand-in. Ask which file
  to use, or whether to treat this as a test run against an existing reference file.
- Multiple targets in one request (e.g. "show me it in both Coinbase's and Apple's style") means
  running Steps 3–5 once per target file, in parallel where the outputs don't depend on each other.

## Step 2 — Parse the target file rigorously, not by eye

Read the whole file. Do not approximate — every value used downstream must trace back to a
specific line in the file.

- **Colors**: pull exact hex from `colors:`. Convert to Figma's 0–1 range by dividing by 255 —
  never eyeball an RGB value.
- **Typography**: for each text role used, pull the exact `fontSize`, `fontWeight`, `lineHeight`,
  and `letterSpacing` from `typography:`. Match the *closest* documented token to the role you're
  building (e.g. a card title maps to `title-lg` or `display-sm`, not just "something biggish") —
  state which token you picked and why if it's not obvious.
- **Font substitution**: if the file's `fontFamily` names a licensed/unavailable font, check the
  "Note on Font Substitutes" section (or equivalent) for the documented fallback and apply it
  *exactly*, including any letter-spacing or line-height adjustment it specifies. Never pick a
  substitute font freehand.
- **Spacing & radius**: pull gaps and padding from `spacing:` and corner radii from `rounded:`.
  If a needed gap isn't represented by any token, pick the nearest one and say so — don't invent
  an arbitrary pixel value.
- **Components**: check `components:` for a named entry matching what you're building (e.g.
  `pricing-tier-featured`, `button-primary`). Prefer reusing a documented component's full spec
  over assembling primitives by hand.

## Step 3 — Search Mobbin

Match search granularity to the ask:
- A whole user journey → `search_flows`
- One screen or a named app's specific screen → `search_screens` (name the app in the query to
  filter to it, e.g. "Stripe checkout screen")
- A page pattern/component (pricing table, empty state, stat card) → `search_sections` (web) or
  `search_screens` with a tight query (mobile) — sections tend to match "designing one feature"
  better than a full flow.

If the request implies curation ("the best few", "a couple of good ones") and Mobbin returns more
than needed, pick a small, genuinely varied set (different source apps, not near-duplicates) and
say what was excluded and why — don't silently drop results without explanation.

## Step 4 — Match content to the target's real component vocabulary

For each source screen, before restyling: does the target file's `components:` block have
anything that matches this pattern?

- **Yes** → follow that component's spec exactly (radius, padding, color roles, typography token).
- **No** → this is the gap case from prior testing (e.g. Airbnb's tokens have no pricing-tier
  component). Improvise the closest reasonable adaptation, but **flag it explicitly** in the
  handoff — name what was borrowed from an unrelated pattern and why. Never let an improvised
  match read with the same confidence as a documented one.

## Step 5 — Output

Figma is the default output whenever it's connected, regardless of the source pattern's platform —
it's a canvas, not code, so it fits a mobile-sourced pattern just as well as a web-sourced one.

- **Figma connected**: load the `figma-use` skill (mandatory prerequisite for `use_figma`) and
  build real nodes — auto-layout frames, text with the exact font/size/weight/letter-spacing from
  Step 2, fills bound to the exact hex, corner radii from `rounded:`. Work incrementally per the
  `figma-use` rules (small steps, screenshot to verify, return created node IDs). Position new
  top-level frames away from existing content on the page.

Reach for platform-matched code instead when Figma isn't connected, or when the user explicitly
wants a shippable file rather than a design canvas ("give me the code", "write it as a component").
Match the format to the *source* pattern's platform from Step 3 — a pattern found via `search_flows`
or `search_screens(platform: "web")` or `search_sections` is web-sourced; `search_screens(platform:
"ios")` is mobile-sourced. Don't default everything to one format regardless of where it came from.

- **Web-sourced**: a single self-contained HTML file (inline CSS, no external build step) saved
  under `previews/` — see `previews/dashboard-empty-state-airbnb.html` for the established format:
  a mockup frame around the restyled content, a header block above it with the Mobbin source
  citation and target token file, and an explicit gap-flag note when a component was improvised.
  This path is fully verifiable in a Claude Code sandbox (render it with a headless browser before
  handing it off) — do that, don't just write the HTML and assume it's correct.
- **Mobile-sourced (iOS)**: a single SwiftUI view file saved under `previews/swiftui/` — see
  `previews/swiftui/CoinbaseNotificationSettingsView.swift` for the established format: a `Color`
  hex extension for exact token values, small reusable row/component views instead of one giant
  body, and a `#Preview` block at the bottom so it drops straight into Xcode's preview canvas.
  **Important limitation**: a Claude Code sandbox has no Swift toolchain and no macOS, so this file
  cannot be compiled, previewed, or verified from within the session — unlike the HTML path, this
  one ships unverified. Say so explicitly in the handoff, and tell the user to open it in Xcode (or
  paste it into a Swift Playground) to confirm it actually compiles before trusting it. When the
  target's typography needs a licensed/substitute font, default the SwiftUI code to `.system(...)`
  for guaranteed compilability, and note in the handoff that bundling the real substitute font
  (adding the file to the Xcode target + `Info.plist`) is a manual step the user still needs to do
  for pixel-exact type. Where the target's token schema improvised a component Figma has no native
  primitive for (e.g. a toggle switch), check whether SwiftUI has a *real* native equivalent first
  (e.g. `Toggle`) — native platform components are often available in code even when they had to be
  hand-built from primitives in Figma, and using the real one is strictly better than re-improvising.

## Handoff notes (always include)

- Which target file(s) were used, and the Mobbin source links (cite `mobbin_url` for every
  screen used).
- Any token that was approximated rather than found exactly, and why.
- Any component that had no match in the target file and was improvised.
- One-line reminder that this is a first-draft starting point, not a finished design decision.
