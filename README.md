# IT Ant ehf — website (itant.is)

Single-page, static **public landing** for **IT Ant ehf**, the senior
enterprise-architecture practice of **Anton Sigurjónsson**. Built with
[Astro](https://astro.build) (v5, static output) and hand-written CSS. Clean,
professional, fast, accessible.

> **Positioning:** a focused, senior enterprise-architecture practice — expertise
> first, contact understated, **LinkedIn as the primary call-to-action**. The
> tasteful **IT Ant ≈ IT consultAnt** wordplay is kept but understated. IT Ant is
> also the company behind **G9** (a product house, https://g9.is) and
> **CertainGuard** (https://certainguard.g9.is).

## Quick start

```powershell
npm install        # install dependencies (Node 18+; tested on Node 23)
npm run dev        # local dev server with hot reload  → http://localhost:4321
npm run build      # static build → dist/  (emits dist/index.html)
npm run preview    # serve the built dist/ locally
```

`npm run build` must complete cleanly and emit `dist/index.html`. The build also
emits `404.html`, `favicon.svg`, `robots.txt` and a sitemap.

## Project layout

```
webmaster/
├─ public/
│  ├─ brand/             # logo assets (pre-existing — keep)
│  ├─ favicon.svg        # ant mark (ink + amber)
│  └─ robots.txt
├─ src/
│  ├─ data/
│  │  ├─ site.json       # global copy: principal, hero, contact, lineage, SEO
│  │  └─ services.json   # the expertise cards (edit here)
│  ├─ components/Icon.astro
│  ├─ layouts/Base.astro # <head>, SEO/OG/Twitter, JSON-LD, footer
│  ├─ pages/
│  │  ├─ index.astro     # the single landing page (all sections)
│  │  └─ 404.astro
│  └─ styles/global.css  # design tokens + all styles
├─ astro.config.mjs      # site: https://itant.is, static output, sitemap
└─ docs/                 # DESIGN, CONTENT-UPDATES, DEPLOYMENT
```

## Editing content

Most copy lives in **`src/data/`** so non-developers can edit without touching
markup. See [`docs/CONTENT-UPDATES.md`](docs/CONTENT-UPDATES.md).

## Documentation

- [`docs/DESIGN.md`](docs/DESIGN.md) — palette (derived from the logo), fonts,
  information architecture, and the senior enterprise-architect positioning.
- [`docs/CONTENT-UPDATES.md`](docs/CONTENT-UPDATES.md) — how to edit expertise & copy.
- [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md) — Azure Static Web Apps + the publish gate.

## Publishing / gating

This `webmaster` clone is the **internal** (source) repo. The built static
output is published to a separate **public** repo (which Azure SWA deploys from)
**only** when an approver runs the gate script. Never commit `dist/` or
`node_modules/`.

```powershell
./scripts/publish.ps1          # dry run (build + stage)
./scripts/publish.ps1 -Push    # build + publish static output to the public repo
```

See [`GATING.md`](GATING.md) for the full repository & gating model.
