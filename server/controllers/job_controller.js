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

/* UPDATE */
const updateJob = async (req, res) => {
  const { job_id, mfr, type_name, type_id, style_name, style_id, color_num, color_name, size } = req.body;
  const queryText = `UPDATE jobs
    SET mfr = $2,
    type_name = $3,
    type_id = $4,
    style_name = $5,
    style_id = $6,
    color_num = $7,
    color_name = $8,
    size = $9
    WHERE job_id = $1
  `;
  const queryValues = [job_id, mfr, type_name, type_id, style_name, style_id, color_num, color_name, size];

  pool.query(queryText, queryValues)
  .then((data) => {
    res.status(200).json({ message: 'success' });
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

/* DELETE */
const deleteJob = async (req, res) => {
  const { job_id } = req.body;
  const queryText = `DELETE FROM jobs WHERE job_id = $1`;
  const queryValues = [job_id];

  pool.query(queryText, queryValues)
  .then((data) => {
    res.status(200).json({ message: 'success' });
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = { getAllJobs, createJob, updateJob, deleteJob };