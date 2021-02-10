



module.exports = function () {
  this.getProdutos = function (connection, callback) {
    connection.query("SELECT * FROM wv2_produtos", callback);
  }
  this.getMensagem = function (connection, callback) {
    connection.query("SELECT * FROM comentarios", callback);
  }
  this.postMensagem = function (conteudo, connection, callback) {
    connection.query("INSERT INTO comentarios SET ?", conteudo);
  }
  return this
}