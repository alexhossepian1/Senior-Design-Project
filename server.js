import express from 'express';
import cookieParser from 'cookie-parser';
import * as db from './src/db.js';
import * as v from './src/views.js';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static('public', { maxAge: '1h' }));

// Each domain keeps its own in-progress build, remembered by cookie.
const cookieFor = (slug) => `build_${slug}`;

async function resolveBuild(req, res, domain) {
  const raw = req.cookies[cookieFor(domain.slug)];
  const id = Number.parseInt(raw, 10);
  if (Number.isInteger(id) && (await db.buildExists(id, domain.id))) return id;

  const fresh = await db.createBuild(domain.id, `${domain.name} build`);
  res.cookie(cookieFor(domain.slug), String(fresh), {
    httpOnly: true,
    sameSite: 'lax',
    maxAge: 1000 * 60 * 60 * 24 * 30,
  });
  return fresh;
}

const wrap = (fn) => (req, res, next) => fn(req, res, next).catch(next);

app.get('/healthz', wrap(async (_req, res) => {
  await db.ping();
  res.type('text').send('ok');
}));

app.get('/', (_req, res) => res.send(v.landingPage()));

// Two steps into a build: pick where it operates, then pick what it is.
app.get('/build', wrap(async (_req, res) => {
  res.send(v.familyPage(await db.getFamilies()));
}));

app.get('/build/:family', wrap(async (req, res) => {
  const family = await db.getFamily(req.params.family);
  if (!family) return res.status(404).send(v.errorPage('No such category.'));

  res.send(v.domainPage(family, await db.getDomains(family.id)));
}));

app.get('/b/:domain', wrap(async (req, res) => {
  const domain = await db.getDomain(req.params.domain);
  if (!domain) return res.status(404).send(v.errorPage('No such build type.'));

  const buildId = await resolveBuild(req, res, domain);
  const [sheet, issues, totals, missing, bundled] = await Promise.all([
    db.getBuildSheet(buildId),
    db.checkBuild(buildId),
    db.getTotals(buildId),
    db.getMissingRequired(buildId),
    db.getBundled(buildId),
  ]);
  res.send(v.buildPage({ domain, sheet, issues, totals, missing, bundled }));
}));

app.get('/b/:domain/pick/:cat', wrap(async (req, res) => {
  const domain = await db.getDomain(req.params.domain);
  if (!domain) return res.status(404).send(v.errorPage('No such build type.'));

  const category = await db.getCategory(domain.id, req.params.cat);
  if (!category) return res.status(404).send(v.errorPage('No such component.'));

  const buildId = await resolveBuild(req, res, domain);
  const [columns, candidates, totals] = await Promise.all([
    db.getSpecColumns(domain.slug, category.slug),
    db.getCandidates(buildId, category.slug),
    db.getTotals(buildId),
  ]);

  const showAll = req.query.all === '1';
  const hasPicks = totals.item_count > 0;

  // Explain each blocked part, but only for the ones actually on screen.
  const reasons = {};
  if (showAll && hasPicks) {
    const blocked = candidates.filter((c) => Number(c.n_errors) > 0);
    await Promise.all(
      blocked.map(async (c) => {
        reasons[c.variant_id] = await db.getConflictReasons(buildId, c.variant_id);
      })
    );
  }

  res.send(v.pickerPage({ domain, category, columns, candidates, showAll, hasPicks, reasons }));
}));

app.post('/b/:domain/pick/:cat', wrap(async (req, res) => {
  const domain = await db.getDomain(req.params.domain);
  if (!domain) return res.status(404).send(v.errorPage('No such build type.'));

  const category = await db.getCategory(domain.id, req.params.cat);
  if (!category) return res.status(404).send(v.errorPage('No such component.'));

  const variantId = Number.parseInt(req.body.variant_id, 10);
  if (!Number.isInteger(variantId)) return res.redirect(`/b/${domain.slug}`);

  const buildId = await resolveBuild(req, res, domain);
  await db.addPart(buildId, category.id, variantId, category.default_qty);
  res.redirect(`/b/${domain.slug}`);
}));

app.post('/b/:domain/remove', wrap(async (req, res) => {
  const domain = await db.getDomain(req.params.domain);
  if (!domain) return res.status(404).send(v.errorPage('No such build type.'));

  const variantId = Number.parseInt(req.body.variant_id, 10);
  const buildId = await resolveBuild(req, res, domain);
  if (Number.isInteger(variantId)) await db.removePart(buildId, variantId);
  res.redirect(`/b/${domain.slug}`);
}));

app.post('/b/:domain/reset', wrap(async (req, res) => {
  const domain = await db.getDomain(req.params.domain);
  if (!domain) return res.status(404).send(v.errorPage('No such build type.'));

  const fresh = await db.createBuild(domain.id, `${domain.name} build`);
  res.cookie(cookieFor(domain.slug), String(fresh), {
    httpOnly: true,
    sameSite: 'lax',
    maxAge: 1000 * 60 * 60 * 24 * 30,
  });
  res.redirect(`/b/${domain.slug}`);
}));

app.use((_req, res) => res.status(404).send(v.errorPage('That page does not exist.')));

app.use((err, _req, res, _next) => {
  console.error(err);
  res.status(500).send(v.errorPage('The server hit an error. Check the logs.'));
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`RC Part Picker listening on http://0.0.0.0:${PORT}`);
});
