const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres', // Replace with your PostgreSQL username
  host: 'localhost',
  database: 'crud_db_playground', // Replace with the name of your database
  password: '123456', // Replace with your PostgreSQL password
  port: 5432, // Replace with the PostgreSQL port number (default is 5432)
});

module.exports = pool;