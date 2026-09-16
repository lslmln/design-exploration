---
version: alpha
name: Tesla-design-analysis
description: A digital showroom built on radical subtraction — one electric blue accent, three shades of dark gray, and white, with every ounce of visual weight carried by full-viewport product photography. No shadows, no gradients, no decorative borders; the interface exists only to get out of the way of the car.

colors:
  primary: "#3E6AE1"
  ink: "#171A20"
  body: "#393C41"
  muted: "#5C5E62"
  muted-soft: "#8E8E8E"
  hairline: "#EEEEEE"
  hairline-strong: "#D0D1D2"
  canvas: "#FFFFFF"
  surface-soft: "#F4F4F4"
  frosted-base: "#FFFFFF"
  scrim-base: "#808080"
  on-primary: "#FFFFFF"

typography:
  hero-display:
    fontFamily: "'Universal Sans Display', -apple-system, Arial, sans-serif"
    fontSize: 40px
    fontWeight: 500
    lineHeight: 1.20
    letterSpacing: 0
  product-name:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 17px
    fontWeight: 500
    lineHeight: 1.18
    letterSpacing: 0
  nav-link:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.20
    letterSpacing: 0
  body:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.43
    letterSpacing: 0
  button:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.20
    letterSpacing: 0
  sub-link:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.43
    letterSpacing: 0
  promo:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 22px
    fontWeight: 400
    lineHeight: 0.91
    letterSpacing: 0
  category-label:
    fontFamily: "'Universal Sans Text', -apple-system, Arial, sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.2
    letterSpacing: 0

rounded:
  none: 0px
  xs: 4px
  sm: 12px
  full: 9999px

spacing:
  xxs: 4px
  xs: 8px
  sm: 16px
  md: 21px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.xs}"
    height: 40px
    width: 200px
  button-secondary:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.body}"
    typography: "{typography.button}"
    rounded: "{rounded.xs}"
    height: 40px
    width: 200px
  button-nav:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.nav-link}"
    rounded: "{rounded.xs}"
    padding: 4px 16px
    height: 32px
  text-link:
    backgroundColor: transparent
    textColor: "{colors.muted}"
    typography: "{typography.sub-link}"
  card-category:
    rounded: "{rounded.sm}"
  card-vehicle:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.product-name}"
  text-input:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.body}"
  nav-global:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.nav-link}"
  chat-bar:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
---

## Overview

