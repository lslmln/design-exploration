# design-exploration

## What this is

Designers exploring a new feature look at how established products approach a pattern — tools
like [Mobbin](https://mobbin.com) already exist so you can browse real screens for inspiration.

This project takes that one step further: pull a pattern from real products via Mobbin, point at
your target design system's real tokens, and see it restyled into your own colors, type, spacing,
and components instantly — across several source apps at once, so you can visualize more options,
faster.

Built with AI because:

1. **To build it** — this doesn't clear the bar to build by hand without a KPI behind it; AI made
   it cheap enough to just build.
2. **To run it** — matching an arbitrary pattern to an arbitrary system's real components, and
   being honest when nothing matches, needs judgment a fixed script can't give.

Runs through Claude Code with the Mobbin MCP server connected — no separate app, server, or API
key.

## How to use it

It's a Claude Code skill, not an app — clone this repo (or copy `.claude/skills/restyle-mobbin/`
and `design-tokens/` into your own project) and it's available in any Claude Code session: CLI,
desktop app, web, or IDE extension. No separate install, server, or API key.

Then just ask, in plain language:

> "Find [some UI pattern] on Mobbin and restyle it into [a brand]'s style" — e.g. *"Search Mobbin
> for onboarding flows and restyle them using Coinbase's design system"* or *"pull Stripe's
> checkout and redo it in Apple's style, write it to Figma."*

If your request doesn't say everything it needs, the skill asks — platform (web or iOS), pattern,
target design system, output format — one step at a time instead of guessing.

A couple of tips:
- **Ask for a pattern, not a single screen.** "Checkout flows" pulls several products' takes on the
  same problem to compare side by side; "the Stripe checkout screen" only pulls one.
- **No design system of your own yet? Use one of the bundled ones.** `design-tokens/` has 28 real
  website systems (Stripe, Linear, Airbnb, Apple...) and `design-tokens/ios-apps/` has 200 real
  native iOS app systems (Coinbase's actual app, not just its site) — pick whichever fits the
  platform you chose.