const pool = require('../db.js');

const getColor = async (req, res) => {
  pool.query('SELECT * FROM color ORDER BY color_name')
  .then((data) => {
    res.status(200).type('json').send(data.rows);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getColor;
