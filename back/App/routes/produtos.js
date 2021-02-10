module.exports = function (app) {

  app.get('/produtos', (req, res) => {

    const connection = app.app.config.db_conn();
    const query = app.app.models.conteudoModel;

    query.getProdutos(connection, function (error, result) {
      res.json(result);
      //console.log(result, error, result);
    });

  });

}

