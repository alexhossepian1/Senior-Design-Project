const esc = (s) =>
  String(s ?? '').replace(/[&<>"']/g, (c) =>
    ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c])
  );

const money = (cents) =>
  cents == null ? '' : '$' + (cents / 100).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',');

export function layout({ title, domain = null, body, wide = false }) {
  return `<!doctype html>
<html lang="en" ${domain ? `data-domain="${esc(domain)}"` : ''}>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${esc(title)}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wdth,wght@0,62..125,300..800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/styles.css">
</head>
<body class="${wide ? 'wide' : ''}">
${body}
</body>
</html>`;
}

/* ------------------------------------------------------------------ */
/* Landing                                                             */
/* ------------------------------------------------------------------ */

export function landingPage() {
  return layout({
    title: 'RC Part Picker',
    body: `
<header class="topbar topbar--dark">
  <a class="wordmark" href="/">RC Part Picker</a>
</header>

<main class="hero">
  <div class="hero__text">
    <h1 class="hero__title">Every part fits.<br>Or we tell you why not.</h1>
    <p class="hero__lede">
      Pick a chassis or a frame, and the list narrows to parts that actually bolt on.
      Gear pitch, motor bore, cell count, stack size: checked as you go, before you
      spend the money.
    </p>
  </div>

  <div class="entries">
    <a class="entry entry--go" href="/build">
      <span class="entry__name">Custom build</span>
      <p class="entry__desc">Start from an empty sheet and work down the list. Air, ground or water.</p>
      <span class="entry__cta">Start building</span>
    </a>

    <div class="entry entry--off" aria-disabled="true">
      <span class="entry__name">Prebuilt setups</span>
      <p class="entry__desc">Proven part lists from club racers, ready to copy and tweak.</p>
      <span class="entry__cta entry__cta--off">Coming soon</span>
    </div>
  </div>
</main>

<footer class="foot foot--dark">
  <span>Senior design project</span>
  <span>Parts data is hand-entered. Verify specs before you buy.</span>
</footer>`,
  });
}

/* ------------------------------------------------------------------ */
/* Family and domain choosers                                          */
/* ------------------------------------------------------------------ */

const AIR_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <circle cx="110" cy="70" r="11"/>
    <path d="M110 59c0-24 11-39 24-33s2 28-24 33z"/>
    <path d="M110 81c0 24-11 39-24 33s-2-28 24-33z"/>
    <path d="M121 70c24 0 39-11 33-24s-28-2-33 24z"/>
    <path d="M99 70c-24 0-39 11-33 24s28 2 33-24z"/>
  </g>
  <g fill="currentColor"><circle cx="110" cy="70" r="4"/></g>
</svg>`;

const GROUND_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <circle cx="110" cy="62" r="40"/>
    <circle cx="110" cy="62" r="17"/>
    <path d="M110 22v13M110 89v13M70 62h13M137 62h13"/>
    <path d="M82 34l9 9M138 82l-9-9M138 34l-9 9M82 90l9-9"/>
  </g>
  <path d="M24 118h172" stroke="currentColor" stroke-width="2" opacity=".4"/>
  <g fill="currentColor"><circle cx="110" cy="62" r="5"/></g>
</svg>`;

const WATER_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <path d="M58 60h76l28-15-28 34H58z"/>
    <path d="M84 60c3-11 11-15 21-15h15"/>
  </g>
  <g fill="none" stroke="currentColor" stroke-width="2" opacity=".45">
    <path d="M22 96c18-8 36 8 54 0s36 8 54 0 36 8 54 0"/>
    <path d="M22 112c18-8 36 8 54 0s36 8 54 0 36 8 54 0"/>
    <path d="M22 128c18-8 36 8 54 0s36 8 54 0 36 8 54 0"/>
  </g>
</svg>`;

const PLANE_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <path d="M110 20c6 0 10 8 10 18v62c0 10-4 18-10 18s-10-8-10-18V38c0-10 4-18 10-18z"/>
    <path d="M100 58 24 76v10l76-8"/>
    <path d="M120 58 196 76v10l-76-8"/>
    <path d="M102 102 68 112v6l34-4"/>
    <path d="M118 102 152 112v6l-34-4"/>
    <path d="M86 16a28 28 0 0 1 48 0" opacity=".5"/>
  </g>
  <g fill="currentColor"><circle cx="110" cy="18" r="4"/></g>
</svg>`;

