// Monta o index.html a partir de secoes/ + styles.css e gera o PDF A4 com o Playwright.
// O index.html é artefato de build (regenerado por build.sh), por isso não vai versionado.
const fs = require('fs');
const path = require('path');
const dir = __dirname;

const secoes = fs.readdirSync(path.join(dir, 'secoes'))
  .filter((f) => /^\d\d-.*\.html$/.test(f))
  .sort();
const html = [
  fs.readFileSync(path.join(dir, 'secoes/_head.html'), 'utf8'),
  ...secoes.map((f) => '\n' + fs.readFileSync(path.join(dir, 'secoes', f), 'utf8')),
  '\n</div>\n</body>\n</html>\n',
].join('');
fs.writeFileSync(path.join(dir, 'index.html'), html);
console.log('index.html montado com', secoes.length, 'seções');

// Playwright não é dependência deste repo: usamos uma instalação já existente.
const CANDIDATOS = [
  '/Users/lucianfialho/Code/talks-2026/01-intro-ecommerce/deck/node_modules/playwright',
  '/Users/lucianfialho/Code/analytics-copilot/node_modules/playwright',
  'playwright',
];
let chromium;
for (const p of CANDIDATOS) {
  try { chromium = require(p).chromium; console.log('playwright:', p); break; } catch (e) {}
}
if (!chromium) { console.error('Playwright não encontrado. Instale com: npm i playwright'); process.exit(1); }

const out = path.join(dir, 'material-complementar.pdf');
(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('http://127.0.0.1:8731/index.html', { waitUntil: 'networkidle' });
  await page.evaluate(() => document.fonts.ready);
  await page.waitForTimeout(1500);
  await page.pdf({ path: out, format: 'A4', printBackground: true });
  await browser.close();
  console.log('ok ->', out);
})();
