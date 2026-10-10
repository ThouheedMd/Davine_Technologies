// Backend API: counts visits in PostgreSQL.
const http = require('http');
const { Pool } = require('pg');

const PORT = process.env.PORT || 3000;
const pool = new Pool({
  host: process.env.DB_HOST || 'db',
  port: parseInt(process.env.DB_PORT || '5432', 10),
  user: process.env.DB_USER || 'appuser',
  password: process.env.DB_PASSWORD || 'apppass',
  database: process.env.DB_NAME || 'appdb',
});

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

// Wait for the database, then create the table
async function initDb() {
  for (let attempt = 1; attempt <= 15; attempt++) {
    try {
      await pool.query('CREATE TABLE IF NOT EXISTS visits (id SERIAL PRIMARY KEY, visited_at TIMESTAMP DEFAULT NOW())');
      console.log('Database ready');
      return;
    } catch (err) {
      console.log(`Database not ready (attempt ${attempt}): ${err.message}`);
      await sleep(2000);
    }
  }
  throw new Error('Could not connect to the database');
}

function send(res, code, body) {
  res.writeHead(code, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify(body));
}

const server = http.createServer(async (req, res) => {
  try {
    if (req.url === '/api/health') {
      await pool.query('SELECT 1');
      return send(res, 200, { status: 'ok', database: 'connected' });
    }
    if (req.url === '/api/visits') {
      await pool.query('INSERT INTO visits DEFAULT VALUES');
      const { rows } = await pool.query('SELECT COUNT(*)::int AS total FROM visits');
      return send(res, 200, { total: rows[0].total, backend: require('os').hostname() });
    }
    send(res, 404, { error: 'Not found' });
  } catch (err) {
    send(res, 500, { error: err.message });
  }
});

initDb()
  .then(() => server.listen(PORT, () => console.log(`Backend listening on ${PORT}`)))
  .catch((err) => { console.error(err.message); process.exit(1); });