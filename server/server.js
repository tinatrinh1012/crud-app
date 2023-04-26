// modules
const express = require('express');
const cors = require('cors');
const pool = require('./db.js');
const { getAllJobs, createJob } = require('./controllers/job_controller.js');

const app = express();
app.use(express.json());
app.use(cors());
const port = 3001;

// routes
app.get('/', getAllJobs);
app.post('/create-job', createJob);

// Start local server
app.listen(port, () => {
    console.log(`Local server is running at http://localhost:${port}/`);
});

