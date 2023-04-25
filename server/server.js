// modules
const express = require('express');
const cors = require('cors');
const pool = require('./db.js');

const app = express();
app.use(cors());
const port = 3001;

// Define route for root
app.get('/', (req, res) => {
    pool.query('SELECT * FROM tinatable', (err, data) => {
        if (err) {
            res.status(500).type('txt').send('Error 500: Issue querying data');
        } else {
            res.status(200).type('json').send(data.rows);
        }
    })
})

// Start local server
app.listen(port, () => {
    console.log(`Local server is running at http://localhost:${port}/`);
});

