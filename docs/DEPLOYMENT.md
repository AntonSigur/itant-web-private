# Deployment — IT Ant ehf (itant.is)

The site is a **static** Astro build (`output: 'static'`) hosted on
**Azure Static Web Apps (SWA)**. Deployment is **gated**: source lives in the
internal repo, and only the built static output is published to a separate
public repo that Azure SWA deploys from.

## The gating model (summary)

| Repo | Holds | Audience |
|------|-------|----------|
| **Internal (dev)** — this `webmaster` clone | source + docs | private / team |
| **Public (deploy)** | built static only (`dist/` + `staticwebapp.config.json`) | public / Azure SWA |

A deploy happens **exactly when** an approver runs the gate script with `-Push`.
See [`GATING.md`](../GATING.md) for the authoritative description and the
placeholder remotes to replace when onboarding to GitHub.

## Publish (the gate)

From `webmaster/`:

```powershell
./scripts/publish.ps1          # dry run: build + stage into ..\.publish-stage (no push)
./scripts/publish.ps1 -Push    # build + commit + push static output to the public deploy repo
```

`scripts/publish.ps1`:
1. runs `npm ci` (or `npm install`) and `npm run build`,
2. clones the public deploy repo, wipes its tracked files,
3. copies `dist/*` **and** `staticwebapp.config.json` into it,
4. commits, and (with `-Push`) pushes to `main` → Azure SWA builds & serves.

## Azure Static Web Apps configuration

`staticwebapp.config.json` (kept at the repo root and copied into the deploy
artifact) provides:

- **`navigationFallback`** → `/404.html` for unknown routes, excluding static
  assets (`/brand/*`, images, css, js, fonts).
- **Security headers**: `X-Content-Type-Options: nosniff`, `X-Frame-Options:
  DENY`, `Referrer-Policy`, HSTS (`Strict-Transport-Security`), and a locked-down
  `Permissions-Policy`.
- **404 response override** and correct MIME types for `.svg` / `.woff2`.

Because the build is static, the SWA app needs **no API** and **no build step on
Azure** beyond serving the published `dist/`. If you instead wire SWA to build
from source, the settings are: **App location** `/`, **Output location** `dist`,
**App build command** `npm run build` — but the gated model above is preferred so
source never reaches the public repo.

## Domain

`astro.config.mjs` sets `site: 'https://itant.is'` (used for canonical URLs,
sitemap and absolute OG image URLs). Point the `itant.is` custom domain at the
Azure SWA resource (CNAME / apex per Azure's custom-domain instructions) and
ensure HTTPS is enforced (HSTS is already sent).

## Pre-publish checklist

```powershell
npm run build      # clean build, emits dist/index.html
npm run preview    # sanity check at http://localhost:4321
```

- [ ] Placeholder copy replaced (email, registration no., services — see README).
- [ ] `dist/index.html`, `dist/404.html`, `dist/favicon.svg`, `dist/robots.txt`,
      `dist/sitemap-index.xml` all present.
- [ ] `dist/` and `node_modules/` are **not** committed to the internal repo.
- [ ] Approver runs `./scripts/publish.ps1 -Push`.
