# Design — IT Ant ehf (itant.is)

## The concept: "IT consultAnt"

The brand is built on a single, tasteful pun: **IT Ant ≈ IT consult-Ant**. The
company is an IT **consultancy**, and the logo is a literal **ant**. The site
leans on this in the hero ("Your IT **consultАnt**.") and tone — clever, but
never jokey. Supporting line: *"Small team. Heavy lifting."* (ants carry many
times their own weight — competence and dependability, understated).

The personality target: **professional, competent, understated, trustworthy.**
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

1. **Header** — sticky, translucent; logo (SVG) + wordmark + nav + primary CTA.
2. **Hero** — eyebrow, headline with the "consultAnt" pun, sub-line, one-sentence
   description, primary + secondary CTAs, logo art.
3. **Services** — responsive grid of cards from `src/data/services.json`.
4. **Products / ventures** — dark band: G9 and CertainGuard lineage + links.
5. **Contact** — `mailto:` (no backend), Reykjavík note, response expectation.
6. **Footer** — © IT Ant ehf, current year, Reykjavík, Iceland.

## Logo usage

- Header & hero use the **SVG** (`/brand/itant-logo.svg`) for crispness.
- `favicon.svg` is a simplified ant mark (ink tile + amber ant) consistent with
  the brand; `apple-touch-icon` and OG image reuse the PNG logo assets.
- The footer logo is colour-inverted to white via CSS for the dark background.

## Motion

Minimal: subtle card hover lift and button translate. All transitions are
disabled under `prefers-reduced-motion`. No JavaScript is required to render or
read the page.
