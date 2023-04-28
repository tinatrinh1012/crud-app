const pool = require('../db.js');

const getType = async (req, res) => {
  pool.query('SELECT * FROM type')
  .then((data) => {
    let typeData = {};
    data.rows.forEach((type) => {
      typeData[type.id] = {};
      typeData[type.id]["type_id"] = type.type_id;
      typeData[type.id]["type_name"] = type.type_name;
    })
    res.status(200).type('json').send(typeData);
  })
  .catch((err) => {
    res.status(404).json({ message: err.message });
  })
}

module.exports = getType;
