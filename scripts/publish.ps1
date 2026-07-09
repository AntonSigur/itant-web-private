<#
.SYNOPSIS  Gate: build the site and publish ONLY the static output to the PUBLIC deploy repo.
.DESCRIPTION
  The internal (private) repo holds all source + documentation. This script builds the Astro site and
  pushes ONLY the built dist/ (plus the Azure SWA config) to the PUBLIC repo, which Azure Static Web
  Apps deploys from. The PUBLIC repo carries NO documentation, README, or source — only static web
  files. Property: IT Ant ehf (itant.is).
#>
[CmdletBinding()]
param([switch]$Push)

$ErrorActionPreference = 'Stop'
$work   = Split-Path -Parent $PSScriptRoot          # webmaster\
$root   = Split-Path -Parent $work                  # <prop>-web\
$public = 'git@github.com:AntonSigur/itant-web-public.git'   # PUBLIC deploy repo (Azure SWA source)
$stage  = Join-Path $root '.publish-stage'

Write-Host '==> Building static site (npm run build)...' -ForegroundColor Cyan
Push-Location $work
if (Test-Path (Join-Path $work 'package-lock.json')) { npm ci } else { npm install }
npm run build
Pop-Location
$dist = Join-Path $work 'dist'
if (-not (Test-Path $dist)) { throw "Build produced no dist/ at $dist" }

Write-Host '==> Staging public deploy clone...' -ForegroundColor Cyan
if (Test-Path $stage) { Remove-Item $stage -Recurse -Force }
git clone -q $public $stage
# wipe tracked working files (keep .git AND the Azure SWA CI workflow in .github) so deletions propagate
Get-ChildItem -Force $stage | Where-Object { $_.Name -ne '.git' -and $_.Name -ne '.github' } | Remove-Item -Recurse -Force
# Public repo holds ONLY static web files: the built site + the Azure SWA config. No README, no docs.
Copy-Item (Join-Path $dist '*') $stage -Recurse -Force
Copy-Item (Join-Path $work 'staticwebapp.config.json') $stage -Force

git -C $stage add -A
git -C $stage -c user.email='webmaster@g9.is' -c user.name='G9 Webmaster (Copilot)' commit -q --allow-empty -m "publish: IT Ant ehf static build" 2>&1 | Out-Null
if ($Push) { git -C $stage push -q origin HEAD:main; Write-Host '==> Pushed to public repo.' -ForegroundColor Green }
else { Write-Host '==> Dry run complete (staged, not pushed). Re-run with -Push to publish.' -ForegroundColor Yellow }
Write-Host "Staged at: $stage"
