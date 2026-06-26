# Content updates — IT Ant ehf

Most editable copy lives in **`src/data/`** as plain JSON so you can change text
without touching markup. After any edit, run `npm run build` and preview before
publishing through the gate (see `docs/DEPLOYMENT.md`).

> **Positioning (keep the tone):** IT Ant is a **focused, senior enterprise
> architecture practice** led by Anton Sigurjónsson. Lead with expertise; keep
> contact understated; **LinkedIn is the primary call-to-action**. Imply the
> boutique/one-principal nature through tone (*"a focused, senior practice"*,
> *"you work with the architect, not a sales team"*) — never say "solo" or
> "one-man shop". Don't reintroduce big "Let's talk" sales CTAs.

## 1. Areas of expertise (the cards) — `src/data/services.json`

An array of objects. Each becomes one card, in order. These are framed as
**areas of expertise** for a senior enterprise architect (adjust freely; 4–6
cards looks best). Keep the tone senior and the one-liners buyer-friendly.

```json
{
  "title": "Enterprise & solution architecture",
  "summary": "One senior, buyer-friendly sentence describing the value.",
  "icon": "compass"
}
```

- `title` — short, senior-sounding area of expertise.
- `summary` — one outcome-focused sentence (keep it tight).
- `icon` — one of the available icon keys (see below).

### Available icon keys

`compass`, `code`, `cloud`, `shield`, `gear`, `pulse`, `linkedin` (and for
contact: `mail`, `pin`, `clock`).

To add a new icon, open `src/components/Icon.astro` and add a key with its inline
SVG `<path>` markup to the `paths` map, then reference that key in
`services.json`. Icons inherit colour via `currentColor`.

## 2. Hero, principal, contact, lineage — `src/data/site.json`

| Key | What it controls |
|-----|------------------|
| `principal.name` | The architect's name (Anton Sigurjónsson). |
| `principal.title` | His title — **confirm exact wording** (e.g. "Senior Enterprise Systems Architect"). |
| `principal.linkedinUrl` | LinkedIn profile — drives the **primary** header/hero buttons and footer link. |
| `principal.linkedinLabel` | LinkedIn button label ("View profile on LinkedIn"). |
| `tagline` | Reserved tagline string (the hero `<h1>` itself is in `index.astro`). |
| `subtagline` | Hero sub-line (boutique-seniority one-liner). |
| `heroDescription` | The hero description paragraph. |
| `email` | Contact email — drives the quiet `mailto:` strip. |
| `location`, `locality`, `country` | Mosfellsb\u00e6r / Iceland notes (contact + footer + JSON-LD). |
| `registrationNo` | Company registration no. (kennitala) — **placeholder**, replace. |
| `lineage.*` | G9 / CertainGuard band copy and links. |
| `seo.title`, `seo.description` | `<title>` and meta description / OG / Twitter. |
| `seo.ogImage` | Social share image (path under `public/`). |

> The hero `<h1>` and the muted "consult**Ant**" wordplay line live in
> `src/pages/index.astro` because they are individually styled. Edit them there
> if you change the headline.

## 3. Section intros / labels

Section eyebrows and headings (e.g. "Areas of expertise", "Products & ventures",
the contact strip) are in `src/pages/index.astro`. They're short and clearly
marked; edit inline.

## 4. Footer

Year is automatic. Company name and location come from `site.json` via
`src/layouts/Base.astro`.

## Checklist after editing

```powershell
npm run build      # must succeed and emit dist/index.html
npm run preview    # eyeball the result at http://localhost:4321
```

Then commit to the internal repo and publish via the gate.