Tesla's interface is an exercise in radical subtraction — a digital showroom where the product is
everything and the UI is almost nothing. Full-viewport (100vh) cinematic photography carries all
emotional weight; there are no decorative borders, gradients, patterns, or shadows anywhere. Color
is almost ascetic: a single Electric Blue (`{colors.primary}` — #3E6AE1) for primary CTAs, three
shades of dark gray for text hierarchy, and white for everything else.

**Key Characteristics:**
- Full-viewport hero sections dominated by photography, minimal overlay UI.
- Near-zero UI decoration: no shadows, no gradients, no borders, no patterns.
- Single accent color — Electric Blue — used exclusively for primary CTA buttons, nowhere else.
- Universal Sans (Display + Text variants) unifies web, app, and in-car interfaces.
- Frosted-glass navigation that floats transparent over hero content, opaque white on scroll.
- 0.33s cubic-bezier transitions as the universal timing for every interactive state change.

## Colors

### Brand
- **Electric Blue** (`{colors.primary}` — #3E6AE1): The only chromatic color in the entire
  interface. Used exclusively for primary CTAs ("Order Now") and matching promo text.

### Surface
- **Canvas** (`{colors.canvas}` — #FFFFFF): Page background, nav, dropdowns, all surfaces.
- **Light Ash** (`{colors.surface-soft}` — #F4F4F4): Barely-perceptible alternate surface for
  section differentiation.
- **Frosted Glass** (`{colors.frosted-base}` — #FFFFFF, base hex of `rgba(255,255,255,0.75)`):
  Applied at 75% opacity for the nav backdrop-filter on scroll.
- **Scrim** (`{colors.scrim-base}` — #808080, base hex of `rgba(128,128,128,0.65)`): Applied at
  65% opacity for modal/cookie overlays.

### Text
- **Ink** (`{colors.ink}` — #171A20, "Carbon Dark"): Headings, nav labels, hero titles on light.
- **Body** (`{colors.body}` — #393C41, "Graphite"): Default paragraph text.
- **Muted** (`{colors.muted}` — #5C5E62, "Pewter"): Tertiary text, sub-links.
- **Muted Soft** (`{colors.muted-soft}` — #8E8E8E, "Silver Fog"): Placeholder text, disabled.

### Hairlines
- **Hairline** (`{colors.hairline}` — #EEEEEE): Light borders and dividers.
- **Hairline Strong** (`{colors.hairline-strong}` — #D0D1D2): Subtle UI border delineation.

No gradients are used anywhere in the interface — depth comes entirely from photography and
opacity-based layering (the frosted nav), never from a gradient token.

## Typography

### Font Family
- **Display**: `Universal Sans Display` — hero titles and large model names only.
- **Text / UI**: `Universal Sans Text` — navigation, body, buttons, everything else.

### Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|---|---|---|---|---|---|
| `{typography.hero-display}` | 40px | 500 | 1.20 | 0 | Hero titles, white on dark imagery |
| `{typography.product-name}` | 17px | 500 | 1.18 | 0 | Model names in nav panel and cards |
| `{typography.nav-link}` | 14px | 500 | 1.20 | 0 | Primary navigation labels |
| `{typography.body}` | 14px | 400 | 1.43 | 0 | Paragraph and descriptive content |
| `{typography.button}` | 14px | 500 | 1.20 | 0 | CTA button labels |
| `{typography.sub-link}` | 14px | 400 | 1.43 | 0 | Tertiary links (Learn, Order, Experience) |
| `{typography.promo}` | 22px | 400 | 0.91 | 0 | White promo text on hero |
| `{typography.category-label}` | 16px | 500 | ~1.2 (est.) | 0 | Labels on category cards |

### Principles
- **Normal letter-spacing everywhere** — unlike most tech brands, Tesla never tightens tracking.
- **Only two weights exist**: 500 (headings/UI) and 400 (body). No bold, no light.
- **No uppercase transforms** anywhere in nav or CTAs — lowercase reinforces calm confidence.

### Note on Font Substitutes
Universal Sans is Tesla's proprietary family (recently replacing Gotham). Use `-apple-system` /
system-ui as the practical open-source stand-in — the source's own fallback stack.

## Shapes

### Border Radius Scale

| Token | Value | Use |
|---|---|---|
| `{rounded.none}` | 0px | The default — sharp edges everywhere except the two exceptions below |
| `{rounded.xs}` | 4px | All buttons (primary, secondary, nav) — barely perceptible rounding |
| `{rounded.sm}` | 12px | Category cards — the only "noticeably rounded" surface |
| `{rounded.full}` | 9999px | Carousel dot indicators (documented as 50% / perfect circle) |

## Components

### Buttons
**`button-primary`** — Background `{colors.primary}`, text `{colors.on-primary}`, rounded
`{rounded.xs}` (4px), 200×40px, 3px solid transparent border (reserves space for a focus outline
animation). Used for "Order Now."

**`button-secondary`** — Background `{colors.canvas}`, text `{colors.body}`, identical dimensions.
Used for "View Inventory" alongside the primary.

**`button-nav`** — Background transparent, text `{colors.ink}`, rounded `{rounded.xs}`, padding
4px 16px, 32px min height.

**`text-link`** — Text `{colors.muted}`, no background, no border, underline on hover.

### Cards
**`card-category`** — Full-bleed landscape photography, rounded `{rounded.sm}` (12px), overflow
hidden, white label top-left, no shadow, no border, no overlay gradient.

**`card-vehicle`** — Background transparent, no border, no shadow; vehicle PNG + centered model
name (`{typography.product-name}`) + two text links beneath, in a 3-column grid.

### Forms
**`text-input`** — Background transparent, text `{colors.ink}`, placeholder `{colors.muted-soft}`,
minimal browser-default border.

### Navigation
**`nav-global`** — Transitions from transparent (over hero) to opaque `{colors.canvas}` on scroll;
centered wordmark + five category links + three icon buttons.

### Persistent Chat Bar
**`chat-bar`** — Background `{colors.canvas}`, subtle border, anchored to the viewport bottom.

## Elevation

| Level | Treatment | Use |
|---|---|---|
| Flat | No shadow, no border | Default — 95%+ of all surfaces |
| Frost | `rgba(255,255,255,0.75)` backdrop-filter | Nav on scroll |
| Overlay | `rgba(128,128,128,0.65)` | Modal/cookie overlays |

Tesla's approach to elevation is essentially none — depth comes from z-index layering, opacity, and
photography itself, never from box-shadow.

## Do's and Don'ts

### Do
- Let photography dominate every screen — the product IS the design.
- Use Electric Blue exclusively for primary CTAs, never decoratively.
- Keep typography at weight 400–500 only.
- Use 4px radius for every interactive element; 12px only for category-card photography.
- Keep all transitions at 0.33s.

### Don't
- Add shadows to any element.
- Use more than one chromatic color besides the blue CTA.
- Apply gradients or decorative backgrounds.
- Use text larger than 40px.
- Introduce pill buttons or large radii — 4px is deliberate and precise.

## Responsive Behavior

### Breakpoints

| Name | Width | Key Changes |
|---|---|---|
| Mobile | < 768px | Single column, hamburger nav, hero text ~28px, CTAs stack vertically |
| Tablet | 768–1024px | 2-column nav panel, CTAs stay side-by-side |
| Desktop | 1024–1440px | Full horizontal nav, 3-column vehicle grid, hero at 40px |
| Large Desktop | > 1440px | Content stays centered, photography scales to fill |

### Touch Targets
Primary CTAs at 200×40px (above WCAG AAA). Nav buttons at minimum 32px height.

## Iteration Guide

1. Focus on ONE component at a time — this system is minimal enough that every pixel matters.
2. Reference specific colors/hex from this doc — there are only ~10 colors total.
3. Describe "feel" alongside measurement — "gallery-like silence between sections" communicates
   the whitespace philosophy better than a raw margin value.
4. If a generated screen feels "designed," it's too much — the UI should recede.

## Known Gaps

- Universal Sans is proprietary; only the system-ui/-apple-system fallback is verified.
- Spacing system beyond the 8px base unit and a few observed values (8px, 16px, ~21px) was not
  fully documented — section-level vertical rhythm and grid max-widths are approximate.
- No dark-mode, hover-animation, or hero hero hero grid multi-copy variants were captured.
