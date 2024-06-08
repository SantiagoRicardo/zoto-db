-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: zoto_db
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `objects`
--
CREATE DATABASE zoto_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoto_db;


DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT "Identificador unico del objeto",
  `user_id` int DEFAULT NULL COMMENT "Identificador del usuario que posee el objeto",
  `object_name` varchar(50) NOT NULL COMMENT "Nombre del objeto",
  `object_image` varchar(255) DEFAULT NULL COMMENT "Imagen del objeto",
  `quantity` int NOT NULL COMMENT "Cantidad de objetos",
  `enabled` tinyint(1) DEFAULT '1' COMMENT "Indica si el objeto esta habilitado (1) o no (0)",
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `objects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES
(1,1,'Balón de futbol','balon_futbol.webp',1,1),
(2,1,'Bicicleta para niño','bicicleta_nino.webp',1,1),
(3,1,'Caja de herramientas','caja_herramientas.webp',1,1),
(4,1,'Libro Caballo de Troya 1','libro_jj_benitez.webp',1,1),

(5,2,'Flauta','flauta.webp',1,1),
(6,2,'Game boy','game_boy.webp',1,1),
(7,2,'Libro Grandes esperanzas','libro_charles_dickens.webp',1,1),
(8,2,'Libro Corazón delator','libro_edgar_allan_poe.webp',1,1),

(9,3,'Guitarra','guitarra.webp',1,1),
(10,3,'Libro Cien años de soledad','libro_gabo.webp',1,1),
(11,3,'Licuadora','licuadora.webp',1,1),
(12,3,'Control de Xbox','control_xbox.webp',1,1),

(13,4,'Linterna','linterna.webp',1,1),
(14,4,'Libro Don Quijote de la Mancha','libro_miguel_de_cervantes.webp',1,1),
(15,4,'Monopatin para niño','monopatin_nino.webp',1,1),
(16,4,'Monopoly','monopoly.webp',1,1),

(17,5,'Libro Así hablaba Zaratustra','libro_nietzsche.webp',1,1),
(18,5,'Mueble','mueble.webp',1,1),
(19,5,'Multitoma','multitoma.webp',1,1),
(20,5,'Libro El Alquimista','libro_paulo_cohelo.webp',1,1);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT "Identificador unico de la oferta",
  `publication_id` int DEFAULT NULL COMMENT "Identificador de la publicacion asociada a la oferta",
  `user_offering_id` int DEFAULT NULL COMMENT "Identificador del usuario que realiza la oferta",
  `offer_description` varchar(255) DEFAULT NULL COMMENT "Descripcion de la oferta",
  `offer_state` enum('pending','accepted','rejected') DEFAULT 'pending' COMMENT "Estado de la oferta (pendiente, aceptada, rechazada)",
  `enabled` tinyint(1) DEFAULT '1' COMMENT "Indica si la oferta esta habilitada (1) o no (0)",
  PRIMARY KEY (`id`),
  KEY `publication_id` (`publication_id`),
  KEY `user_offering_id` (`user_offering_id`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`user_offering_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES
