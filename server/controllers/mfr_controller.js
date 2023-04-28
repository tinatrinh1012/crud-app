const pool = require('../db.js');

const getMfr = async (req, res) => {
  pool.query('SELECT * FROM mfr')
  .then((data) => {
    let mfrData = {};
    data.rows.forEach((mfr) => {
      mfrData[mfr.id] = mfr.mfr_name;
    })
    res.status(200).type('json').send(mfrData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getMfr;
