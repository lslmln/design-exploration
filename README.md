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

Early spike. Currently validating restyle quality and different ways of searching (flows vs.
sections, different UI patterns, multiple target systems at once) before building a permanent
output pipeline. Output today is HTML previews for fast visual testing; direct Figma output is in
progress.

## How to use it

1. Have a target design system's tokens as a `getdesign.md`-style file (see `design-tokens/` for
   examples covering Apple, Airbnb, and Coinbase — exact colors, type scale, spacing/radius, and
   named components).
2. In Claude Code, ask it to search Mobbin for a pattern and restyle the result using one of those
   token files — e.g. *"Search Mobbin for onboarding flows and restyle them using
   `design-tokens/coinbase-DESIGN.md`"*.
3. Claude searches Mobbin, reads the token file, and produces a restyled preview — flagging any
   part of the source that has no matching component in the target system, rather than guessing
   silently.

## Repo layout

- `design-tokens/` — reference design-system token files used as restyle targets.