const BUGGY_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <circle cx="58" cy="98" r="26"/>
    <circle cx="162" cy="98" r="26"/>
    <path d="M26 92c8-16 24-20 40-20h42c14 0 24-10 34-10h22c8 0 12 6 12 14v14"/>
    <path d="M88 72 106 44h32l8 18"/>
    <path d="M148 42h38v9h-38z"/>
  </g>
  <g fill="currentColor">
    <circle cx="58" cy="98" r="7"/><circle cx="162" cy="98" r="7"/>
  </g>
</svg>`;

const BOAT_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <path d="M26 58h116l46-18-46 46H26z"/>
    <path d="M62 58c4-15 15-21 29-21h26"/>
    <path d="M30 86v16M18 102h26"/>
  </g>
  <g fill="none" stroke="currentColor" stroke-width="2" opacity=".4">
    <path d="M16 118c16-6 32 6 48 0s32 6 48 0 32 6 48 0"/>
    <path d="M16 130c16-6 32 6 48 0s32 6 48 0 32 6 48 0"/>
  </g>
</svg>`;

const CHASSIS_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <path d="M64 22h92l18 20v56l-18 20H64L46 98V42z"/>
    <path d="M74 42h72v56H74z" opacity=".45"/>
    <circle cx="74" cy="30" r="4"/><circle cx="146" cy="30" r="4"/>
    <circle cx="74" cy="110" r="4"/><circle cx="146" cy="110" r="4"/>
  </g>
  <g fill="currentColor">
    <rect x="24" y="16" width="18" height="30" rx="3"/>
    <rect x="178" y="16" width="18" height="30" rx="3"/>
    <rect x="24" y="94" width="18" height="30" rx="3"/>
    <rect x="178" y="94" width="18" height="30" rx="3"/>
  </g>
  <path d="M110 52v36" stroke="currentColor" stroke-width="2" opacity=".45"/>
</svg>`;

const QUAD_ART = `
<svg viewBox="0 0 220 140" class="art" aria-hidden="true">
  <g fill="none" stroke="currentColor" stroke-width="2">
    <path d="M58 26 96 58M162 26 124 58M58 114 96 82M162 114 124 82"/>
    <rect x="92" y="54" width="36" height="32" rx="5"/>
    <circle cx="52" cy="20" r="19" opacity=".5"/>
    <circle cx="168" cy="20" r="19" opacity=".5"/>
    <circle cx="52" cy="120" r="19" opacity=".5"/>
    <circle cx="168" cy="120" r="19" opacity=".5"/>
  </g>
  <g fill="currentColor">
    <circle cx="52" cy="20" r="5"/><circle cx="168" cy="20" r="5"/>
    <circle cx="52" cy="120" r="5"/><circle cx="168" cy="120" r="5"/>
  </g>
</svg>`;

const FAMILY_ART = { air: AIR_ART, ground: GROUND_ART, water: WATER_ART };

const DOMAIN_ART = {
  fpv: QUAD_ART,
  plane: PLANE_ART,
  drift: CHASSIS_ART,
  rccar: BUGGY_ART,
  boat: BOAT_ART,
};

// Flavour text only. The part-slot count next to it is read from the
// database so the chooser cannot promise a row the build sheet lacks.
const DOMAIN_FACTS = {
  fpv: ['3in to 7in', 'Analog and digital'],
  plane: ['500mm to 2.3m', 'Foam and balsa'],
  drift: ['1/10 and 1/24', 'RWD and AWD'],
  rccar: ['1/10 and 1/8', 'Buggy to monster truck'],
  boat: ['300mm to 1m', 'Mono, cat and tunnel'],
};

const plural = (n, word) => `${n} ${word}${n === 1 ? '' : 's'}`;

/* Step one: where does it operate? */
export function familyPage(families) {
  const panels = families
    .map(
      (f) => `
    <a class="path path--fam-${esc(f.slug)}" href="/build/${esc(f.slug)}">
      ${FAMILY_ART[f.slug] || ''}
      <h2 class="path__name">${esc(f.name)}</h2>
      <p class="path__blurb">${esc(f.blurb || '')}</p>
      <ul class="path__facts">
        <li>${esc(plural(f.domain_count, 'build type'))}</li>
      </ul>
    </a>`
    )
    .join('');

  return layout({
    title: 'Choose a category',
    body: `
<header class="topbar topbar--dark">
  <a class="wordmark" href="/">RC Part Picker</a>
</header>

<main class="choose">
  <h1 class="choose__title">Where does it run?</h1>
  <p class="choose__lede">Pick a category, then the model you are building.</p>
  <div class="paths paths--three">${panels}</div>
