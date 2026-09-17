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
and `design.md/` into your project (or clone this repo), then run it in any Claude Code
session.

It asks you four questions before it starts:
1. **Platform** — web or app (iOS)?
2. **Pattern** — a flow, a screen, or (web only) a page section, optionally narrowed by app
   category.
3. **Target** — the design system to restyle into.
4. **Output** — Figma or HTML for web; Figma or SwiftUI for iOS, plus a device size either way.

A couple of tips:
- **Ask for a pattern or flow, not a single screen.** The search works best when the goal is
  pulling a bunch of screens across several apps — not just one app, not just one screen — so
  there's a whole set to restyle and compare.
- **No design system of your own yet? Use one of the bundled ones.** `design.md/` has 28 real
  website systems (Stripe, Linear, Airbnb, Apple...) and `design.md/ios-apps/` has 200 real
  native iOS app systems (Coinbase's actual app, not just its site) — pick whichever fits the
  platform you chose.