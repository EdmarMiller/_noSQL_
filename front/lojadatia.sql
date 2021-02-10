-- Verificando a existencia e criando o BD
CREATE DATABASE IF NOT EXISTS lojadatia DEFAULT CHARACTER SET utf8;
-- Selecionando o BD
USE lojadatia;
-- verificando a existencia e criando a tabela produtos
CREATE TABLE IF NOT EXISTS produtos(
  id_produto INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(100)NOT NULL,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(500)NOT NULL,
  preco DECIMAL(8, 2)NULL,
  preco_final DECIMAL(8, 2)NULL,
  imagem VARCHAR(250)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8; -- AUTO_INCREMENT=9 referente ao proximo produto que será cadastrado

INSERT INTO `lojadatia`.`produtos` (`categoria`,`nome`, `descricao`, `preco`, `preco_final`, `imagem`) VALUES
('Bolo','Bolo Branco','Delicioso bolo Branco',89.25,69.23,'b_branco.jpg'),
('Bolo','Bolo Sem Açucar','Bolo ZERO Açucar',120.25,89.23,'b_fruta.jpg'),
('Bolo','Bolo Chocolate','Delicioso bolo de Chocolate',89.25,69.23,'b_chocolate.jpg'),
('Doce','Premium','Doces especiais pra pessoas especiais!',85.25,67.23,'d_cachepo.jpg'),
('Doce','Tradicionais','Vai um brigadeiro?',82.21,51.15,'d_brigadeiro.jpg'),
('Doce','Clássicos','Aqueles doces atemporais',65.25,35.83,'d_casadinho.jpg'),
('Doce','Padrinhos','Convites lindos e saborosos.',75.25,57.23,'d_tablete.jpg'),
('Doce','Convidados','Lembraças Inesquecíveis',64.25,38.23,'d_bem_casado.jpg');

CREATE TABLE IF NOT EXISTS pedidos(
	  idpedidos INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(50),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    nome_produto VARCHAR(100),
    quantidade INTEGER,
    valor_unit DECIMAL(8,2),
    valor_total DECIMAL(8,2)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vendas(
	  idvendas INT AUTO_INCREMENT,
    idpedidos INT,
    id_produto INT,
    PRIMARY KEY(idvendas, idpedidos, id_produto),
    FOREIGN KEY(idpedidos) REFERENCES pedidos (idpedidos),
    FOREIGN KEY(id_produto) REFERENCES produtos (id_produto)

)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO vendas VALUES 
(default, 1, 1),
(default, 2, 2),
(default, 2, 3);



CREATE TABLE