(1,1,4,"Te ofrezco $16.000","pending",1),
(2,1,5,"Te pago los $18.000 que pides","pending",1),
(3,3,2,"Me encantaría recibir este objeto","pending",1),
(4,6,3,"Puedo pagarte $45.000","pending",1),
(5,12,1,"Me interesa el control, te lo compro","pending",1),
(6,1,2,"Estoy interesado, ofrezco $19.000","pending",1),
(7,12,2,"Te doy $50.000 por el control","pending",1),
(8,12,3,"Ofrezco $52.000","pending",1),
(9,12,4,"Te lo cambio por un control de Play 2","pending",1),
(10,3,4,"Estoy muy interesado, la necesito","pending",1),
(11,10,4,"Me interesa el libro, ¿Me lo obsequias?","pending",1),
(12,10,3,"Te ofrezco el libro Juan Salvador Gaviota","pending",1),
(13,10,2,"Yo ofrezco un porta retrato de 40x30","pending",1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT "Identificador unico de la publicacion",
  `user_id` int NOT NULL COMMENT "Identificador del usuario que realiza la publicacion",
  `object_id` int NOT NULL COMMENT "Identificador del objeto asociado a la publicacion",
  `publication_description` varchar(255) DEFAULT NULL COMMENT "Descripcion de la publicacion",
  `transaction_type` enum('exchange','donation','sale') DEFAULT NULL COMMENT "Tipo de transaccion (intercambio, donacion, venta)",
  `cost` decimal DEFAULT 0 COMMENT "Costo del producto si es para venta",
  `create_date` datetime DEFAULT NULL COMMENT "Fecha de creacion de la publicacion",
  `enabled` tinyint(1) DEFAULT '1' COMMENT "Indica si la publicacion esta habilitada (1) o no (0)",
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `object_id` (`object_id`),
  CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `publications_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(1,1,1,"Vendo balón marca Golty en excelente estado","sale",18000,"2023-11-20 21:26:00",1),
(2,1,2,"Vendo bicicleta pequeña color azul y amarillo","sale",250000,"2023-11-20 21:26:00",1),
(3,1,3,"Regalo caja de herramientas con juego de destornilladores","donation",0,"2023-11-20 21:26:00",1),
(4,1,4,"Quiero intercambiar la primera parte de la saga de J.J. Benítez","exchange",0,"2023-11-20 21:26:00",1),

(5,2,5,"Quiero donar hermosa flauta profesional con estuche","donation",0,"2023-11-20 21:26:00",1),
(6,2,6,"Vendo video juego portatil con más de 100 juegos","sale",50000,"2023-11-20 21:26:00",1),
(7,2,7,"Dono libro en buen estado del autor Charles Dickens","donation",0,"2023-11-20 21:26:00",1),
(8,2,8,"Regalo libro en buen estado del autor Edgar Allan Poe","donation",0,"2023-11-20 21:26:00",1),

(9,3,9,"Vendo guitarra acústica en excelente estado a muy buen precio","sale",250000,"2023-11-20 21:26:00",1),
(10,3,10,"Intercambio libro icónico de Gabriel García Márquez","exchange",0,"2023-11-20 21:26:00",1),
(11,3,11,"Intercambio licuadora marca Oster con 5 velocidades","exchange",0,"2023-11-20 21:26:00",1),
(12,3,12,"Vendo control inalambrico para Xbox 360","sale",45000,"2023-11-20 21:26:00",1),

(13,4,13,"Cambio linterna de lago alcance marca Ultrafire","exchange",0,"2023-11-20 21:26:00",1),
(14,4,14,"Vendo los 4 tomos del Quijote de la Mancha","sale",90000,"2023-11-20 21:26:00",1),
(15,4,15,"Vendo monopatin casi nuevo para niño de 5 años","sale",150000,"2023-11-20 21:26:00",1),
(16,4,16,"Obsequio Juego de mesa Monopoly original","donation",0,"2023-11-20 21:26:00",1),

(17,5,17,"Dono libro del escritor y filósofo alemán Friedrich Nietzsche","donation",0,"2023-11-20 21:26:00",1),
(18,5,18,"Vendo mueble tipo alacena color blanco","sale",110000,"2023-11-20 21:26:00",1),
(19,5,19,"Vendo multitoma marca Alpec para 6 conectores","sale",25000,"2023-11-20 21:26:00",1),
(20,5,20,"Intercambio excelente obra del autor Paulo Cohelo","exchange",0,"2023-11-20 21:26:00",1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT "Identificador unico de la transaccion",
  `offer_id` int DEFAULT NULL COMMENT "Identificador de la oferta asociada a la transaccion",
  `transaction_type` enum('exchange','donation','sale') DEFAULT NULL COMMENT "Tipo de transaccion (intercambio, donacion, venta)",
  `transaction_state` enum('pending','completed','canceled') DEFAULT NULL COMMENT "Estado de la transaccion (pendiente, completada, cancelada)",
  `enabled` tinyint(1) DEFAULT '1' COMMENT "Indica si la transacción esta habilitada (1) o no (0)",
  PRIMARY KEY (`id`),
  KEY `offer_id` (`offer_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT "Identificador unico del usuario",
  `user_name` varchar(50) NOT NULL COMMENT "Nombre del usuario",
  `adress` varchar(100) NOT NULL COMMENT "Direccion del usuario",
  `phone` bigint NOT NULL COMMENT "Telefono del usuario",
  `email` varchar(50) NOT NULL COMMENT "Correo electronico del usuario (unico)",
  `user_password` varchar(255) NOT NULL COMMENT "Contrasena del usuario",
  `enabled` tinyint(1) DEFAULT '1' COMMENT "Indica si el usuario esta habilitado (1) o no (0)",
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ricardo Mendoza','Calle 10 # 20-30',3108276532,'ricardo18@gmail.com','123456',1),
(2,'Santiago Ricardo','Carrera 15 # 40-50',3158794512,'sricardodev@gmail.com','123456',1),
(3,'Wilmer Siza','Avenida 5 # 60-70',3217896541,'wilmer08@hotmail.com','123456',1),
(4,'Leindis Monterroza','Diagonal 25 # 80-90',3004569874,'leindis@gmail.com','123456',1),
(5,'Carlos Restrepo','Transversal 35 # 100-110',3203547891,'kastrepo99@live.com','123456',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 15:00:29
