---
version: alpha
name: Kraken-design-analysis
description: A clean, trustworthy crypto exchange that commands attention with a single confident purple rather than fintech's usual blue or green. White canvas, near-black text, and a 12px-max button radius (deliberately never full-pill) give it a precise, "serious application" feel distinct from the editorial calm of Coinbase or the playful softness of consumer apps.

colors:
  primary: "#7132f5"
  primary-dark: "#5741d8"
  primary-deep: "#5b1ecf"
  primary-subtle: "#855bfb"
  ink: "#101114"
  body: "#686b82"
  muted: "#9497a9"
  hairline: "#dedee5"
  canvas: "#ffffff"
  surface-neutral-tint: "#9497a9"
  on-primary: "#ffffff"
  semantic-up: "#149e61"
  semantic-up-text: "#026b3f"
  neutral-badge-text: "#484b5e"

typography:
  display-hero:
    fontFamily: "Kraken-Brand, 'IBM Plex Sans', Helvetica, Arial, sans-serif"
    fontSize: 48px
    fontWeight: 700
    lineHeight: 1.17
    letterSpacing: -1px
  display-section:
    fontFamily: "Kraken-Brand, 'IBM Plex Sans', Helvetica, Arial, sans-serif"
    fontSize: 36px
    fontWeight: 700
    lineHeight: 1.22
    letterSpacing: -0.5px
  display-sub:
    fontFamily: "Kraken-Brand, 'IBM Plex Sans', Helvetica, Arial, sans-serif"
    fontSize: 28px
    fontWeight: 700
    lineHeight: 1.29
    letterSpacing: -0.5px
  title-md:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 22px
    fontWeight: 600
    lineHeight: 1.20
    letterSpacing: 0
  body-md:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
  body-strong:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.38
    letterSpacing: 0
  button:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 1.38
    letterSpacing: 0
  caption:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.43
    letterSpacing: 0
  small:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.33
    letterSpacing: 0
  micro:
    fontFamily: "Kraken-Product, 'Helvetica Neue', Helvetica, Arial, sans-serif"
    fontSize: 7px
    fontWeight: 500
    lineHeight: 1.0
    letterSpacing: 0
    textTransform: uppercase

rounded:
  none: 0px
  xs: 3px
  sm: 6px
  md: 8px
  lg: 10px
  xl: 12px
  pill: 9999px
  full: 9999px

spacing:
  xxs: 1px
  xs: 2px
  sm: 4px
  ms: 6px
  md: 8px
  base: 12px
  lg: 16px
  xl: 20px
  xxl: 24px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.xl}"
    padding: 13px 16px
  button-outlined:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.primary-dark}"
    typography: "{typography.button}"
    rounded: "{rounded.xl}"
    padding: 13px 16px
  button-subtle:
    backgroundColor: "{colors.primary-subtle}"
    textColor: "{colors.primary}"
    typography: "{typography.button}"
    rounded: "{rounded.xl}"
    padding: 8px
  button-white:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.lg}"
  button-secondary-gray:
    backgroundColor: "{colors.surface-neutral-tint}"
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.xl}"
  badge-success:
    backgroundColor: "{colors.semantic-up}"
    textColor: "{colors.semantic-up-text}"
    rounded: "{rounded.sm}"
  badge-neutral:
    backgroundColor: "{colors.surface-neutral-tint}"
    textColor: "{colors.neutral-badge-text}"
    rounded: "{rounded.md}"
---

## Overview

