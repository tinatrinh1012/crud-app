const pool = require('../db.js');

const getStyle = async (req, res) => {
  pool.query('SELECT * FROM style')
  .then((data) => {
    let styleData = {};
    data.rows.forEach((style) => {
      styleData[style.id] = {};
      styleData[style.id]["style_id"] = style.style_id;
      styleData[style.id]["style_name"] = style.style_name;
    })
    res.status(200).type('json').send(styleData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getStyle;
