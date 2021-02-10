-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lojadatia
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bolo'),(2,'Doce');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Edmar','Teste'),(2,'Edmar 2','Teste2'),(3,'Edmar','Edmar\n'),(4,'Edmar Miller','Edmar-----'),(5,'Edmar',''),(6,'Edmar','Miller\n'),(7,'Edmar Miller Gabriel','gsdfgsdfg'),(8,'fasdfa','fasdfasf'),(9,'fasdfasf','fasdfasd');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_categoria`
--

DROP TABLE IF EXISTS `produto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_categoria` (
  `idcategoria` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  KEY `fk-id-produto_idx` (`idproduto`),
  KEY `fk-id-categoria_idx` (`idcategoria`),
  CONSTRAINT `fk-id-categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk-id-produto` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_categoria`
--

LOCK TABLES `produto_categoria` WRITE;
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
INSERT INTO `produto_categoria` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(2,7),(2,8);
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `preco` decimal(8,2) DEFAULT NULL,
  `preco_final` decimal(8,2) DEFAULT NULL,
  `imagem` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Bolo Branco','Delicioso bolo Branco',89.25,69.23,'b_branco.jpg'),(2,'Bolo Sem Açucar','Bolo ZERO Açucar',120.25,89.23,'b_fruta.jpg'),(3,'Bolo Chocolate','Delicioso bolo de Chocolate',89.25,69.23,'b_chocolate.jpg'),(4,'Premium','Doces especiais pra pessoas especiais!',85.25,67.23,'d_cachepo.jpg'),(5,'Tradicionais','Vai um brigadeiro?',82.21,51.15,'d_brigadeiro.jpg'),(6,'Clássicos','Aqueles doces atemporais',65.25,35.83,'d_casadinho.jpg'),(7,'Padrinhos','Convites lindos e saborosos.',75.25,57.23,'d_tablete.jpg'),(8,'Convidados','Lembraças Inesquecíveis',64.25,38.23,'d_bem_casado.jpg');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL AUTO_INCREMENT,
  `idpedidos` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`idvendas`,`idpedidos`,`id_produto`),
  KEY `idpedidos` (`idpedidos`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`idpedidos`) REFERENCES `pedidos` (`idpedidos`),
  CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (4,1,1),(5,2,2),(6,2,3);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wv2_produtos`
--

DROP TABLE IF EXISTS `wv2_produtos`;
/*!50001 DROP VIEW IF EXISTS `wv2_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wv2_produtos` AS SELECT 
 1 AS `categoria`,
 1 AS `nome`,
 1 AS `descricao`,
 1 AS `preco`,
 1 AS `preco_final`,
 1 AS `imagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wv_produtos`
--

DROP TABLE IF EXISTS `wv_produtos`;
/*!50001 DROP VIEW IF EXISTS `wv_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wv_produtos` AS SELECT 
 1 AS `idcategoria`,
 1 AS `idproduto`,
 1 AS `id_categoria`,
 1 AS `categoria`,
 1 AS `id_produto`,
 1 AS `nome`,
 1 AS `descricao`,
 1 AS `preco`,
 1 AS `preco_final`,
 1 AS `imagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `wv2_produtos`
--

/*!50001 DROP VIEW IF EXISTS `wv2_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wv2_produtos` AS select `categoria`.`categoria` AS `categoria`,`produtos`.`nome` AS `nome`,`produtos`.`descricao` AS `descricao`,`produtos`.`preco` AS `preco`,`produtos`.`preco_final` AS `preco_final`,`produtos`.`imagem` AS `imagem` from ((`produto_categoria` join `categoria` on((`categoria`.`id_categoria` = `produto_categoria`.`idcategoria`))) join `produtos` on((`produtos`.`id_produto` = `produto_categoria`.`idproduto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wv_produtos`
--

/*!50001 DROP VIEW IF EXISTS `wv_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wv_produtos` AS select `produto_categoria`.`idcategoria` AS `idcategoria`,`produto_categoria`.`idproduto` AS `idproduto`,`categoria`.`id_categoria` AS `id_categoria`,`categoria`.`categoria` AS `categoria`,`produtos`.`id_produto` AS `id_produto`,`produtos`.`nome` AS `nome`,`produtos`.`descricao` AS `descricao`,`produtos`.`preco` AS `preco`,`produtos`.`preco_final` AS `preco_final`,`produtos`.`imagem` AS `imagem` from ((`produto_categoria` join `categoria` on((`categoria`.`id_categoria` = `produto_categoria`.`idcategoria`))) join `produtos` on((`produtos`.`id_produto` = `produto_categoria`.`idproduto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-05 10:33:17
