const pool = require('../db.js');

const getSize = async (req, res) => {
  pool.query('SELECT * FROM size')
  .then((data) => {
    res.status(200).type('json').send(data.rows);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getSize;
