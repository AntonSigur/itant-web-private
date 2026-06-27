# Easter egg — crawling worker ants 🐜

A small, tasteful surprise hidden in the IT Ant landing page.

## Rationale — "ants are workers, we work hard"

The brand is an ant, and ants are the archetypal *workers*: tireless, busy,
getting things done. The egg leans into that — **double-click any IT Ant logo
and a little crew of worker ants is summoned** to crawl busily around the page.
Keep clicking and the colony grows: the page fills with industrious little
workers, a playful nod to a hands-on practice that simply *gets on with it*.

## How it works

- **Component:** `src/components/AntsEasterEgg.astro` — a single self-contained
  Astro `<script>` (vanilla JS, no dependencies). It is rendered once by the
  layout (`src/layouts/Base.astro`), so the egg is available site-wide.
- **Triggers:** every IT Ant logo carries a shared `data-ant-trigger` hook:
  - the **header** logo (`src/pages/index.astro`),
  - the **hero** logo image (`src/pages/index.astro`),
  - the **footer** logo (`src/layouts/Base.astro`).
  A `dblclick` listener on each summons ants from the logo's centre.
  *Bonus:* two quick **Enter/Space** presses (within 500 ms) on a focused logo
  link also summon a crew — keyboard-friendly.
- **The sprite:** a clean, small **inline vector ant** drawn in `currentColor`
  (ink `#111317`), ~22px — head, thorax, abdomen, 6 legs and antennae. It is a
  *purpose-drawn crawler*, **not** the wide "ITANT.IS" logo raster. The sprite
  is drawn facing "up" and rotated each frame to face its direction of travel.
- **Motion:** one shared `requestAnimationFrame` loop drives *all* ants (never a
  timer per ant). Each ant wanders with a gently-changing turn rate, a slight
  sideways gait shimmy, and randomised speed, so the colony looks alive and busy
  but never frantic. Ants are nudged away from the viewport edges to stay on
  screen.

## Spawn count & cap

- Each double-click spawns a **random 2–5 ants** (reduced motion: 1–2).
- Repeated clicks **accumulate**. The total is capped at **70** ants for
  performance; beyond the cap the **oldest ants are recycled** (removed) so the
  page never overloads.

## Dismissal

- The colony is **self-dismissing**: after ~45 s of no new summons it gently
  wanders off and fades out, then the rAF loop stops (no idle CPU).

## Accessibility & performance

- The ants live in a single `position:fixed`, `pointer-events:none`,
  `aria-hidden="true"`, high-`z-index` overlay with `contain:strict` — **no
  layout shift, no scroll interference, not exposed to assistive tech.**
- **`prefers-reduced-motion`** is honoured: fewer ants per summon (1–2) and a
  slow, calm crawl — never a frantic swarm.
- Listeners and the overlay are cleaned up on `pagehide`.

## How to test

1. `npm run build && npm run preview` (or `npm run dev`).
2. Open the site (e.g. `http://localhost:4321/`).
3. **Double-click** the header, hero, or footer IT Ant logo → 2–5 ants appear
   and crawl around. Double-click again to add more.
4. Keep going to watch the colony grow toward the cap (oldest recycled).
5. Leave it idle ~45 s → the ants quietly wander off and fade.
6. To verify reduced motion: enable "Reduce motion" in your OS / browser
   devtools (Rendering → Emulate CSS `prefers-reduced-motion: reduce`) and
   confirm fewer, slower ants.
