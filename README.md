# design-exploration

## What this is

Designers exploring a new feature routinely look at how established products solve the same
problem — competitor analysis, inspiration boards, "how does X handle this" — for ideas worth
bringing into their own context, whether or not that context is a formally documented design
system. The point was never to copy a pattern as-is: it's seeing a structure or component you
hadn't considered actually rendered in your own colors, type, and components, so you can tell
whether it sparks anything worth taking further. Today, seeing that means eyeballing it or
rebuilding it by hand, one option at a time — which caps how many you'll realistically try.

This project accelerates that seeing step — not to replace the judgment call of what's worth
keeping, but to make exploring more options fast enough to actually do it. Pull a pattern from
real products via [Mobbin](https://mobbin.com) (a flow, a screen, or a section like a pricing
table), point at a
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