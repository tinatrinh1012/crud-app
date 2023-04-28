const pool = require('../db.js');

const getType = async (req, res) => {
  pool.query('SELECT * FROM type')
  .then((data) => {
    res.status(200).type('json').send(data.rows);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getType;