</main>`,
  });
}

/* Step two: which build type inside that family? */
export function domainPage(family, domains) {
  const panels = domains
    .map(
      (d) => `
    <a class="path path--${esc(d.slug)}" href="/b/${esc(d.slug)}">
      ${DOMAIN_ART[d.slug] || ''}
      <h2 class="path__name">${esc(d.name)}</h2>
      <p class="path__blurb">${esc(d.blurb || '')}</p>
      <ul class="path__facts">
        ${(DOMAIN_FACTS[d.slug] || []).map((f) => `<li>${esc(f)}</li>`).join('')}
        <li>${esc(plural(d.category_count, 'part slot'))}</li>
      </ul>
    </a>`
    )
    .join('');

  const empty = domains.length
    ? ''
    : `<p class="empty">Nothing in this category yet.</p>`;

  return layout({
    title: `${family.name} builds`,
    body: `
<header class="topbar topbar--dark">
  <a class="wordmark" href="/">RC Part Picker</a>
  <nav class="crumbs"><a href="/build">All categories</a></nav>
</header>

<main class="choose">
  <h1 class="choose__title">${esc(family.name)}</h1>
  <p class="choose__lede">Each build type has its own catalog. Parts never cross over.</p>
  ${empty}
  <div class="paths">${panels}</div>
</main>`,
  });
}

/* ------------------------------------------------------------------ */
/* Build sheet                                                         */
/* ------------------------------------------------------------------ */

export function buildPage({ domain, sheet, issues, totals, missing }) {
  const errors = issues.filter((i) => i.severity === 'error');
  const warnings = issues.filter((i) => i.severity === 'warning');

  let banner;
  if (errors.length) {
    banner = `<div class="verdict verdict--bad">
      <strong>${errors.length} part${errors.length > 1 ? 's' : ''} won't work together.</strong>
      <ul>${errors.map((e) => `<li>${esc(e.message)} <span class="verdict__pair">${esc(e.part_a)} + ${esc(e.part_b)}</span></li>`).join('')}</ul>
    </div>`;
  } else if (warnings.length) {
    banner = `<div class="verdict verdict--warn">
      <strong>Everything fits, with ${warnings.length} thing${warnings.length > 1 ? 's' : ''} to check.</strong>
      <ul>${warnings.map((w) => `<li>${esc(w.message)} <span class="verdict__pair">${esc(w.part_a)} + ${esc(w.part_b)}</span></li>`).join('')}</ul>
    </div>`;
  } else if (totals.item_count > 0) {
    banner = `<div class="verdict verdict--good"><strong>No compatibility issues found.</strong>
      ${missing.length ? `<span>${missing.length} required part${missing.length > 1 ? 's' : ''} still to pick.</span>` : '<span>This build is complete.</span>'}</div>`;
  } else {
    banner = `<div class="verdict verdict--empty">
      <strong>Empty sheet.</strong>
      <span>Start with the ${esc(sheet[0]?.category_name.toLowerCase() || 'first part')}: everything else checks against it.</span>
    </div>`;
  }

  const rows = sheet
    .map((r) => {
      const cell = r.variant_id
        ? `<div class="chosen">
             <span class="chosen__name">${esc(r.part_name)}</span>
             <form method="post" action="/b/${esc(domain.slug)}/remove">
               <input type="hidden" name="variant_id" value="${r.variant_id}">
               <button class="linkbtn" type="submit">Remove</button>
             </form>
           </div>`
        : `<a class="pick" href="/b/${esc(domain.slug)}/pick/${esc(r.category_slug)}">
             <span class="pick__plus" aria-hidden="true">+</span>Choose ${esc(r.category_name.toLowerCase())}
           </a>`;

      return `<tr class="${r.variant_id ? 'row--set' : ''}">
        <th scope="row">
          ${esc(r.category_name)}
          ${r.is_required ? '' : '<span class="opt">optional</span>'}
        </th>
        <td>${cell}</td>
        <td class="num">${r.default_qty > 1 ? '&times;' + r.default_qty : ''}</td>
        <td class="num">${r.variant_id ? money(r.line_cents) : ''}</td>
      </tr>`;
    })
    .join('');

  return layout({
    title: `${domain.name} build`,
    domain: domain.slug,
    wide: true,
    body: `
<header class="topbar">
  <a class="wordmark" href="/">RC Part Picker</a>
  <nav class="crumbs">
    <a href="/build">All categories</a>
    <a href="/build/${esc(domain.family_slug)}">${esc(domain.family_name)}</a>
  </nav>
</header>

