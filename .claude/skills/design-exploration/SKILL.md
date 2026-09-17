---
name: design-exploration
description: Search Mobbin for an iOS app UI pattern (a flow or screen) — by default across several different source apps doing the same pattern, for side-by-side comparison — and restyle all of it into a target iOS app's real design tokens, reading exact values from a design.md/ios-apps/ reference file, then writing the result directly into Figma. Use whenever a designer wants inspiration from real iOS apps adapted into a specific design language, e.g. "find onboarding flows and restyle them in our system" or "pull how a few different apps do checkout and restyle them all in Duolingo's style."
---

# design-exploration — Mobbin → design tokens → Figma

## What this does, and what it doesn't

This accelerates the gap between "browsing inspiration" and "first draft in my own system" —
it does not make design decisions. Every output is a starting point for a designer to react to,
not a finished screen. Say so when handing off results.

Scope, kept deliberately narrow:
- **iOS apps only.** Source patterns come from Mobbin's iOS app screens; targets come from
  `design.md/ios-apps/`. No web patterns, no web design systems — don't offer either.
- **Figma only.** Every result is written directly into a Figma file as real nodes. There's no
  HTML or SwiftUI fallback. If Figma isn't connected, say so plainly and stop — don't improvise a
  different output format to work around it.
- **Sources only from Mobbin, not an arbitrary screenshot the person hands you.** If someone
  attaches their own screenshot and asks to restyle it, say plainly that this skill searches
  Mobbin rather than working from arbitrary uploaded images, and offer to find the same or a
  similar pattern there instead (asking what app/flow it's from helps).
- **Restyles into an existing, named target system — it doesn't invent a new brand identity.**
  A request like "make Duolingo's brand more minimalist" or "redesign X's visual identity" is
  brand/identity exploration, not restyling a source pattern into a documented target's tokens —
  say so and ask whether they meant an existing system to restyle *into* instead.

## Step 0 — Gather the request interactively, if it isn't already complete

Three things are always needed before anything else can happen: **what pattern to search for**,
**what to restyle it into**, and **which Figma file to write into**. If the user's message already
names all three clearly, skip straight to Step 1 — don't interrupt someone who already gave you
everything. Ask about only whatever's actually missing; don't re-ask something already answered.

Ask what's missing before searching, using `AskUserQuestion` rather than one open-ended "what do
you want?" prompt — but be honest about that tool's shape: it supports at most 4 clickable options
per question, so it cannot present a full list as chips once there are more than a few choices.
Don't fake a dropdown that doesn't fit; when a list is long, say the full list in plain text in the
same turn and let the person type the one they want (the tool's free-text option handles this).

1. **What pattern to search for** (if not already given). This is **one question with concrete
   pattern examples as its clickable options** — never an abstract meta-question about granularity
   itself (never present "a whole flow" / "a single screen" as the options; those are internal
   categories for *you* to reason with, not chip labels to show the person). Pick 3-4 real,
   established iOS patterns as the actual option text — checkout, onboarding, sign-up, adding to
   cart, empty states, notification settings — whichever are most relevant to what's already been
   said, plus "something else" for free text. These match the action tags Mobbin's own results
   already carry (like "Purchasing & Ordering" or "Adding to Cart & Bag"). Whichever one is picked,
   the sweet spot is pulling how *several different apps* solve that same pattern and restyling all
   of them into one target so they can be compared side by side — that's the default to lead with,
   not an opt-in, and it's true regardless of whether the pattern picked is flow- or screen-shaped,
   so don't surface that shape distinction as a decision the person has to make. **Never offer "one
   specific screen from one named app" as a clickable option** — it's the narrower case (fetching
   one specific screen just to reskin it is a smaller ask than the multi-brand comparison this tool
   is actually built for), reachable only if someone types it themselves via free text, never
   suggested. Once you know the chosen pattern, its shape (flow vs. screen) is Step 3's granularity
   signal — reasoned internally, never asked.

   **Optionally, also offer to narrow by app category**, using Mobbin's own real category taxonomy
   (as browsable on mobbin.com itself, under Categories) — AI, Business, Collaboration,
   Communication, CRM, Developer Tools, Education, Entertainment, Finance, Food & Drink, Graphics &
   Design, Health & Fitness, Jobs & Recruitment, Lifestyle, Medical, Music & Audio, Maps &
   Navigation, News, Photo & Video, Productivity, Real Estate, Reference, Shopping, Social
   Networking, Sports, Travel & Transportation, Utilities — rather than an invented approximation,
   alongside "search broadly, no category filter" as the default/first option. Be upfront about what
   this actually does: this category list is real on Mobbin's own site, but the
   `search_flows`/`search_screens` MCP tools available here have **no category or industry filter
   parameter** — only a free-text `query`, a `platform`, and pagination. A category choice here gets
   folded into the natural-language query itself (e.g., "checkout flow for Finance category apps" or
   naming a couple of representative apps from that category) rather than applied as a structural
   filter, so it narrows results in practice but isn't a guarantee. After searching, sanity-check
   that what came back is actually in the requested category — if Mobbin returns something clearly
   outside it, drop it from the varied set rather than forcing the count, and say so rather than
   silently including an off-category result.
2. **What to restyle it into** (if not already given). `design.md/ios-apps/<category>/<app>/
   DESIGN.md` — 200 native iOS app design systems (Coinbase, Binance, Robinhood, Spotify, Airbnb,
   Duolingo, and 195 more, organized by category: finance, social, messaging, travel, music,
   fitness, productivity, dating, food, video, misc). These document the brand's *actual app*, not
   its website. `design.md/ios-apps/ATTRIBUTION.md` credits the source. List real options as plain
   text if there are more than ~3, since the chip limit won't fit them — plus an option for "my own
   system" (routes into Step 1's no-matching-file handling). Don't hardcode brand names in this
   skill file itself; the reference set grows, so read the directory fresh each time rather than
   trusting a list written down here.
3. **Which Figma file to write into, and which page in it** (if not already given). Ask for the
   file's URL or key if none has been mentioned in this conversation — never assume or reuse a file
   from a previous, unrelated task. A Figma file can hold several pages, and a shared URL's
   `?node-id=` parameter is what pins down *which* page or frame it points to — the file key alone
   is not enough. Resolve the page explicitly, don't default to whichever page a metadata call
   happens to list first (a "top-level pages" listing can come back partial or misleading — verify
   page identity directly, e.g. by resolving the `node-id` from the URL and checking what it
   actually is, rather than trusting a summary at face value):
   - If the URL's `node-id` resolves to a page itself (its parent has no parent page, i.e. it *is*
     one), that's the target page — build there.
   - If it resolves to a frame/node *within* a page, build on that page, positioned near (but not
     overlapping) the referenced node.
   - If no `node-id` is given, or the file has multiple pages and it's unclear which one is meant,
     list the real page names and ask — don't silently pick one (including "the first one returned
     by a listing call"). Building on the wrong page means the person can't find the output without
     being told to switch pages after the fact.
   - Once resolved, when pointing the person to the result later, give a direct node-id link into
     that page/section, not just the file URL — don't make them hunt for the right page.

   This also carries the device-size detail: it sets the Figma frame's
   width/height, so guessing wrong means redoing layout math after the fact. Use real point widths,
   not vague labels:
   - iPhone 17 (default if the person has no preference) — 402×874
   - iPhone 16 — 393×852 (a real, distinct size from the iPhone 17 default — don't conflate them)
   - iPhone 16 Pro Max / 17 Pro Max — 440×956
   - iPhone SE (3rd gen, the current smallest iPhone) — 375×667
   - iPad — **flag before proceeding, don't just build it**: Mobbin's iOS screens are phone-shaped
     (roughly 9:19.5), not tablet-shaped, so there's no real source layout to restyle *for* an
     iPad — only a phone screenshot scaled or centered onto a much wider canvas, which is a
     fundamentally different design problem (real iPad layouts add columns/sidebars, they don't
     just stretch). Say this plainly and offer the actual choice: center the phone-width content on
     an iPad-sized frame (honestly labeled as unstretched phone content, not a tablet redesign), or
     pick a phone size instead. Only proceed past this once the person has chosen, don't default
     silently either way.
   - Custom dimensions — take the person's exact numbers as given.

Combine what's missing into as few `AskUserQuestion` calls as possible — one call can carry multiple
questions, so don't spread three questions across three round-trips when one call handles it.

The reasoning: Step 1 already refuses to silently substitute a stand-in design system when the
user's own doesn't exist, a wrong guess at search granularity means a wasted Mobbin call, and
building against the wrong Figma file means undoing work in the wrong place. A short upfront
question is cheaper than discovering any of those mismatches after the fact — but only when the
request actually leaves something open. A fully-specified request deserves to be run immediately,
not gated behind a checklist for its own sake. There's no separate "preview, then approve, then
output" stage beyond this — the incremental build-and-screenshot in Step 5 already *is* the live
preview (small steps, visible as they happen, trivially undoable).

## Step 1 — Resolve the target design system

The user names a target either as "our/my system" (their own) or a specific app ("Coinbase's
style", "Duolingo's style") — or, per Step 0, picks one from a presented list. Resolve it to one
file: `design.md/ios-apps/<category>/<app>/DESIGN.md`.

- If the named target — "our/my system" *or* a specific app — has no matching file in the pool,
  say so explicitly before proceeding — do not silently substitute a different app's file as a
  stand-in, and don't fall back on general knowledge of what that app's style looks like instead of
  a real, documented file. Ask which file to use instead, whether to treat this as a test run
  against an existing reference file, or whether the person wants to supply their own file for it.
- Multiple targets in one request (e.g. "show me it in both Coinbase's and Duolingo's style") means
  running Steps 3–5 once per target file, in parallel where the outputs don't depend on each other.

## Step 2 — Parse the target file rigorously, not by eye

Read the whole file. Do not approximate — every value used downstream must trace back to a
specific line in the file. Target files are prose-only (copied as-is from their source repo): no
YAML block — values live in the prose and in markdown tables under numbered sections (Color
Palette & Roles, Typography Rules' Hierarchy table, Component Stylings). Pull from the specific
table row or bullet, the same way you'd pull from a structured key — "the Hierarchy table's
'Portfolio Hero' row says 40pt / weight 700 / -0.5pt tracking" is exactly as rigorous as reading a
token from a schema, it's just prose instead of YAML. Never let the lack of YAML become an excuse
to eyeball a value that's actually written down explicitly a few lines away. (If someone supplies
their own file in a different format, apply the same rigor to whatever structure it actually uses.)

- **Colors**: pull the exact hex from inline code spans like `` `#0052FF` `` in prose. Convert to
  Figma's 0–1 range by dividing by 255 — never eyeball an RGB value.
- **Typography**: for each text role used, pull the exact size, weight, line height, and letter
  spacing from the Hierarchy table's matching row. Match the *closest* documented row to the role
  you're building — state which one you picked and why if it's not obvious.
- **Font substitution**: this has two distinct cases — don't conflate them.
  - **The font is proprietary/licensed** (most brand display faces): check the file's "Google Fonts
    substitute" bullet under Typography Rules for the documented fallback and apply it *exactly*,
    including any letter-spacing or line-height adjustment it specifies. Never pick a substitute
    font freehand — and **always say in the handoff** which substitute was used in place of which
    real font and why, even when it's the file's own documented choice. Don't let a silent
    substitution read as if it were the real brand typeface.
  - **The font is legitimately obtainable but just isn't loaded in this Figma file right now** (an
    open font like Inter or a real system font like SF Pro Rounded that happens not to be in this
    session's font list): check with `listAvailableFontsAsync` before assuming. If it's missing,
    don't silently cascade to a different substitute — ask the person whether to (a) add that font
    to Figma themselves (most open fonts install in seconds from the Fonts panel or Google Fonts)
    and retry, or (b) have you pick the closest available substitute now. Only proceed once they've
    chosen, since silently downgrading a font that was actually available to the person, just not
    loaded yet, throws away accuracy they could have had for free.
- **Spacing & radius**: pull gaps and padding from the Layout Principles / Shapes sections. If a
  needed gap isn't represented anywhere, pick the nearest documented one and say so — don't invent
  an arbitrary pixel value.
- **Components**: check the Component Stylings section for a named entry matching what you're
  building. Prefer reusing a documented component's full spec over assembling primitives by hand.
  Also check the Figma file itself for an existing component that already matches — reusing a real
  instance beats rebuilding one from scratch.

## Step 3 — Search Mobbin

Match search granularity to the ask, always with `platform: "ios"`:
- A whole user journey → `search_flows`
- One screen, a tightly-scoped feature (empty state, notification settings), or a named app's
  specific screen → `search_screens` (name the app in the query to filter to it, e.g. "Coinbase
  notification settings screen")

**Default to a multi-app set, not a single result.** Unless the request names one specific app
(e.g. "Coinbase's checkout screen"), the point of this skill is comparing how several different
apps solve the same pattern and restyling all of them into one target — that comparison is the
default behavior, not something that only happens when the person explicitly asks for "a few" or
"the best ones." When Mobbin returns results from multiple source apps, pick a small, genuinely
varied set (different source apps, not near-duplicates of the same app) and restyle each one — say
what was excluded and why if you narrowed a larger result set down. Only restyle a single source
when the request named one specific app, or when Mobbin genuinely only returned one usable match.

**When the granularity is a flow (`search_flows`), default to a tight set of key screens per app —
not the full flow, and not a single screen either.** A full flow can run 10-17+ screens; reproducing
every one of them is more than a designer needs to evaluate a restyle at a glance, and it burns
Figma writes on near-duplicate or low-signal steps (an intermediate form field, a second address
line). The default is a small number per app — **aim for 3-5** — chosen to cover the flow's actual
shape: normally an entry/starting screen, one or two core decision or input steps, and the
completion/confirmation screen. Skip steps that don't add a materially different UI pattern to look
at. Say which screens were picked and, briefly, why (e.g. "cart, payment method, and confirmation —
skipping the intermediate address-form screens since they're mostly text fields, not a distinct
pattern"). If the person explicitly asks for the full flow, or for every screen, honor that instead
— this tight-by-default behavior only applies absent that ask. Either way, once you land on a
count, that's what you build — no separate negotiation step is needed for a *normal-sized* tight
set; only flag it explicitly and ask first if even the tight set is unusually large across the
chosen apps (e.g. more apps than usual, or a flow whose key steps alone still run long).

**Never build a screen you haven't actually looked at — that's the one thing this whole skill
exists to prevent.** `search_flows` returns image URLs for every screen in a flow, but only renders
a sample of them inline to keep the response size down — the rest exist in the returned data but
are not automatically shown to you. Whatever set of screens you land on (the default tight
key-screen set, or the full flow if that was explicitly requested), every single one you build must
be a screen whose actual rendered image you looked at first. Never fill in a step — a cart, an address
picker, a confirmation screen, anything — from general knowledge of what that app or that kind of
screen "usually" looks like just because it plausibly belongs in the sequence. If a step you want
is one of the ones that wasn't rendered inline, go get it: re-query with a scoped `search_screens`
call naming that specific step (e.g. "Amazon delivery address screen") — this reliably renders the
image and, as a bonus, gives a precise per-screen `mobbin_url` instead of one shared flow link. If
you still can't find a real screenshot for a step you wanted, drop that step — do not invent one to
fill the gap. The entire point of sourcing from Mobbin instead of working from general knowledge is
that the restyled output traces back to a real, established design — a screen you never looked at
is indistinguishable, in the handoff, from one you did, which quietly defeats that purpose. Citing
a `mobbin_url` next to a screen you didn't actually inspect is worse than citing nothing, because it
manufactures false confidence in something that was, in fact, made up.

## Step 4 — Match content to the target's real component vocabulary

For each source screen, before restyling: does the target file's Component Stylings section have
anything that matches this pattern?

- **Yes** → follow that component's spec exactly (radius, padding, color roles, typography token).
- **No** → this is the gap case from prior testing (e.g. a gamified app's tokens have no commerce
  component). Improvise the closest reasonable adaptation, but **flag it explicitly** in the
  handoff — name what was borrowed from an unrelated pattern and why. Never let an improvised
  match read with the same confidence as a documented one.

## Step 5 — Output (Figma only)

**If Figma isn't connected, say so plainly and stop.** There is no code fallback — don't reach for
HTML or SwiftUI to work around a missing Figma connection, since that's a different deliverable
than what was asked for, not a substitute for it.

- First make sure you know which file to write into — use the file URL/key from Step 0 rather than
  assuming or reusing a file from a previous, unrelated task. Then load the `figma-use` skill
  (mandatory prerequisite for `use_figma`) and build real nodes — auto-layout frames sized to the
  device dimensions from Step 0, text with the exact font/size/weight/letter-spacing from Step 2,
  fills bound to the exact hex, corner radii from the Shapes section. Work incrementally per the
  `figma-use` rules (small steps, screenshot to verify, return created node IDs). Position new
  top-level frames away from existing content on the page.
- **If iPad was chosen** (per Step 0's flag), the content stays phone-width and is centered on the
  wider frame exactly as agreed — never silently stretch it to fill the extra space, that would
  fabricate a tablet layout that was never actually designed.
- The incremental screenshots as you build **are** the preview — there's no separate approval gate
  before this counts as "done." Once every screen is built, say so explicitly and point to the
  frames by name/location rather than leaving the person to go find them.

## Handoff notes (always include)

- **A per-screen link table pairing the restyled output with its source** — this is the main
  point of the handoff, not an afterthought. For every restyled screen, give the Figma link (a
  direct node-id link into the specific frame, per Step 0's page-resolution rule — not just the
  file URL) *and* the Mobbin source it was built from (`mobbin_url`, the same link Mobbin gives for
  a screen or a flow) side by side, so the person can open both and compare without hunting for
  either one. A markdown table works well: columns for screen name, Figma link, Mobbin link. If a
  screen's Figma link can't be produced (e.g. it wasn't actually built, see Step 3's flow-scoping
  rule), don't list a Figma link for it — that gap is exactly what the table should make visible,
  not paper over.
- Which target file(s) were used.
- Any token that was approximated rather than found exactly, and why.
- Any component that had no match in the target file and was improvised.
- One-line reminder that this is a first-draft starting point, not a finished design decision.
