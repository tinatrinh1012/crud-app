// modules
const express = require('express');
const cors = require('cors');
const pool = require('./db.js');
const { getAllJobs, createJob, updateJob, deleteJob } = require('./controllers/job_controller.js');

const app = express();
app.use(express.json());
app.use(cors());
const port = 3001;

// routes
app.get('/', getAllJobs);
app.post('/create-job', createJob);
app.put('/update-job', updateJob);
app.delete('/delete-job', deleteJob);

// Start local server
app.listen(port, () => {
    console.log(`Local server is running at http://localhost:${port}/`);
});

