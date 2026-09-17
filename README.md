# design-exploration

## What this is

Designers exploring a new feature look at how established products approach a pattern — tools
like [Mobbin](https://mobbin.com) already exist so you can browse real screens for inspiration.

This project takes that one step further: pull a pattern from real products via Mobbin, point at
your target design system's real tokens, and see it restyled into your own colors, type, spacing,
and components instantly — across several source apps at once, so you can visualize more options,
faster.

## How to use it

It's a Claude Code skill called `design-exploration`. Copy `.claude/skills/design-exploration/`
and `design.md/ios-apps/` into your project (or clone this repo), then run it in any Claude Code
session.

Scoped deliberately narrow for now: **iOS apps only, Figma only.** No web patterns, no HTML or
SwiftUI output — just Mobbin's iOS app screens restyled straight into a Figma file.

It asks a few questions before it starts:
1. **Pattern** — a flow or screen, plus whether to narrow by app category (default: no, search
   broadly — this is always asked, not just offered when it seems relevant).
2. **Target** — which of the 200 bundled native iOS app design systems to restyle into.
3. **Figma file and page** — which file, and which specific page inside it, to write into, plus a
   device size.

A couple of tips:
- **Ask for a pattern or flow, not a single screen.** The search works best when the goal is
  pulling how several apps solve the same pattern — not just one app, not just one screen — so
  there's a set to restyle and compare. When the pattern is a flow, the default is a tight 3-5 key
  screens per app (entry, core steps, confirmation) — not every screen in the flow. Say so if you
  want the full flow instead.
- **No design system of your own yet? Use one of the bundled ones.** `design.md/ios-apps/` has
  200 real native iOS app systems (Coinbase's actual app, not just its site) to pick from.
- **Every restyled screen is grounded in a real screenshot it actually looked at** — the skill
  won't fill in a step from general knowledge of what an app "usually" looks like. If a wanted
  step wasn't found on Mobbin, it gets dropped rather than invented.
- **The handoff pairs each restyled screen with both its Figma link and its original Mobbin
  source link**, so you can open both and compare side by side.