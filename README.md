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

It asks you three questions before it starts:
1. **Pattern** — a flow or screen, optionally narrowed by app category.
2. **Target** — which of the 200 bundled native iOS app design systems to restyle into.
3. **Figma file** — which file to write into, plus a device size.

A couple of tips:
- **Ask for a pattern or flow, not a single screen.** The search works best when the goal is
  pulling a bunch of screens across several apps — not just one app, not just one screen — so
  there's a whole set to restyle and compare.
- **No design system of your own yet? Use one of the bundled ones.** `design.md/ios-apps/` has
  200 real native iOS app systems (Coinbase's actual app, not just its site) to pick from.