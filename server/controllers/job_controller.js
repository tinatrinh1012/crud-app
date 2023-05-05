const pool = require('../db.js');

/* READ */
const getJobs = async (req, res) => {
  // put query in controller to keep it simple. For more complex application, this would be abstracted out in a separate layer.
  pool.query(`
    SELECT jobs.*, mfr_name, type_name, type_id, style_name, style_id, color_num, color_name, size
    FROM jobs
    LEFT JOIN mfr ON jobs.mfr_record_id = mfr.id
    LEFT JOIN type ON jobs.type_record_id = type.id
    LEFT JOIN style ON jobs.style_record_id = style.id
    LEFT JOIN color ON jobs.color_record_id = color.id
    LEFT JOIN size ON jobs.size_record_id = size.id
    ORDER BY jobs.id;
  `)
  .then((data) => {
    const jobsData = data.rows;
    res.status(200).type('json').send(jobsData);
  })
  .catch((err) => {
    // for the purpose of this sample app, return errors as 404
    res.status(404).json({ message: err.message });
  })
}

const getJobById = async (req, res) => {
  const queryText = `
    SELECT jobs.*, mfr_name, type_name, type_id, style_name, style_id, color_num, color_name, size
    FROM jobs
    LEFT JOIN mfr ON jobs.mfr_record_id = mfr.id
    LEFT JOIN type ON jobs.type_record_id = type.id
    LEFT JOIN style ON jobs.style_record_id = style.id
    LEFT JOIN color ON jobs.color_record_id = color.id
    LEFT JOIN size ON jobs.size_record_id = size.id
    WHERE jobs.id = $1
  `;
  const { jobId } = req.params;
  const queryValues = [ jobId ];

  pool.query(queryText, queryValues)
  .then((data) => {
    const jobData = data.rows;
    res.status(200).type('json').send(jobData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}


/* CREATE */
const createJob = async (req, res) => {
  const { mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id } = req.body;
  const queryText = 'INSERT INTO jobs(mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id) VALUES ($1, $2, $3, $4, $5)';
  const queryValues = [mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id];

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
  const queryText = `UPDATE jobs
    SET mfr_record_id = $1,
    type_record_id = $2,
    style_record_id = $3,
    color_record_id = $4,
    size_record_id = $5
    WHERE jobs.id = $6
  `;
  const { jobId } = req.params;
  const { mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id } = req.body;
  const queryValues = [ mfr_record_id, type_record_id, style_record_id, color_record_id, size_record_id, jobId ];

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
  const { jobId } = req.params;
  const queryText = `DELETE FROM jobs WHERE id = $1`;
  const queryValues = [ jobId ];

  pool.query(queryText, queryValues)
  .then((data) => {
    res.status(200).json({ message: 'success' });
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = { getJobs, getJobById, createJob, updateJob, deleteJob };