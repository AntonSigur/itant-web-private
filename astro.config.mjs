// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// IT Ant ehf — static public landing. Deployed to Azure Static Web Apps via the gate
// (scripts/publish.ps1). Keep output static; no SSR adapter.
export default defineConfig({
  site: 'https://itant.is',
  output: 'static',
  trailingSlash: 'ignore',
  integrations: [sitemap()],
  build: {
    inlineStylesheets: 'auto',
  },
});
