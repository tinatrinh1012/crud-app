const pool = require('../db.js');

const getColor = async (req, res) => {
  pool.query('SELECT * FROM color')
  .then((data) => {
    let colorData = {};
    data.rows.forEach((color) => {
      colorData[color.id] = {};
      colorData[color.id]["color_num"] = color.color_num;
      colorData[color.id]["color_name"] = color.color_name;
    })
    res.status(200).type('json').send(colorData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getColor;
