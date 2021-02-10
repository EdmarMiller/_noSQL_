const express = require('express');
const consign = require('consign');
const bodyParser = require('body-parser');
const cors = require('cors');


const app = express();

app.use(bodyParser.urlencoded({ extended: true }));

// usado para que o F.E e B.E possam rodar no mesmo server sem conflito
app.use(cors());
// sinaliza pro express que os dados da api serão json
app.use(bodyParser.json());
// vai direcionar as rotas
consign()
.include('././app/routes')
.then('././app/config/db_conn.js')
.then('././app/models')
.into(app);

module.exports = app;