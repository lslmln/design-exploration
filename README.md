# design-exploration

## What this is

Designers exploring a new feature routinely look at how established products solve the same
problem — competitor analysis, inspiration boards, "how does X handle this" — then adapt what
they find into their own context, whether or not that context is a formally documented design
system. That adaptation step is manual today: find the pattern, eyeball or rebuild it, restyle it
by hand.

This project accelerates that step — not to replace the judgment call of what to adapt, but to
make exploration itself faster and wider. Pull a pattern from real products via
[Mobbin](https://mobbin.com) (a flow, a screen, or a section like a pricing table), point at a
target design system's real tokens, and see it restyled into the target's actual colors, type,
spacing, and components instantly — across several source apps at once, not one at a time. It
extends what's possible past manually browsing Mobbin: the bottleneck moves from "how many
examples can I stand to rebuild by hand" to "how many do I want to compare."

It's built with AI deliberately, for two different reasons:

1. **Why AI to build it.** A bespoke tool like this doesn't clear the bar to build by hand — the
   engineering cost isn't justified without a KPI behind it, so it'd only make sense as a passion
   project. AI collapses that cost enough to build it at all, in a fraction of the time.
2. **Why AI to run it.** The core operation needs judgment a fixed script can't provide: matching
   an arbitrary source pattern to an arbitrary target's real component vocabulary, and being honest
   when nothing matches instead of silently guessing. That's not a nice-to-have wrapped around a
   deterministic pipeline — it's the reason this has to be AI-driven rather than scripted.

It's built to run through Claude Code with the Mobbin MCP server connected — there's no separate
app, server, or API key to manage.

## Status

Working end to end. Restyling writes real nodes directly into Figma via the Figma MCP server; if
Figma isn't connected, it falls back to a self-contained HTML preview instead of blocking. No
personal design-system file exists yet, so today every run either targets a bundled reference file
or a stand-in you name explicitly.

Both the search and the output are matched to a platform (web or app/iOS) chosen upfront, rather
than discovered after the fact — code output falls back to HTML for a web-sourced pattern and
SwiftUI for an iOS-sourced one, and the platform choice also controls which Mobbin tools and which
output formats are even offered, so a mismatch (e.g. restyling a web checkout flow as SwiftUI)
never happens by accident. The platform choice also picks which reference pool to search: 28
website design systems for web, or 200 native iOS app design systems for app (see Repo layout).

**Genuinely out of scope**: actually opening Xcode Simulator to show you a live rendered result.
This runs through Claude Code, which for this project runs in a cloud/remote Linux session with no
macOS, no Xcode, and no Swift toolchain at all — so the SwiftUI output above is written by hand and
**not compiled or verified** the way the HTML path is (that one *is* rendered with a headless
browser before being handed off). Open the `.swift` file in Xcode yourself to confirm it builds and
to see it in Simulator or the Preview canvas — that's the only place either can actually happen.

## How to use it

Just ask, in plain language — no special syntax needed:

> "Find [some UI pattern] on Mobbin and restyle it into [a brand]'s style" — e.g. *"Search Mobbin
> for onboarding flows and restyle them using Coinbase's design system"* or *"pull Stripe's
> checkout and redo it in Apple's style, write it to Figma."*

If your request doesn't already specify both a target design system and what to search for, the
skill asks you interactively (via a structured multiple-choice prompt, not an open-ended "what do
you want?") rather than guessing — listing whatever's actually in `design-tokens/` as options.

Once resolved, Claude parses the target file's exact colors/type/spacing (never eyeballed),
searches Mobbin at the right granularity (a whole flow, a single screen, or a section/component),
and restyles the result — flagging explicitly whenever a source pattern has no real match in the
target's documented components, rather than silently improvising with the same confidence as a
verified match.

## Repo layout

- `design-tokens/` — 28 **website** design-system token files used as web restyle targets: Apple,
  Airbnb, Coinbase, Binance, Claude, Clay, Cursor, Discord, ElevenLabs, Framer, IBM, Kraken,
  Linear, Mastercard, Meta, Miro, MongoDB, Nike, Notion, Revolut, SpaceX, Stripe, Supabase, Tesla,
  Uber, Vercel, Wise, xAI. Each file uses the same `colors:`/`typography:`/`rounded:`/`spacing:`/
  `components:` schema so the skill can parse it rigorously instead of eyeballing values.
- `design-tokens/ios-apps/` — 200 **native iOS app** design systems (not websites), organized by
  category (finance, social, messaging, travel, music, fitness, productivity, dating, food, video,
  misc) — e.g. `finance/coinbase/DESIGN.md` documents Coinbase's actual app, a genuinely different
  document from `design-tokens/coinbase-DESIGN.md` (its website). Each app also ships a
  `DESIGN-swiftui.md` sibling with ready `Color`/`Font` extensions and sample SwiftUI views. Sourced
  from [Meliwat/awesome-ios-design-md](https://github.com/Meliwat/awesome-ios-design-md) (MIT —
  see `ios-apps/ATTRIBUTION.md`); these are prose-format (no YAML front matter), which the skill
  parses with the same rigor by reading the exact table row/bullet instead of a YAML key.
- `previews/` — code fallback output for when Figma isn't connected, matched to the source
  pattern's platform. A multi-brand comparison is a folder (e.g. `signup-flows-linear/`,
  `duolingo-checkout-comparison/`) with an `index.html` contents page — live iframe thumbnails
  linking out to one real, full-bleed page per source app, each rendered at the actual breakpoint
  (real desktop width for web, the exact chosen device width for app) rather than an illustrated
  browser or phone mockup — plus a single-file example (`dashboard-empty-state-airbnb.html`). All
  HTML is rendered and verified with a headless browser before handoff. `swiftui/` holds the
  matching SwiftUI files for iOS-sourced patterns (e.g. `CoinbaseNotificationSettingsView.swift`,
  `DuolingoCheckoutComparison.swift`) — hand-written and **unverified**, since no Swift toolchain
  exists in this environment; each ships with an HTML companion at real device width so you can see
  it without Xcode, but open the `.swift` file there yourself to confirm it builds.
- `.claude/skills/restyle-mobbin/` — the workflow skill itself.