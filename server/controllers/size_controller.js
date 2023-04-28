const pool = require('../db.js');

const getSize = async (req, res) => {
  pool.query('SELECT * FROM size')
  .then((data) => {
    let sizeData = {};
    data.rows.forEach((size) => {
      sizeData[size.id] = size.size;
    })
    res.status(200).type('json').send(sizeData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getSize;
