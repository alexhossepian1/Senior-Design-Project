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
      <p class="entry__desc">Start from an empty sheet and work down the list. Drift car or FPV drone.</p>
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
/* Domain chooser                                                      */
/* ------------------------------------------------------------------ */

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

export function domainPage(domains) {
  const art = { drift: CHASSIS_ART, fpv: QUAD_ART };
  const detail = {
    drift: ['1/10 scale', 'RWD and AWD', '12 part slots'],
    fpv: ['3in to 7in', 'Analog and digital', '12 part slots'],
  };

  const panels = domains
    .map(
      (d) => `
    <a class="path path--${esc(d.slug)}" href="/b/${esc(d.slug)}">
      ${art[d.slug] || ''}
      <h2 class="path__name">${esc(d.name)}</h2>
      <p class="path__blurb">${esc(d.blurb || '')}</p>
      <ul class="path__facts">
        ${(detail[d.slug] || []).map((f) => `<li>${esc(f)}</li>`).join('')}
      </ul>
    </a>`
    )
    .join('');

  return layout({
    title: 'Choose a build',
    body: `
<header class="topbar topbar--dark">
  <a class="wordmark" href="/">RC Part Picker</a>
</header>

<main class="choose">
  <h1 class="choose__title">What are you building?</h1>
  <p class="choose__lede">Each path has its own catalog. Parts never cross over.</p>
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
  <nav class="crumbs"><a href="/build">Change build type</a></nav>
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
