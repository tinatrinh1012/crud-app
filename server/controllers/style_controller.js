const pool = require('../db.js');

const getStyle = async (req, res) => {
  pool.query('SELECT * FROM style ORDER BY style_name')
  .then((data) => {
    res.status(200).type('json').send(data.rows);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getStyle;
