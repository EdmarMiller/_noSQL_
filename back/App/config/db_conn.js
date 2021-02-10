const mysql = require('mysql');

const db_conn = function () {
  return mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'lojadatia'
  });
}

module.exports = function () {
  return db_conn;
}