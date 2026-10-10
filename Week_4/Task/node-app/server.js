// Simple Node.js app: serves a page and counts visits.
// The counter is stored in /data so it survives container restarts when a volume is mounted.
const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || 'development';
const DATA_DIR = process.env.DATA_DIR || path.join(__dirname, 'data');
const COUNTER_FILE = path.join(DATA_DIR, 'visits.txt');

fs.mkdirSync(DATA_DIR, { recursive: true });

function nextVisit() {
  let count = 0;
  try { count = parseInt(fs.readFileSync(COUNTER_FILE, 'utf8'), 10) || 0; } catch (e) {}
  count += 1;
  fs.writeFileSync(COUNTER_FILE, String(count));
  return count;
}

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    return res.end(JSON.stringify({ status: 'ok' }));
  }
  const visits = nextVisit();
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(`<!DOCTYPE html>
<html><head><title>Docker Week 4</title></head>
<body style="font-family:Arial;margin:40px">
  <h1>Hello from Docker!</h1>
  <p>Environment: <b>${APP_ENV}</b></p>
  <p>Container hostname: <b>${require('os').hostname()}</b></p>
  <p>Total visits (stored in a volume): <b>${visits}</b></p>
</body></html>`);
});

server.listen(PORT, () => console.log(`App running on port ${PORT} (${APP_ENV})`));