const mongoose = require('mongoose');
require('../models_nosql/msgModel')

const Comentario = mongoose.model('comentarios')
require('../config/db_conn_nosql')


module.exports = function (app) {

  app.get('/recebe_mensagem', async (req, res) => {
    const comentariosResponse = await Comentario.find()
    return res.json(comentariosResponse);
    // Codigo comentado refente ao Mysql
    // const connection = app.app.config.db_conn();
    // const query = app.app.models.conteudoModel;

    // query.getMensagem(connection, function (error, result) {
    //   res.json(result);
    //   //console.log(result, error, result);
    // });

  });

  app.post('/envia_mensagem', (req, res) => {
    // Codigo comentado refente ao Mysql
    // const conteudo = req.body;
    // console.log(conteudo)
    // const connection = app.app.config.db_conn();
    // const conteudoModel = app.app.models.conteudoModel;
    // conteudoModel.postMensagem(conteudo, connection, function (error, result) {
    // });
    const novoComentario = new Comentario({
      nome: req.body.nome,
      mensagem: req.body.mensagem,
    })

    novoComentario.save();
    res.json({
      message: "Comentario enviado",
      info: novoComentario
    })
  });

}