const pool = require('../db.js');

/* READ */
const getAllJobs = async (req, res) => {
  pool.query('SELECT * FROM jobs')
  .then((data) => {
    const jobsData = data.rows;
    res.status(200).type('json').send(jobsData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

/* CREATE */
const createJob = async (req, res) => {
  const { mfr, type_name, type_id, style_name, style_id, color_num, color_name, size } = req.body;
  const queryText = 'INSERT INTO jobs(mfr, type_name, type_id, style_name, style_id, color_num, color_name, size) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)';
  const queryValues = [mfr, type_name, type_id, style_name, style_id, color_num, color_name, size];

  pool.query(queryText, queryValues)
  .then((data) => {
    res.status(200).json({ message: 'success' });
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = { getAllJobs, createJob };