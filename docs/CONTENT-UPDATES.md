# Content updates — IT Ant ehf

Most editable copy lives in **`src/data/`** as plain JSON so you can change text
without touching markup. After any edit, run `npm run build` and preview before
publishing through the gate (see `docs/DEPLOYMENT.md`).

## 1. Services (the cards) — `src/data/services.json`

An array of objects. Each becomes one card, in order. Add, remove or reorder
freely (the grid reflows; 3–6 cards looks best).

```json
{
  "title": "IT consulting & advisory",
  "summary": "One buyer-friendly sentence describing the value.",
  "icon": "compass"
}
```

- `title` — short, plain-language service name.
- `summary` — one outcome-focused sentence (keep it tight).
- `icon` — one of the available icon keys (see below).

### Available icon keys

`compass`, `code`, `cloud`, `shield`, `gear`, `pulse` (and for contact:
`mail`, `pin`, `clock`).

To add a new icon, open `src/components/Icon.astro` and add a key with its inline
SVG `<path>` markup to the `paths` map, then reference that key in
`services.json`. Icons inherit colour via `currentColor`.

## 2. Headline, tagline, description, contact, lineage — `src/data/site.json`

| Key | What it controls |
|-----|------------------|
| `tagline` | Reserved tagline string (the hero headline itself is in `index.astro` to keep the styled "consultAnt" pun). |
| `subtagline` | Hero sub-line ("Small team. Heavy lifting."). |
| `heroDescription` | The one-sentence hero description. |
| `primaryCtaLabel` | Button label ("Get in touch"). |
| `email` | Contact email — drives every `mailto:` link. |
| `location`, `locality`, `country` | Reykjavík / Iceland notes (contact + footer + JSON-LD). |
| `registrationNo` | Company registration no. (kennitala) — **placeholder**, replace. |
| `lineage.*` | G9 / CertainGuard band copy and links. |
| `seo.title`, `seo.description` | `<title>` and meta description / OG / Twitter. |
| `seo.ogImage` | Social share image (path under `public/`). |

> The hero `<h1>` ("Your IT **consultAnt**.") lives in `src/pages/index.astro`
> because the pun word is individually styled. Edit it there if you change the
> headline.

## 3. Section intros / labels

Section eyebrows and headings (e.g. "What we do", "Products & ventures",
"Get in touch") are in `src/pages/index.astro`. They're short and clearly
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