Kraken is a clean, trustworthy crypto exchange that leads with a single commanding brand color —
Kraken Purple (`{colors.primary}` — #7132f5) — rather than the blue or green most fintech and
trading apps default to. The design runs on white backgrounds with near-black text
(`{colors.ink}` — #101114) and a cool blue-gray neutral scale. Two proprietary typefaces split the
work: **Kraken-Brand** for bold, tight-tracked display headings, and **Kraken-Product** (with IBM
Plex Sans fallback) as the UI workhorse.

**Key Characteristics:**
- Kraken Purple (`{colors.primary}`) as the sole primary brand color, with two darker variants
  (`{colors.primary-dark}`, `{colors.primary-deep}`) for outlined/pressed states.
- A dual-font system: Kraken-Brand (display) + Kraken-Product (UI) — never mixed within one role.
- 12px is the hard ceiling on button radius — deliberately rounded, never pill-shaped. This is the
  system's most distinctive constraint and the opposite of Coinbase's/Airbnb's pill-CTA grammar.
- Whisper-level shadows (`rgba(0,0,0,0.03) 0px 4px 24px`) — barely perceptible elevation.
- Green (`{colors.semantic-up}`) reserved for success/positive states only.

## Colors

### Brand
- **Kraken Purple** (`{colors.primary}` — #7132f5): Primary CTA, brand accent, links.
- **Purple Dark** (`{colors.primary-dark}` — #5741d8): Outlined-button borders/text.
- **Purple Deep** (`{colors.primary-deep}` — #5b1ecf): The deepest purple variant.
- **Purple Subtle** (`{colors.primary-subtle}` — #855bfb, base hex of `rgba(133,91,251,0.16)`):
  Applied at **16% opacity** as a subtle button background — never at full strength as a fill.

### Neutral
- **Ink** (`{colors.ink}` — #101114): Primary text.
- **Body** (`{colors.body}` — #686b82, "Cool Gray"): Primary neutral, borders at 24% opacity.
- **Muted** (`{colors.muted}` — #9497a9, "Silver Blue"): Secondary text, muted elements.
- **Surface Neutral Tint** (`{colors.surface-neutral-tint}` — #9497a9, base hex of
  `rgba(148,151,169,0.08)`): The same RGB as Muted, but applied at **8% opacity** as a background
  fill for secondary-gray buttons — a dual-purpose token distinguished by usage, not value.
- **Hairline** (`{colors.hairline}` — #dedee5): Divider borders.
- **Canvas** (`{colors.canvas}` — #ffffff): Primary surface.

### Semantic
- **Success** (`{colors.semantic-up}` — #149e61, base hex of `rgba(20,158,97,0.16)`): Positive
  state badges, applied at 16% opacity as a background fill.
- **Success Text** (`{colors.semantic-up-text}` — #026b3f): Text inside success badges.
- **Neutral Badge Text** (`{colors.neutral-badge-text}` — #484b5e): Text inside neutral badges,
  paired with `{colors.surface-neutral-tint}` at 12% opacity as the badge background.

## Typography

### Font Family
- **Display**: `Kraken-Brand`, fallback `IBM Plex Sans, Helvetica, Arial`.
- **UI / Body**: `Kraken-Product`, fallback `Helvetica Neue, Helvetica, Arial`.

### Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|---|---|---|---|---|---|
| `{typography.display-hero}` | 48px | 700 | 1.17 | -1px | Hero headline |
| `{typography.display-section}` | 36px | 700 | 1.22 | -0.5px | Section heading |
| `{typography.display-sub}` | 28px | 700 | 1.29 | -0.5px | Sub-heading |
| `{typography.title-md}` | 22px | 600 | 1.20 | 0 | Feature titles |
| `{typography.body-md}` | 16px | 400 | 1.38 | 0 | Default body |
| `{typography.body-strong}` | 16px | 500 | 1.38 | 0 | Emphasized body |
| `{typography.button}` | 16px | 600 | 1.38 | 0 | Button labels — source documents a 500–600 range; 600 is used here as the confident upper bound |
| `{typography.caption}` | 14px | 400 | 1.43 | 0 | Captions — source range is 1.43–1.71 line-height; 1.43 (tightest) used as the default |
| `{typography.small}` | 12px | 400 | 1.33 | 0 | Small print |
| `{typography.micro}` | 7px | 500 | 1.0 | 0, uppercase | Micro labels |

### Note on Font Substitutes
Kraken-Brand and Kraken-Product are proprietary. Use **IBM Plex Sans** for display and **Helvetica
Neue** (or system sans) for UI text — both are already Kraken's own documented fallback stack, so
no additional substitution judgment is needed.

## Shapes

### Border Radius Scale

| Token | Value | Use |
|---|---|---|
| `{rounded.none}` | 0px | Reserved (essentially unused) |
| `{rounded.xs}` | 3px | Tiny decorative elements |
| `{rounded.sm}` | 6px | Success badges |
| `{rounded.md}` | 8px | Neutral badges |
| `{rounded.lg}` | 10px | White utility buttons |
| `{rounded.xl}` | 12px | **The button ceiling** — primary, outlined, subtle, and secondary buttons all cap here |
| `{rounded.pill}` / `{rounded.full}` | 9999px | Documented in the source scale but explicitly **not used on buttons** — see Don'ts |

## Components

### Buttons

**`button-primary`** — Background `{colors.primary}`, text `{colors.on-primary}`, padding 13px
16px, rounded `{rounded.xl}` (12px, the maximum).

**`button-outlined`** — Background `{colors.canvas}`, text `{colors.primary-dark}`, 1px solid
`{colors.primary-dark}` border, same padding and radius as primary.

**`button-subtle`** — Background `{colors.primary-subtle}` at 16% opacity, text `{colors.primary}`,
padding 8px, rounded `{rounded.xl}`.

**`button-white`** — Background `{colors.canvas}`, text `{colors.ink}`, rounded `{rounded.lg}`
(10px), whisper shadow `rgba(0,0,0,0.03) 0px 4px 24px`.

**`button-secondary-gray`** — Background `{colors.surface-neutral-tint}` at 8% opacity, text
`{colors.ink}`, rounded `{rounded.xl}`.

### Badges

**`badge-success`** — Background `{colors.semantic-up}` at 16% opacity, text
`{colors.semantic-up-text}`, rounded `{rounded.sm}` (6px).

**`badge-neutral`** — Background `{colors.surface-neutral-tint}` at 12% opacity, text
`{colors.neutral-badge-text}`, rounded `{rounded.md}` (8px).

## Elevation

| Level | Treatment | Use |
|---|---|---|
| Subtle | `rgba(0,0,0,0.03) 0px 4px 24px` | White utility buttons |
| Micro | `rgba(16,24,40,0.04) 0px 1px 4px` | Rare, minimal hover hints |

## Do's and Don'ts

### Do
- Use Kraken Purple (`{colors.primary}`) for CTAs and links.
- Cap every button radius at 12px (`{rounded.xl}`).
- Use Kraken-Brand for headings, Kraken-Product for body.

### Don't
- Don't use pill-shaped buttons — 12px is the documented maximum radius for any button.
- Don't introduce purples outside the defined three-value scale.

## Responsive Behavior

### Breakpoints
375px, 425px, 640px, 768px, 1024px, 1280px, 1536px. Section-level responsive behavior (nav
collapse, grid reflow) was not captured in the source material — see Known Gaps.

## Iteration Guide

1. Focus on one component at a time. Reference YAML keys directly.
2. Never exceed `{rounded.xl}` (12px) on a button — this is Kraken's defining shape constraint.
3. Kraken-Brand carries headings only; Kraken-Product carries everything else.
4. Purple stays scarce — one CTA moment per section, echoing Coinbase's restraint but with a
   harder-edged, less-pill shape language.

## Known Gaps

- Source material is component/token-focused (buttons, badges, typography scale) rather than a
  full marketing-page capture — no hero/section/footer layout patterns, section spacing rhythm, or
  grid/container widths were documented. Treat this file as strong for UI components (forms,
  buttons, badges, notification rows) and weak for full-page composition.
- Kraken-Brand and Kraken-Product are proprietary; only the documented fallback stack (IBM Plex
  Sans / Helvetica Neue) is verified as a substitute.
- Dark mode, hover states, and animation timings were not present in the source.
