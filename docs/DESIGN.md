# Design — IT Ant ehf (itant.is)

## Positioning: a senior enterprise-architect practice

IT Ant ehf is presented as a **boutique, senior architecture practice** led by
**Anton Sigurjónsson**, a senior enterprise systems architect with many years of
experience. The site leads with **deep expertise and enterprise-grade
architecture** — calm, credible, and direct. The tone implies a hands-on,
one-principal practice **without ever saying "solo" or "one-man shop"**: instead
it leans on phrases like *"A focused, senior practice"*, *"you work with the
architect, not a sales team"*, and *"Direct access to a senior architect — not a
layer of account managers."* Restraint reads as seniority.

The "IT Ant ≈ IT consult**Ant**" wordplay is retained but kept **understated and
secondary** — a single muted line in the hero (`.hero__pun`), never the headline.

### Engagement model: LinkedIn-primary, contact-secondary

Sales CTAs are deliberately **de-emphasised**. The main way to engage is *"here's
who I am — see my background"*, so the **primary action everywhere is Anton's
LinkedIn profile** (header button and hero primary button:
*"View profile on LinkedIn"*). Contact is **quiet and secondary**: a slim
`mailto:` strip near the foot of the page (`.contact-strip`) plus a small
LinkedIn link in the footer — no big "Let's talk" hero buttons, no contact card.

The personality target: **senior, competent, understated, trustworthy.**
Lots of whitespace, restrained colour, strong typography, no gimmicks.

## Palette — derived from the logo

The logo (`public/brand/itant-logo.svg`) is a **solid black ant on white** — it
is monochrome. So the core palette is an honest **INK + PAPER** system taken
directly from the mark, plus **one** warm accent as a deliberate brand
extension (amber/earth tones nod to the ant motif without inventing a second
brand colour).

| Token | Hex | Role | Source |
|-------|-----|------|--------|
| `--ink` | `#111317` | Primary text, dark surfaces (header blur, ventures band, footer) | Logo black (`#000000`), softened a touch for screen comfort |
| `--ink-2` | `#1b1e24` | Raised dark cards on the ink band | Derived from `--ink` |
| `--paper` | `#ffffff` | Base background | Logo ground (white) |
| `--mist` | `#f6f6f3` | Alternating off-white section background | Tinted paper |
| `--line` | `#e6e5e0` | Hairline borders | Tinted paper |
| `--slate` | `#565b64` | Muted secondary text | Neutral, AA on paper (~6.7:1) |
| `--amber` | `#e08a1e` | Accent surfaces: buttons, underlines, icon tiles, marks | Brand extension (ant/earth) |
| `--amber-deep` | `#8a520b` | Accent **text** on paper (AA), link hover | Darkened amber for contrast |
| `--amber-soft` | `#fbf1e2` | Tinted accent backgrounds (icon tiles, hero glow, tags) | Lightened amber |
| `--on-ink` | `#f4f4f2` | Text on ink surfaces | — |
| `--on-ink-muted` | `#b9bcc2` | Secondary text on ink surfaces | — |

### Contrast / accessibility (WCAG AA)

- Body text `--ink` on `--paper`: ~17:1 (AAA).
- `--slate` on `--paper`: ~6.7:1 (AA for all text).
- Amber is **never** used as small body text on white. `--amber-deep` is used
  for any accent text on paper (AA). The primary button is `--amber` background
  with **ink** text (high contrast). Accent amber otherwise appears as
  backgrounds, borders, underlines and icon fills only.
- On the dark ink band, links use `--amber` (large/interactive) and body copy
  uses `--on-ink` / `--on-ink-muted`.
- Visible `:focus-visible` outlines; a skip-link; `prefers-reduced-motion`
  honoured; semantic landmarks (`header`/`main`/`section`/`footer`).

## Typography

A fast, dependency-free **system font stack** (no external font requests →
best performance, privacy, and offline builds):

- Display/headings (`--font-display`): `"Segoe UI", system-ui, ui-sans-serif, …`
  with tight tracking (`letter-spacing: -0.02em`) for a confident, modern feel.
- Body (`--font-sans`): `ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, …`

If a branded webfont is desired later, self-host a `.woff2` under
`public/fonts/` and swap the `--font-display` token (keep the system stack as
the fallback). Avoid third-party font CDNs for privacy/perf.

## Information architecture (single page)

1. **Header** — sticky, translucent; logo (SVG) + wordmark + nav; the primary
   button is **LinkedIn** ("View profile on LinkedIn"), not a sales CTA.
2. **Hero** — eyebrow, expertise-led headline (senior enterprise architecture),
   sub-line conveying boutique seniority, one-paragraph description, **LinkedIn
   as the primary action** + an "Areas of expertise" secondary link, and a muted
   "consultAnt" wordplay line. Logo art alongside.
3. **Expertise** — responsive grid of cards from `src/data/services.json`,
   reframed as **areas of expertise** for a senior enterprise architect.
4. **Products / ventures** — dark band: G9 and CertainGuard lineage + links
   (kept brief and secondary).
5. **Contact** — a deliberately **quiet strip**: a LinkedIn-first line plus a
   small `mailto:` + location (no backend, no contact card).
6. **Footer** — © IT Ant ehf, current year, Reykjavík; small LinkedIn link.

## Logo usage

- Header & hero use the **SVG** (`/brand/itant-logo.svg`) for crispness.
- `favicon.svg` is a simplified ant mark (ink tile + amber ant) consistent with
  the brand; `apple-touch-icon` and OG image reuse the PNG logo assets.
- The footer logo is colour-inverted to white via CSS for the dark background.

## Motion

Minimal: subtle card hover lift and button translate. All transitions are
disabled under `prefers-reduced-motion`. No JavaScript is required to render or
read the page.