<main class="sheet">
  <div class="sheet__head">
    <h1 class="sheet__title">${esc(domain.name)}</h1>
    <form method="post" action="/b/${esc(domain.slug)}/reset">
      <button class="linkbtn" type="submit">Start over</button>
    </form>
  </div>

  ${banner}

  <table class="parts">
    <thead>
      <tr><th>Component</th><th>Selection</th><th class="num">Qty</th><th class="num">Price</th></tr>
    </thead>
    <tbody>${rows}</tbody>
    <tfoot>
      <tr>
        <td colspan="2">Estimated total</td>
        <td class="num">${totals.total_weight_g > 0 ? Math.round(totals.total_weight_g) + ' g' : ''}</td>
        <td class="num total">${money(totals.total_cents)}</td>
      </tr>
    </tfoot>
  </table>
</main>`,
  });
}

/* ------------------------------------------------------------------ */
/* Part picker                                                         */
/* ------------------------------------------------------------------ */

export function pickerPage({ domain, category, columns, candidates, showAll, hasPicks, reasons }) {
  const fits = candidates.filter((c) => Number(c.n_errors) === 0);
  const blocked = candidates.filter((c) => Number(c.n_errors) > 0);
  const shown = showAll ? candidates : fits;

  const head = columns.map((c) => `<th class="num">${esc(c.label)}</th>`).join('');

  const rowFor = (c) => {
    const cells = columns
      .map((col) => {
        let v = c.specs?.[col.key];
        if (v === true) v = 'Yes';
        if (v === false) v = 'No';
        return `<td class="num">${v == null ? '' : esc(v) + (col.unit ? ` <span class="unit">${esc(col.unit)}</span>` : '')}</td>`;
      })
      .join('');

    const bad = Number(c.n_errors) > 0;
    const why = bad ? (reasons[c.variant_id] || []).map((r) => r.message) : [];

    return `<tr class="${bad ? 'row--blocked' : ''}">
      <td class="partcell">
        <span class="partcell__name">${esc(c.part_name)}</span>
        <span class="partcell__label">${esc(c.label)}</span>
        ${why.length ? `<p class="why">${esc(why[0])}</p>` : ''}
        ${!bad && Number(c.n_warnings) > 0 ? '<p class="why why--warn">Fits, but check the notes after you add it.</p>' : ''}
      </td>
      ${cells}
      <td class="num">${money(c.msrp_cents)}</td>
      <td class="num">
        <form method="post" action="/b/${esc(domain.slug)}/pick/${esc(category.slug)}">
          <input type="hidden" name="variant_id" value="${c.variant_id}">
          <button class="addbtn ${bad ? 'addbtn--force' : ''}" type="submit">${bad ? 'Add anyway' : 'Add'}</button>
        </form>
      </td>
    </tr>`;
  };

  const toggle = hasPicks
    ? `<div class="filterbar">
         <span>${fits.length} of ${candidates.length} parts fit this build</span>
         <a class="toggle ${showAll ? '' : 'toggle--on'}"
            href="/b/${esc(domain.slug)}/pick/${esc(category.slug)}${showAll ? '' : '?all=1'}">
           ${showAll ? 'Hide parts that will not fit' : `Show all ${candidates.length}`}
         </a>
       </div>`
    : `<div class="filterbar"><span>${candidates.length} parts. Nothing picked yet, so everything is available.</span></div>`;

  const empty =
    shown.length === 0
      ? `<p class="empty">No ${esc(category.name.toLowerCase())} fits the parts you have picked. Change something upstream, or show all parts to see what is blocking.</p>`
      : '';

  return layout({
    title: `Choose ${category.name}`,
    domain: domain.slug,
    wide: true,
    body: `
<header class="topbar">
  <a class="wordmark" href="/">RC Part Picker</a>
  <nav class="crumbs"><a href="/b/${esc(domain.slug)}">Back to build</a></nav>
</header>

<main class="picker">
  <h1 class="picker__title">${esc(category.name)}</h1>
  ${toggle}
  ${empty}
  ${
    shown.length
      ? `<table class="parts parts--picker">
           <thead><tr><th>Part</th>${head}<th class="num">Price</th><th></th></tr></thead>
           <tbody>${shown.map(rowFor).join('')}</tbody>
         </table>`
      : ''
  }
</main>`,
  });
}

export function errorPage(message) {
  return layout({
    title: 'Something went wrong',
    body: `<header class="topbar topbar--dark"><a class="wordmark" href="/">RC Part Picker</a></header>
<main class="choose"><h1 class="choose__title">${esc(message)}</h1>
<p class="choose__lede"><a href="/">Back to the start</a></p></main>`,
  });
}
