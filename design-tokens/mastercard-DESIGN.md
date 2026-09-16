---
version: alpha
name: Mastercard-design-analysis
description: A warm, editorial payments brand built on putty-cream canvas, extreme border-radius (either tiny, 20-40px, or full-pill — nothing in between), and a signature motif of circular service portraits connected by hand-drawn orange orbital arcs. Institutional trust expressed through magazine-like restraint rather than fintech urgency.

colors:
  ink: "#141413"
  charcoal: "#262627"
  muted: "#696969"
  granite: "#555555"
  graphite: "#565656"
  dust-taupe: "#D1CDC7"
  canvas: "#F3F0EE"
  canvas-lifted: "#FCFBFA"
  surface-white: "#FFFFFF"
  surface-soft-bone: "#F4F4F4"
  signal-orange: "#CF4500"
  signal-orange-light: "#F37338"
  clay-brown: "#9A3A0A"
  link-blue: "#3860BE"
  logo-red: "#EB001B"
  logo-yellow: "#F79E1B"
  ghost-watermark: "#E8E2DA"
  on-primary: "#F3F0EE"
  on-dark: "#FFFFFF"

typography:
  hero:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 64px
    fontWeight: 500
    lineHeight: 1.0
    letterSpacing: -1.28px
  section:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 36px
    fontWeight: 500
    lineHeight: 1.22
    letterSpacing: -0.72px
  card-title:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 24px
    fontWeight: 500
    lineHeight: 1.2
    letterSpacing: -0.48px
  subhead:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.3
    letterSpacing: 0
  eyebrow:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.0
    letterSpacing: 0.56px
    textTransform: uppercase
  body:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 16px
    fontWeight: 450
    lineHeight: 1.4
    letterSpacing: 0
  nav-link:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.0
    letterSpacing: -0.48px
  button:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.0
    letterSpacing: -0.32px
  button-secondary:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 16px
    fontWeight: 450
    lineHeight: 1.3
    letterSpacing: 0
  consent:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.0
    letterSpacing: 0.13px
  footer-link:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 14px
    fontWeight: 450
    lineHeight: 1.43
    letterSpacing: 0
  footer-header:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 13px
    fontWeight: 700
    lineHeight: 1.08
    letterSpacing: 0.56px
    textTransform: uppercase
  ghost-watermark:
    fontFamily: "MarkForMC, 'Sofia Sans', Arial, sans-serif"
    fontSize: 96px
    fontWeight: 500
    lineHeight: 1.0
    letterSpacing: -1.92px

rounded:
  none: 0px
  xs: 3px
  sm: 6px
  md: 20px
  lg: 24px
  xl: 40px
  pill: 9999px
  full: 9999px

spacing:
  xxs: 8px
  xs: 16px
  sm: 24px
  md: 32px
  lg: 48px
  xl: 64px
  xxl: 96px
  section: 128px

components:
  button-primary:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: 6px 24px
  button-secondary:
    backgroundColor: "{colors.surface-white}"
    textColor: "{colors.ink}"
    typography: "{typography.button-secondary}"
    rounded: "{rounded.md}"
    padding: 6px 24px
  button-consent:
    backgroundColor: "{colors.signal-orange}"
    textColor: "{colors.on-dark}"
    typography: "{typography.consent}"
    rounded: "{rounded.lg}"
    padding: 1px 30px
  satellite-cta:
    backgroundColor: "{colors.surface-white}"
    textColor: "{colors.ink}"
    rounded: "{rounded.full}"
    size: 56px
  icon-circle-button:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    rounded: "{rounded.full}"
    size: 40px
  hero-media-frame:
    backgroundColor: "{colors.ink}"
    rounded: "{rounded.xl}"
  portrait-card:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.card-title}"
    rounded: "{rounded.full}"
    size: 300px
  pill-carousel-card:
    backgroundColor: "{colors.surface-white}"
    rounded: "{rounded.pill}"
  ghost-watermark-block:
    backgroundColor: transparent
    textColor: "{colors.ghost-watermark}"
    typography: "{typography.ghost-watermark}"
  search-input:
    backgroundColor: "{colors.surface-white}"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    padding: 12px 24px
  country-selector:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.on-dark}"
    rounded: "{rounded.pill}"
  nav-pill:
    backgroundColor: "{colors.surface-white}"
    textColor: "{colors.ink}"
    typography: "{typography.nav-link}"
    rounded: "{rounded.pill}"
    padding: 16px 40px
  footer:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.on-dark}"
    typography: "{typography.footer-link}"
    padding: 48px 100px
