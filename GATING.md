# IT Ant ehf website — repository & gating model

**Property:** IT Ant ehf — https://itant.is (single-page professional IT-consulting landing)
**Stack:** Astro (static output) -> Azure Static Web Apps.
**Status:** bootstrap. Git remotes are **LOCAL placeholders**; the private GitHub remotes are intentionally
not wired yet (this property is private during bootstrap). Replace the placeholders when onboarding to GitHub.

## Two repositories (gated)

| Repo | Local path (placeholder) | Holds | Audience |
|------|--------------------------|-------|----------|
| **Internal (dev)** | `C:\ai-dev\itant-web\git-repo` (bare origin) | **source + docs** (this working clone pushes here) | private / team |
| **Public (deploy)** | `C:\ai-dev\itant-web\public-repo` (bare origin) | **built static only** (`dist/` + `staticwebapp.config.json`) | public / Azure SWA |

You develop in this `webmaster` clone of the **internal** repo. Nothing here is published until you
explicitly run the gate script. The public repo never contains source, docs, or history of the internal repo.

## Placeholder remotes (replace later)
```
# internal (this clone already points here):
git remote -v            # origin -> ..\git-repo  (PLACEHOLDER for git@github.com:<org>/<itant-web>.git)
# public (used by the gate script):
#   ..\public-repo       # PLACEHOLDER for git@github.com:<org>/<itant-web-public>.git
```

## Publish (the gate)
```powershell
# from webmaster\
./scripts/publish.ps1            # dry run: build + stage into ..\.publish-stage (no push)
./scripts/publish.ps1 -Push      # build + commit + push static output to the public deploy repo
```
Azure Static Web Apps is connected to the **public** repo only, so a deploy happens exactly when an
approver runs `publish.ps1 -Push`. This is the gate.

## Updating per release
Content lives in Markdown/MDX under `src/content` (and page `.astro` files). Edit, commit to internal,
run the gate to publish. See `docs/CONTENT-UPDATES.md`.

## Remotes — WIRED (2026-07)
- Internal (dev, this clone): `origin` = git@github.com:AntonSigur/itant-web-private.git (local bare kept as `local`).
- Public (deploy, Azure SWA): git@github.com:AntonSigur/itant-web-public.git — target of `scripts/publish.ps1`.
- The PUBLIC repo holds ONLY static web files (built dist + staticwebapp.config.json) — no README, no docs.
- Publish: `./scripts/publish.ps1 -Push` builds and pushes the static output; Azure SWA deploys itant.is.
