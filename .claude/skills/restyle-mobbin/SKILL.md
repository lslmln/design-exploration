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

- **Figma connected**: load the `figma-use` skill (mandatory prerequisite for `use_figma`) and
  build real nodes — auto-layout frames, text with the exact font/size/weight/letter-spacing from
  Step 2, fills bound to the exact hex, corner radii from `rounded:`. Work incrementally per the
  `figma-use` rules (small steps, screenshot to verify, return created node IDs). Position new
  top-level frames away from existing content on the page.
- **Figma not connected**: fall back to an HTML preview (see `design-tokens/` trials in this repo
  for the established visual format — phone/desktop mockups with a source citation link and a
  short note on any gap-filled components) rather than blocking on Figma access.

## Handoff notes (always include)

- Which target file(s) were used, and the Mobbin source links (cite `mobbin_url` for every
  screen used).
- Any token that was approximated rather than found exactly, and why.
- Any component that had no match in the target file and was improvised.
- One-line reminder that this is a first-draft starting point, not a finished design decision.