---

## Overview

Mastercard's experience reads like a warm, editorial magazine built from soft stone and signal
orange — not the sterile fintech white most payment brands default to. The canvas is a muted
putty-cream (`{colors.canvas}` — #F3F0EE), and nearly everything that matters is shaped like a
stadium, a pill, or a perfect circle. The signature gesture is **orbit and trajectory**: circular
image portraits connected by thin, hand-drawn-feeling orange arcs, each with a white "satellite"
micro-CTA docked onto its perimeter like a moon.

**Key Characteristics:**
- Warm cream canvas (`{colors.canvas}`) replaces white entirely — every surface is tinted.
- Extreme border-radius as design language: 20px, 24px, 40px, and full-pill dominate; the 8–16px
  middle ground that most systems live in is **absent**.
- Circular image portraits with attached white satellite-CTAs and traced-orange orbital paths.
- Ghost "watermark" headlines (cream-on-cream text) layered behind circle portraits.
- Ink-black primary CTAs (`{rounded.md}`, 20px) — Signal Orange is reserved for consent/legal only.
- Floating pill-shaped navigation that docks below the viewport top, never flush at y=0.

## Colors

### Brand
- **Ink Black** (`{colors.ink}` — #141413): Primary CTAs, headline text, footer surface. Slightly
  warm so it never reads jet-black on the cream canvas.
- **Mastercard Red/Yellow** (`{colors.logo-red}` #EB001B / `{colors.logo-yellow}` #F79E1B): Brand
  logo mark only — **never** a UI color.

### Accent
- **Signal Orange** (`{colors.signal-orange}` — #CF4500): Consent/legal actions and eyebrow dots
  only. Never a marketing CTA color — it reads as a compliance signal.
- **Signal Orange Light** (`{colors.signal-orange-light}` — #F37338): Carousel indicators and
  decorative orbital arcs — an attention cue, never body color.
- **Clay Brown** (`{colors.clay-brown}` — #9A3A0A): Secondary link-style buttons.

### Surface
- **Canvas** (`{colors.canvas}` — #F3F0EE): The default page background — warm, not white.
- **Canvas Lifted** (`{colors.canvas-lifted}` — #FCFBFA): One step lighter, for nested sections.
- **White** (`{colors.surface-white}` — #FFFFFF): Floating nav, modals, satellite CTAs.
- **Soft Bone** (`{colors.surface-soft-bone}` — #F4F4F4): Cool-gray alternative surface.

### Text
- **Ink** (`{colors.ink}` — #141413): Primary headline/body text.
- **Charcoal** (`{colors.charcoal}` — #262627): Softer text alternate.
- **Muted** (`{colors.muted}` — #696969): Secondary text, disabled states.
- **Granite/Graphite** (`{colors.granite}` #555555 / `{colors.graphite}` #565656): Inline accents.
- **Dust Taupe** (`{colors.dust-taupe}` — #D1CDC7): Very low-contrast "whisper" text.
- **Link Blue** (`{colors.link-blue}` — #3860BE): Inline links and informational callouts.
- **Ghost Watermark** (`{colors.ghost-watermark}` — #E8E2DA): Cream-on-cream watermark headlines.

## Typography

### Font Family
**MarkForMC** — Mastercard's proprietary geometric sans, used for essentially everything.
**MarkOffcForMC** ("Official" cut) appears in a minority of legal/form contexts. Fallback:
`Sofia Sans, Arial, sans-serif`.

### Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|---|---|---|---|---|---|
| `{typography.hero}` | 64px | 500 | 1.0 | -1.28px | Hero H1 |
| `{typography.section}` | 36px | 500 | 1.22 | -0.72px | Section heads, ghost watermarks |
| `{typography.card-title}` | 24px | 500 | 1.2 | -0.48px | Service/solution card titles |
| `{typography.subhead}` | 14px | 700 | 1.3 | 0 | Rarely used sub-heading |
| `{typography.eyebrow}` | 14px | 700 | 1.0 | 0.56px, uppercase | Section-category label + accent dot |
| `{typography.body}` | 16px | **450** | 1.4 | 0 | Default paragraph — the signature half-step weight |
| `{typography.nav-link}` | 16px | 500 | 1.0 | -0.48px | Nav links |
| `{typography.button}` | 16px | 500 | 1.0 | -0.32px | Primary button label |
| `{typography.button-secondary}` | 16px | 450 | 1.3 | 0 | Secondary/outlined button label |
| `{typography.consent}` | 13px | 400 | 1.0 | 0.13px | Consent/orange pill label |
| `{typography.footer-link}` | 14px | 450 | 1.43 | 0 | Footer link rows |
| `{typography.footer-header}` | 13px | 700 | 1.08 | 0.56px, uppercase | Footer column headers |
| `{typography.ghost-watermark}` | 96px | 500 | 1.0 | -1.92px | Oversized background watermark text |

### Principles
- **Weight 450 is load-bearing.** Body copy at 450 (not 400) creates an unusually soft reading
  tone — substituting plain 400 flattens the brand identity.
- **Tight negative tracking on headlines** (-2%) gives display text its editorial density.
- **Uppercase only on the eyebrow scale.** No shouty section titles anywhere else.
- **One-font system** — no serif or script accent for contrast; contrast comes from scale/weight.

### Note on Font Substitutes
MarkForMC is proprietary. **Sofia Sans** (Google Fonts) is the closest open-source match — it's
already in Mastercard's own fallback stack. **Inter** at weights 450/500/700 also works, with
slightly taller x-height. Preserve the -2% headline tracking and the 450 body weight (use
`font-weight: 450` on variable fonts, or 400 tightened ~-0.5% letter-spacing as compensation).

## Shapes

### Border Radius Scale

| Token | Value | Use |
|---|---|---|
| `{rounded.none}` | 0px | Reserved (essentially unused) |
| `{rounded.xs}` | 3px | Tiny decorative chips |
| `{rounded.sm}` | 6px | Cookie-banner micro-chips |
| `{rounded.md}` | 20px | Primary/secondary body CTAs — the signature button radius |
| `{rounded.lg}` | 24px | Consent/orange pill buttons, modal inner chips |
| `{rounded.xl}` | 40px | Hero media frames, large section containers |
| `{rounded.pill}` / `{rounded.full}` | 9999px | Full pill shapes and perfect circles — nav, carousel, portraits, footer selector |

The scale deliberately skips the 8–16px middle ground most systems live in — everything reads as
either **precise/small** (≤6px) or **soft/editorial** (20px+), with no in-between.

## Components

### Buttons
**`button-primary`** ("Ink Pill") — Background `{colors.ink}`, text `{colors.on-primary}` (cream,
not pure white), 1.5px border matching background, rounded `{rounded.md}` (20px), padding 6px 24px.

**`button-secondary`** ("Outlined Pill") — Background `{colors.surface-white}`, text `{colors.ink}`,
1.5px solid ink border, same radius/padding.

**`button-consent`** ("Orange Pill") — Background `{colors.signal-orange}`, text `{colors.on-dark}`,
rounded `{rounded.lg}` (24px), padding 1px 30px. Reserved for cookie/legal confirmations only.

**`satellite-cta`** — White circular micro-CTA (56px) with an ink arrow icon, docked onto the
bottom-right edge of a circular portrait, protruding ~40% outside it.

**`icon-circle-button`** — Transparent or white, rounded `{rounded.full}`, 40px minimum (80px for
hero video play).

### Cards
**`hero-media-frame`** — Dark/video background, rounded `{rounded.xl}` (40px) on all corners — the
most iconic Mastercard gesture. Never round less.

**`portrait-card`** — Perfect circle, 260–340px desktop diameter, square source cropped to circle,
paired with a `satellite-cta` and an eyebrow + `{typography.card-title}` beneath.

**`pill-carousel-card`** — Rounded `{rounded.pill}` or `{rounded.xl}`, full-bleed photography with
overlaid white pill chip labels.

**`ghost-watermark-block`** — `{typography.ghost-watermark}` in `{colors.ghost-watermark}`, layered
behind portrait circles, bleeding off the viewport edge.

### Forms
**`search-input`** — Collapses to a 48px circular button; expands to a pill (`{rounded.pill}`)
input with a 1px ink-at-50%-opacity border.

**`country-selector`** — Background `{colors.ink}`, text `{colors.on-dark}`, rounded
`{rounded.pill}`, 1px white-at-40%-opacity border.

### Navigation
**`nav-pill`** — Floating white pill, `{rounded.pill}`, ~24px top margin (never flush at y=0),
soft shadow `rgba(0,0,0,0.04) 0px 4px 24px`.

### Footer
**`footer`** — Background `{colors.ink}`, text `{colors.on-dark}`, 4-column link grid, large
conversational headline, `{typography.footer-header}` column labels.

## Elevation

| Level | Treatment | Use |
|---|---|---|
| 0 | No shadow | 95% of surfaces sit directly on cream canvas |
| 1 | `rgba(0,0,0,0.04) 0px 4px 24px` | Floating nav pill |
| 2 | `rgba(0,0,0,0.08) 0px 24px 48px` | Hero media frames, elevated cards |
| 3 | `rgba(0,0,0,0.25) 0px 70px 110px` | Rare dramatic feature-tile elevation |

Shadows act as **atmospheric cushioning**, not directional light — large spread, low opacity,
almost no hard-edged shadows anywhere in the system.

## Do's and Don'ts

### Do
- Use `{colors.canvas}` (cream) as the default background — never pure white.
- Mask service imagery as perfect circles, never rectangles.
- Attach a white satellite CTA to every circular portrait.
- Use weight 450 (not 400) for body paragraphs.
- Reserve Signal Orange for consent/legal actions only.

### Don't
- Don't use pure white as a page background.
- Don't round image frames at 8–16px — commit to full-pill, 40px, or full-circle only.
- Don't use Signal Orange for marketing CTAs.
- Don't mix typefaces — no serif or script accent.
- Don't drop hard shadows — elevation should use 48px+ spread and ≤10% opacity.

## Responsive Behavior

### Breakpoints

| Name | Width | Key Changes |
|---|---|---|
| Mobile | ≤ 767px | Nav pill shows logo + menu + search only; portraits stack single-column; hero drops to ~40px |
| Tablet | 768–1023px | Nav shows 2–3 truncated links; portraits arrange 2-up |
| Desktop | ≥ 1024px | Full 5-link nav; asymmetric portrait placement with orbital lines; hero at 64px |
| Wide | ≥ 1440px | Content caps ~1280px; gutters grow symmetrically |

## Iteration Guide

1. Focus on ONE component at a time.
2. Reference color names AND hex codes together.
3. Default backgrounds to `{colors.canvas}` — this single change shifts the whole mood toward
   Mastercard more than any other token.
4. When in doubt on radius, reach for one of three: 20px (buttons), 40px (hero/stadium), or
   9999px (pill/nav).

## Known Gaps

- MarkForMC is proprietary and licensed; Sofia Sans is the closest verified open-source substitute.
- Tablet breakpoint specifics were inferred from desktop/mobile captures — intermediate layouts
  may vary per section.
- The exact ghost-watermark cream tone varies per section (reads between #E8E2DA and #D1CDC7 in
  captures); `{colors.ghost-watermark}` uses the documented midpoint.
