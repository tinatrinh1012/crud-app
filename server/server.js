// modules
const express = require('express');
const cors = require('cors');
const pool = require('./db.js');
const { getJobs, getJobById, createJob, updateJob, deleteJob } = require('./controllers/job_controller.js');
const getMfr = require('./controllers/mfr_controller.js');
const getType = require('./controllers/type_controller.js');
const getStyle = require('./controllers/style_controller.js');
const getColor = require('./controllers/color_controller.js');
const getSize = require('./controllers/size_controller.js');

const app = express();
app.use(express.json());
app.use(cors());
const port = 3001;

/* ROUTES */
// GET
app.get('/jobs', getJobs);
app.get('/job/:jobId', getJobById);
app.get('/mfr', getMfr);
app.get('/type', getType);
app.get('/style', getStyle);
app.get('/color', getColor);
app.get('/size', getSize);

// POST
app.post('/create-job', createJob);

// PUT
app.put('/update-job/:jobId', updateJob);

// DELETE
app.delete('/delete-job/:jobId', deleteJob);

// Start local server
app.listen(port, () => {
    console.log(`Local server is running at http://localhost:${port}/`);
});

module.exports = app;
