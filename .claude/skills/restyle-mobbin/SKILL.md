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

Four things are always needed before anything else can happen, gathered in this order:
**platform**, **what to search for**, **what to restyle it into**, and **what format the output
should take**. If the user's message already names all four clearly (e.g. "pull Stripe's web
checkout, restyle in Airbnb's style, and write it to Figma"), skip straight to Step 1 — don't
interrupt someone who already gave you everything. Ask about only whatever's actually missing;
don't re-ask something already answered.

Ask what's missing before searching, using `AskUserQuestion` rather than one open-ended "what do
you want?" prompt — but be honest about that tool's shape: it supports at most 4 clickable options
per question, so it cannot present a full list as chips once there are more than a few choices.
Don't fake a dropdown that doesn't fit; when a list is long, say the full list in plain text in the
same turn and let the person type the one they want (the tool's free-text option handles this).

1. **Platform: web or app (iOS)** (if not already given). Ask this *first*, before anything else —
   it determines which Mobbin tools are even valid (web unlocks `search_flows`, `search_screens`,
   and `search_sections`; app only unlocks `search_flows`/`search_screens` with `platform: "ios"` —
   there's no app equivalent of a page "section") and which output formats make sense (see question
   4). Deciding this last, after already searching or after the person has committed to an output
   format, is how a mismatch like "restyle this web flow as SwiftUI" happens — a real gap-flag case
   discovered in testing, not a hypothetical one. Locking platform in first prevents it structurally
   instead of relying on a warning after the fact.
2. **What to search for** (if not already given). Once platform is known, offer only the pattern
   types that platform actually supports as clickable options (web: a named app's screen, a whole
   flow, a page section/component; app: a named app's screen, or a whole flow — no section option),
   plus room to type something else. This doubles as Step 3's granularity signal.
3. **What to restyle it into** (if not already given). There are two separate pools, and which one
   to search depends on the platform from question 1:
   - **Web** → `design-tokens/*.md` (flat files, one per brand, website-derived).
   - **App (iOS)** → `design-tokens/ios-apps/<category>/<app>/DESIGN.md` — 200 native iOS app design
     systems (Coinbase, Binance, Robinhood, Spotify, Airbnb, and 195 more, organized by category:
     finance, social, messaging, travel, music, fitness, productivity, dating, food, video, misc).
     These document the brand's *actual app*, not its website — check here first whenever platform
     is "app" and only fall back to the website file (with the mismatch caveat below) if the brand
     genuinely isn't in this set. `design-tokens/ios-apps/ATTRIBUTION.md` credits the source.
   List real options as plain text if there are more than ~3, since the chip limit won't fit them —
   plus an option for "my own system" (routes into Step 1's no-matching-file handling). Don't
   hardcode brand names in this skill file itself; both reference sets grow, so read the directory
   fresh each time rather than trusting a list written down here. **If platform is "app" and the
   requested brand only exists in the website pool** (not in `design-tokens/ios-apps/`), say so
   plainly before proceeding — that's still the mismatch case (website tokens applied to a mobile
   screen, not the brand's real app language), just narrower now that a real native-app pool exists
   for many brands.
4. **What format the output should be** (if not already given). Only offer formats that fit the
   platform locked in at question 1 — don't present an option you'd immediately have to flag as a
   mismatch:
   - **Web** → **Figma** (the default; ask for the target file's URL if none has been mentioned in
     this conversation) or **HTML** (a real file you can open immediately).
   - **App (iOS)** → **Figma** (same as above) or **SwiftUI code** (ask whether it should be a
     standalone file or land in an existing iOS repo/path — see Step 5 for what this can and can't
     do; "Simulator" itself is never an option here, since this skill can't open or produce it).

If someone explicitly insists on a cross-platform combination anyway (e.g. genuinely wants a web
flow reimagined for iOS, on purpose) — honor it, since forcing platform-appropriate options is about
avoiding an *accidental* mismatch, not blocking a deliberate one — but flag the reinterpretation
explicitly in the handoff exactly like an unmatched component from Step 4: it's the same category
of "improvised, not documented" call, just at the platform level instead of the component level.

Combine what's missing into as few `AskUserQuestion` calls as possible — one call can carry multiple
questions, so don't spread four questions across four round-trips when one or two calls handle it.

The reasoning: Step 1 already refuses to silently substitute a stand-in design system when the
user's own doesn't exist, a wrong guess at search granularity means a wasted Mobbin call, and a
wrong guess at output format means redoing the entire build in a different medium. A short upfront
question is cheaper than discovering any of those mismatches after the fact — but only when the
request actually leaves something open. A fully-specified request deserves to be run immediately,
not gated behind a checklist for its own sake. There's no separate "preview, then approve, then
output" stage beyond this — for Figma, the incremental build-and-screenshot in Step 5 already *is*
the live preview (small steps, visible as they happen, trivially undoable); for HTML/SwiftUI, the
file itself is the deliverable, so the only thing that must happen after generating it is actually
surfacing it to the person rather than leaving it silent in the repo (see Step 5).

## Step 1 — Resolve the target design system

The user names a target either as "our/my system" (their own) or a specific brand ("Coinbase's
style", "Apple's style") — or, per Step 0, picks one from a presented list. Resolve it to one file:
`design-tokens/<brand>-DESIGN.md` for web, or `design-tokens/ios-apps/<category>/<app>/DESIGN.md`
for app — whichever pool matches the platform from Step 0.

- If "our/my system" has no matching file in either pool, say so explicitly before proceeding — do
  not silently substitute a different brand's file as a stand-in. Ask which file to use, or whether
  to treat this as a test run against an existing reference file.
- Multiple targets in one request (e.g. "show me it in both Coinbase's and Apple's style") means
  running Steps 3–5 once per target file, in parallel where the outputs don't depend on each other.

## Step 2 — Parse the target file rigorously, not by eye

Read the whole file. Do not approximate — every value used downstream must trace back to a
specific line in the file. Target files come in two schemas; both demand the same rigor, just
extracted from different places:

- **YAML-tokenized files** (every `design-tokens/*.md` web file, plus a few hand-converted ones):
  values live in a `colors:`/`typography:`/`rounded:`/`spacing:`/`components:` front-matter block.
  Pull from those keys directly.
- **Prose-only files** (every `design-tokens/ios-apps/` file, copied as-is from their source repo):
  no YAML block — values live in the prose and in markdown tables under numbered sections (Color
  Palette & Roles, Typography Rules' Hierarchy table, Component Stylings). Pull from the specific
  table row or bullet, the same way you'd pull from a YAML key — "the Hierarchy table's 'Portfolio
  Hero' row says 40pt / weight 700 / -0.5pt tracking" is exactly as rigorous as reading a
  `typography:` key, it's just prose instead of YAML. Never let the lack of YAML become an excuse
  to eyeball a value that's actually written down explicitly a few lines away.

Either way:

- **Colors**: pull the exact hex (from `colors:` or from inline code spans like `` `#0052FF` `` in
  prose). Convert to Figma's 0–1 range by dividing by 255 — never eyeball an RGB value.
- **Typography**: for each text role used, pull the exact size, weight, line height, and letter
  spacing (from `typography:` or from the Hierarchy table's matching row). Match the *closest*
  documented token/row to the role you're building — state which one you picked and why if it's
  not obvious.
- **Font substitution**: if the file names a licensed/unavailable font, check its "Note on Font
  Substitutes" section (or, in prose files, the "Google Fonts substitute" bullet under Typography
  Rules) for the documented fallback and apply it *exactly*, including any letter-spacing or
  line-height adjustment it specifies. Never pick a substitute font freehand.
- **Spacing & radius**: pull gaps and padding from `spacing:`/`rounded:`, or from the Layout
  Principles / Shapes sections in prose files. If a needed gap isn't represented anywhere, pick the
  nearest documented one and say so — don't invent an arbitrary pixel value.
- **Components**: check `components:` (or the Component Stylings section in prose files) for a
  named entry matching what you're building. Prefer reusing a documented component's full spec over
  assembling primitives by hand. For an app target with a matching `DESIGN-swiftui.md`, that file's
  `Color`/`Font` extensions and sample views are the real, author-written implementation — read it
  before improvising your own SwiftUI patterns in Step 5.

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
"Simulator" is never something to promise as an output format itself — a Claude Code sandbox cannot
open or run Simulator (see the SwiftUI note below); it's only ever something the *person* opens
locally, afterward, with a file this skill handed them.

- **Figma connected**: first make sure you know which file to write into — use a file URL/key the
  person already gave in this conversation, or ask for one (per Step 0) rather than assuming or
  reusing a file from a previous, unrelated task. Then load the `figma-use` skill (mandatory
  prerequisite for `use_figma`) and build real nodes — auto-layout frames, text with the exact
  font/size/weight/letter-spacing from Step 2, fills bound to the exact hex, corner radii from
  `rounded:`. Work incrementally per the `figma-use` rules (small steps, screenshot to verify,
  return created node IDs). Position new top-level frames away from existing content on the page.
  The incremental screenshots as you build **are** the preview — there's no separate approval gate
  before this counts as "done."

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
  handing it off) — do that, don't just write the HTML and assume it's correct. Once it's verified,
  **surface it to the person directly** (open it as a rendered preview, or send the file) rather
  than leaving it sitting silently in the repo — generating the file isn't the finish line, them
  actually seeing it is.
- **Mobile-sourced (iOS)**: a single SwiftUI view file — saved under `previews/swiftui/` for a
  standalone file, or at the path the person specified if they're targeting an existing iOS repo
  (per Step 0). See `previews/swiftui/CoinbaseNotificationSettingsView.swift` for the established
  format: a `Color` hex extension for exact token values, small reusable row/component views
  instead of one giant body, and a `#Preview` block at the bottom so it drops straight into Xcode's
  preview canvas. If the target came from `design-tokens/ios-apps/`, its `DESIGN-swiftui.md`
  sibling file already has that brand's own `Color`/`Font` extensions and sample view patterns
  written out — match those conventions instead of inventing a parallel structure. **Important
  limitation**: a Claude Code sandbox has no Swift toolchain and no
  macOS, so this file cannot be compiled, previewed, or verified from within the session — unlike
  the HTML path, this one ships unverified, and Simulator itself only ever runs on the person's own
  Mac. Say so explicitly in the handoff, send them the file directly, and tell them to open it in
  Xcode (or paste it into a Swift Playground) to confirm it actually compiles before trusting it.
  When the target's typography needs a licensed/substitute font, default the SwiftUI code to
  `.system(...)` for guaranteed compilability, and note in the handoff that bundling the real
  substitute font (adding the file to the Xcode target + `Info.plist`) is a manual step the person
  still needs to do for pixel-exact type. Where the target's token schema improvised a component
  Figma has no native primitive for (e.g. a toggle switch), check whether SwiftUI has a *real*
  native equivalent first (e.g. `Toggle`) — native platform components are often available in code
  even when they had to be hand-built from primitives in Figma, and using the real one is strictly
  better than re-improvising.

## Handoff notes (always include)

- Which target file(s) were used, and the Mobbin source links (cite `mobbin_url` for every
  screen used).
- Any token that was approximated rather than found exactly, and why.
- Any component that had no match in the target file and was improvised.
- One-line reminder that this is a first-draft starting point, not a finished design decision.
