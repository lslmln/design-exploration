# design-exploration

## What this is

Designers researching a new feature usually browse real screens from other products for
inspiration, then have to manually rebuild whatever's useful in their own design system by hand.
This project skips that manual step: search [Mobbin](https://mobbin.com) for a UI pattern (a flow,
a screen, or a section like a pricing table), point at a target design system's real tokens, and
get that pattern restyled into the target's actual colors, type, spacing, and components —
instantly, no rebuilding by hand.

It's built to run through Claude Code with the Mobbin MCP server connected — there's no separate
app, server, or API key to manage.

## Status

Working end to end. Restyling writes real nodes directly into Figma via the Figma MCP server; if
Figma isn't connected, it falls back to a self-contained HTML preview instead of blocking. 28
reference design systems are bundled as restyle targets (see `design-tokens/`) — no personal
design-system file exists yet, so today every run either targets one of those 28 or a stand-in you
name explicitly.

Code output is matched to the *source* pattern's platform rather than one-size-fits-all: a
web-sourced pattern (a flow, a web screen, or a section) falls back to HTML; a mobile-sourced
pattern (an iOS screen from Mobbin) falls back to a SwiftUI view file instead.

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

- `design-tokens/` — 28 reference design-system token files used as restyle targets: Apple,
  Airbnb, Coinbase, Binance, Claude, Clay, Cursor, Discord, ElevenLabs, Framer, IBM, Kraken,
  Linear, Mastercard, Meta, Miro, MongoDB, Nike, Notion, Revolut, SpaceX, Stripe, Supabase, Tesla,
  Uber, Vercel, Wise, xAI. Each file uses the same `colors:`/`typography:`/`rounded:`/`spacing:`/
  `components:` schema so the skill can parse it rigorously instead of eyeballing values.
- `previews/` — code fallback output for when Figma isn't connected, matched to the source
  pattern's platform. `dashboard-empty-state-airbnb.html` (web-sourced, rendered and verified with
  a headless browser) and `swiftui/CoinbaseNotificationSettingsView.swift` (iOS-sourced, hand-written
  and **unverified** — no Swift toolchain exists in this environment; open it in Xcode to confirm).
- `.claude/skills/restyle-mobbin/` — the workflow skill itself.