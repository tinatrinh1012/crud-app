const pool = require('../db.js');

const getMfr = async (req, res) => {
  pool.query('SELECT * FROM mfr ORDER BY mfr_name')
  .then((data) => {
    res.status(200).type('json').send(data.rows);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getMfr;
