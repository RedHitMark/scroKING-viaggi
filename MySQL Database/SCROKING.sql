-- --------------------------------------------------------
-- Host:                         scroking.ddns.net
-- Server version:               10.1.37-MariaDB-0+deb9u1 - Raspbian 9.0
-- Server OS:                    debian-linux-gnueabihf
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for scroKING
CREATE DATABASE IF NOT EXISTS `scroKING` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `scroKING`;

-- Dumping structure for procedure scroKING.affittaMezzo
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `affittaMezzo`(
	IN `pMezzo` INT,
	IN `pCostoAffitto` DECIMAL(10,2),
	IN `pDataInizioAffitto` DATE,
	IN `pDataFineAffitto` DATE

,
	IN `pViaggio` INT

)
BEGIN
	SET @numMezzi = (SELECT COUNT(*) FROM Mezzi WHERE codMezzo = pMezzo);
	SET @numViaggi = (SELECT COUNT(*) FROM Viaggi WHERE codViaggio = pViaggio);
	
	IF (@numMezzi = 1 AND @numViaggi = 1) THEN 
		UPDATE Mezzi 
		SET costoAffitto = pCostoAffitto, dataInizioAffitto = pDataInizioAffitto, dataFineAffitto = pDataFineAffitto, viaggio = pViaggio 
		WHERE codMezzo = pMezzo;
	ELSE
		SIGNAL SQLSTATE '45000' SET message_text = 'Mezzo non trovato';
	END IF;
END//
DELIMITER ;

-- Dumping structure for table scroKING.Alberghi
CREATE TABLE IF NOT EXISTS `Alberghi` (
  `codAlbergo` int(10) unsigned NOT NULL,
  `denominazione` varchar(50) NOT NULL,
  `stanzeDisponibili` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codAlbergo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Alberghi: ~24 rows (approximately)
/*!40000 ALTER TABLE `Alberghi` DISABLE KEYS */;
INSERT INTO `Alberghi` (`codAlbergo`, `denominazione`, `stanzeDisponibili`) VALUES
	(7, 'La Pecora - Alghero', 69),
	(18, 'BestWestern - Amsterdam', 174),
	(33, 'Rinascimento - Campobasso', 30),
	(54, 'Centrum Palace - Campobasso', 50),
	(67, '	Meridiano - Termoli', 20),
	(86, '	Mistral - Termoli', 30),
	(94, 'Hotel Bristol Palace - Genova', 23),
	(347, 'La Fonte del Astore - Castelpetroso', 35),
	(356, 'Hilton Times Square - New York', 70),
	(463, 'Corus Hotel Hyde Park - Londra', 346),
	(564, 'i31 Hotel - Berlino', 72),
	(578, 'Grand Hotel Europa - Isernia', 40),
	(579, 'La Costa - Cagliari', 89),
	(648, 'The Sukhothai - Shanghai', 100),
	(689, 'Villa Ba Moshava - Gerusalemme', 84),
	(735, 'Corinthia Hotel - Budapest', 62),
	(2335, 'Gardenia Luxury Room - Pescara', 63),
	(5646, 'Radisson Blu Hotel - Berlin', 25),
	(6516, 'Movenpick Hotel & Casino - Ginevra', 41),
	(6545, 'Hotel Spadari al Duomo - Milano', 46),
	(7812, 'Shangri-La Hotel - Pechino', 5),
	(8564, 'Dongugliemo - Campobasso', 30),
	(75647, 'Corso 281 - Roma', 70),
	(7537383, 'Keio Plaza Hotel - Tokyo', 26);
/*!40000 ALTER TABLE `Alberghi` ENABLE KEYS */;

-- Dumping structure for table scroKING.Clienti
CREATE TABLE IF NOT EXISTS `Clienti` (
  `codFiscale` varchar(16) NOT NULL,
  `nomeCliente` varchar(15) NOT NULL,
  `cognomeCliente` varchar(20) NOT NULL,
  `sesso` enum('M','F') NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `indirizzo` varchar(30) NOT NULL,
  PRIMARY KEY (`codFiscale`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Clienti: ~17 rows (approximately)
/*!40000 ALTER TABLE `Clienti` DISABLE KEYS */;
INSERT INTO `Clienti` (`codFiscale`, `nomeCliente`, `cognomeCliente`, `sesso`, `telefono`, `indirizzo`) VALUES
	('CRMGNN98H04H926X', 'Giovanni', 'Ciaramella', 'M', '+39 327 840 4153', 'c.da Collelongo, 39A'),
	('CTNLCU72A06F839H', 'Luca', 'Catone', 'M', '+39 328 900 2356', 'c.da Colle delle api, 21'),
	('DSCCRS98P05B519J', 'Christian', 'Discenza', 'M', '+39 349 547 5475', 'via Monsignor Bologna, 46'),
	('FGNSFN98H10B519L', 'Stefano', 'Fagnano', 'M', '+39 327 834 9902', 'via Pirandello, 21'),
	('FRNRMN70R07H501E', 'Francesco', 'Romano', 'M', '+39 328 458 3456', 'Via Geneova,1'),
	('GLTFRZ98L19B519N', 'Fabrizo', 'Galati', 'M', '+39 327 869 5702', 'via Veneto, 20'),
	('GRZRCV97E02F839H', 'Grazia', 'Arcavolo', 'F', '+39 329 845 2569', 'via Puglia, 21'),
	('MRCSST70L04F839L', 'Marco', 'Espostio', 'M', '+39 339 1258817', 'via Mazzini, 34B'),
	('NNAFNC65M45B519W', 'Anna', 'Franco', 'F', '+39 392 540 1222', 'via Milano, 98'),
	('NTNSST79A01F839B', 'Antonio ', 'Esposito', 'M', '+39 324 128 9120', 'via Ungaretti,32'),
	('PPPPPP98A00B519G', 'Peppe', 'N/D', 'M', '+39 335 353 3463', 'via Roma, 100'),
	('RSSLSS68L06L219D', 'Alessio ', 'Rossi', 'M', '+39 327 285 8681', 'via, Ungaretti, 45'),
	('RSSMRA80A01H501U', 'Maria', 'Rossi', 'F', '+39 327 650 7000', 'via Roma,13'),
	('RSSMRC98E10B519G', 'Marco', 'Russodivito', 'M', '+39 388 166 3571', 'via Emilia, 21'),
	('VLLLCU94R06H501Z', 'Luca', 'Vallo', 'M', '+39 334 567 987', 'via Stalla, 45'),
	('VLNLSS98H11B519J', 'Alessio', 'Valente', 'M', '+39 331 123 4567', 'via Garibaldi, 23'),
	('ZLLMHL84M07H501A', 'Michele', 'Zollo', 'M', '+39 389 080 8888', 'via Toscana, 20');
/*!40000 ALTER TABLE `Clienti` ENABLE KEYS */;

-- Dumping structure for procedure scroKING.deleteCliente
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `deleteCliente`(
	IN `pCodFiscale` VARCHAR(50)

)
BEGIN
	DELETE FROM Clienti 
	WHERE Clienti.codFiscale = pCodFiscale;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.deleteViaggio
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `deleteViaggio`(
	IN `pCodViaggio` INT
)
BEGIN
	DELETE FROM Viaggi 
	WHERE Viaggi.codViaggio = pCodViaggio;
END//
DELIMITER ;

-- Dumping structure for table scroKING.Dipendenti
CREATE TABLE IF NOT EXISTS `Dipendenti` (
  `numContratto` int(10) unsigned NOT NULL,
  `albergo` int(10) unsigned NOT NULL,
  `nomeDipendente` varchar(20) NOT NULL,
  `cognomeDipendente` varchar(20) NOT NULL,
  `dataNascita` date NOT NULL,
  `tipoDipendente` enum('fisso','fisso dirigente','stagionale') NOT NULL,
  `tipoRetribuzione` enum('annuale','giornaliera') NOT NULL,
  `retribuzione` decimal(10,2) unsigned NOT NULL,
  `qualifica` varchar(30) DEFAULT '',
  `dataInizioContratto` date NOT NULL,
  `dataFineContratto` date DEFAULT NULL,
  PRIMARY KEY (`numContratto`,`albergo`),
  KEY `Dipendenti_ibfk_1` (`albergo`),
  CONSTRAINT `Dipendenti_ibfk_1` FOREIGN KEY (`albergo`) REFERENCES `Alberghi` (`codAlbergo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Dipendenti: ~86 rows (approximately)
/*!40000 ALTER TABLE `Dipendenti` DISABLE KEYS */;
INSERT INTO `Dipendenti` (`numContratto`, `albergo`, `nomeDipendente`, `cognomeDipendente`, `dataNascita`, `tipoDipendente`, `tipoRetribuzione`, `retribuzione`, `qualifica`, `dataInizioContratto`, `dataFineContratto`) VALUES
	(1, 33, 'Carmine', 'Abate', '1978-06-27', 'fisso', 'annuale', 1400.20, 'lavapiatti', '1990-12-12', NULL),
	(1, 54, 'Michele', 'Aiello', '1979-01-10', 'fisso', 'annuale', 1400.20, 'lavapiatti', '1991-02-18', NULL),
	(1, 67, 'Filippo', 'Aliberti', '1979-08-16', 'fisso', 'annuale', 1400.20, 'lavapiatti', '1991-08-27', NULL),
	(1, 86, 'Maria', 'Apostolico', '1979-11-14', 'fisso', 'annuale', 1400.20, 'cameriere', '1992-03-10', NULL),
	(1, 94, 'Daniele', 'Apreda', '1979-12-20', 'fisso', 'annuale', 1400.20, 'cameriere', '1992-12-14', NULL),
	(1, 347, 'Tina', 'Boccardo', '1980-06-30', 'fisso', 'annuale', 1400.20, 'cameriere', '1993-02-25', NULL),
	(1, 356, 'Giuseppina', 'Caldieri', '1981-07-17', 'fisso', 'annuale', 1400.20, 'bagnino', '1993-12-13', NULL),
	(1, 463, 'Lara', 'Cantiello', '1985-02-28', 'fisso', 'annuale', 1400.20, 'chef', '1994-04-28', NULL),
	(1, 564, 'Biagio', 'Carrella', '1985-03-29', 'fisso', 'annuale', 1400.20, 'custode', '1994-10-28', NULL),
	(1, 578, 'Maurizio', 'Cerrato', '1985-05-21', 'fisso', 'annuale', 1400.20, 'receptionist', '1995-05-15', NULL),
	(1, 648, 'Verusca', 'Colombo', '1986-03-11', 'fisso', 'annuale', 1400.20, 'facchino', '1995-07-13', NULL),
	(1, 689, 'Biagio', 'Cosenza', '1986-08-12', 'fisso', 'annuale', 1450.36, 'parcheggiatore ', '1995-09-25', NULL),
	(1, 735, 'Giuseppe', 'Cretella', '1987-03-26', 'fisso', 'annuale', 1450.36, 'chef', '1995-11-14', NULL),
	(1, 2335, 'Michele', 'D\'amaro', '1987-04-27', 'fisso', 'annuale', 1450.36, 'receptionist', '1997-04-07', NULL),
	(1, 5646, 'Ilaria', 'De Crescenzo', '1987-07-27', 'fisso', 'annuale', 1450.36, 'custode', '1998-05-28', NULL),
	(1, 6516, 'Mattia', 'De Rosa', '1988-10-04', 'fisso', 'annuale', 1450.36, 'facchino', '1998-06-01', NULL),
	(1, 6545, 'Marianna', 'Del Monte', '1989-02-07', 'fisso', 'annuale', 1450.36, 'bagnino', '1998-12-28', NULL),
	(1, 7812, 'Marco', 'Del Percio', '1989-03-01', 'fisso', 'annuale', 1450.36, 'chef', '2001-03-06', NULL),
	(1, 8564, 'Raffaella', 'Di Cerbo', '1990-04-04', 'fisso', 'annuale', 1450.36, 'lavapiatti', '2002-01-22', NULL),
	(1, 75647, 'Elsa', 'Di Criscienzo', '1990-08-24', 'fisso', 'annuale', 1450.36, 'cameriere', '2004-05-21', NULL),
	(1, 7537383, 'Antonio', 'Di Matteo', '1990-11-08', 'fisso', 'annuale', 1450.36, 'facchino', '2004-09-24', NULL),
	(2, 33, 'Federico', 'Distante', '1991-06-17', 'fisso', 'annuale', 1450.36, 'dj', '2005-09-01', NULL),
	(2, 54, 'Valerio', 'Donnarumma', '1993-02-01', 'fisso', 'annuale', 1450.36, 'dj', '2007-02-14', NULL),
	(2, 67, 'Giuseppina', 'Fasulo', '1993-07-02', 'fisso', 'annuale', 1450.36, 'inserviente', '2007-10-05', NULL),
	(2, 86, 'Carmine', 'Fedullo', '1995-06-21', 'fisso', 'annuale', 1320.34, 'inserviente', '2008-08-12', NULL),
	(2, 94, 'Valentina', 'Feola', '1975-03-19', 'fisso', 'annuale', 1320.34, 'inserviente', '1990-11-26', NULL),
	(2, 347, 'Fabio', 'Ferraguto', '1975-03-28', 'fisso', 'annuale', 1320.34, 'maitre di sala', '1991-05-01', NULL),
	(2, 356, 'Domenico', 'Furno', '1975-07-18', 'fisso', 'annuale', 1320.34, 'maitre di sala', '1991-07-09', NULL),
	(2, 463, 'Giuseppe', 'Guarino', '1975-12-08', 'fisso', 'annuale', 1320.34, 'aiuto cuoco', '1993-02-05', NULL),
	(2, 564, 'Federico', 'Guerriero', '1976-01-07', 'fisso', 'annuale', 1320.34, 'chef', '1994-09-02', NULL),
	(2, 578, 'Massimo', 'Guida', '1977-11-01', 'fisso', 'annuale', 1320.34, 'parcheggiatore', '1995-09-22', NULL),
	(2, 648, 'Mirko', 'Guida', '1980-11-14', 'fisso', 'annuale', 1320.34, 'maitre di sala', '1998-10-26', NULL),
	(2, 689, 'Antonio', 'Ingenito', '1981-05-01', 'fisso', 'annuale', 1320.34, 'receptionist', '2000-02-24', NULL),
	(2, 735, 'Giuseppe', 'Izzo', '1981-12-01', 'fisso', 'annuale', 1320.34, 'dj', '2000-05-31', NULL),
	(2, 2335, 'Vincenzo', 'Licursi', '1983-12-28', 'fisso', 'annuale', 1250.40, 'chef', '2000-08-09', NULL),
	(2, 5646, 'Roberta ', 'Marasco', '1984-02-17', 'fisso', 'annuale', 1250.40, 'maitre di sala', '2001-02-23', NULL),
	(2, 6516, 'Alessandro Maria', 'Martellone', '1984-07-24', 'fisso', 'annuale', 1250.40, 'inserviete', '2001-03-09', NULL),
	(2, 6545, 'Paolo', 'Melone', '1985-05-01', 'fisso', 'annuale', 1250.40, 'lavapiatti', '2001-07-04', NULL),
	(2, 7812, 'Massimo', 'Minichiello', '1985-05-29', 'fisso', 'annuale', 1250.40, 'chef', '2002-01-23', NULL),
	(2, 8564, 'Anamaria ', 'Lally  ', '1996-12-11', 'stagionale', 'giornaliera', 50.00, NULL, '2019-01-14', '2019-11-13'),
	(2, 75647, 'Ellena ', 'Everly  ', '1954-12-16', 'stagionale', 'giornaliera', 40.00, NULL, '2019-01-16', '2019-11-15'),
	(2, 7537383, 'Penney ', 'Linkous  ', '1958-03-22', 'stagionale', 'giornaliera', 35.00, NULL, '2019-01-17', '2019-11-25'),
	(3, 33, 'Cristina', 'Negrone', '1967-11-07', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '1995-10-30', NULL),
	(3, 54, 'Armando', 'Pagliara', '1968-10-31', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '1996-11-20', NULL),
	(3, 67, 'Raffaele', 'Sangiovanni', '1969-10-21', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '1999-11-10', NULL),
	(3, 86, 'Roberto', 'Soriente', '1973-04-19', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '2001-04-30', NULL),
	(3, 94, 'Antonio', 'Zambrano', '1977-04-19', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '2002-11-19', NULL),
	(3, 347, 'Lila ', 'Albright  ', '1957-05-19', 'fisso dirigente', 'annuale', 2700.50, 'Direttore albergo', '2006-12-12', NULL),
	(3, 356, 'Jovan ', 'Balls  ', '1968-12-23', 'stagionale', 'giornaliera', 50.00, NULL, '2018-10-25', '2019-06-27'),
	(3, 463, 'Elenora ', 'Petite  ', '1973-10-24', 'stagionale', 'giornaliera', 40.00, NULL, '2018-11-05', '2019-07-03'),
	(3, 564, 'Shara ', 'Veazey  ', '1977-07-16', 'stagionale', 'giornaliera', 35.00, NULL, '2018-11-07', '2019-07-11'),
	(3, 578, 'Shoshana  ', 'Gillmore ', '1985-05-25', 'stagionale', 'giornaliera', 50.00, NULL, '2018-11-08', '2019-07-15'),
	(3, 648, 'Jenifer ', 'Stoner  ', '1986-02-23', 'stagionale', 'giornaliera', 40.00, NULL, '2018-11-20', '2019-07-22'),
	(3, 689, 'Latricia ', 'Devaughn  ', '1987-12-06', 'stagionale', 'giornaliera', 35.00, NULL, '2018-11-22', '2019-07-29'),
	(3, 735, 'Jackie   ', 'Vause', '1989-02-22', 'stagionale', 'giornaliera', 50.00, NULL, '2018-11-30', '2019-08-20'),
	(3, 2335, 'Marline  ', 'Stumpf ', '1989-07-16', 'stagionale', 'giornaliera', 40.00, NULL, '2018-12-05', '2019-08-27'),
	(3, 5646, 'Brady', ' Mcateer  ', '1990-03-26', 'stagionale', 'giornaliera', 35.00, NULL, '2018-12-19', '2019-09-04'),
	(3, 6516, 'Zulema ', 'Hoos  ', '1990-07-22', 'stagionale', 'giornaliera', 50.00, NULL, '2018-12-31', '2019-09-10'),
	(3, 6545, 'Shavonda ', 'Deroche  ', '1994-09-26', 'stagionale', 'giornaliera', 40.00, NULL, '2019-01-01', '2019-10-15'),
	(3, 7812, 'Lora', 'Gaddis  ', '1996-03-11', 'stagionale', 'giornaliera', 35.00, NULL, '2019-01-10', '2019-10-21'),
	(4, 33, 'Maria', 'Nicolino', '1968-02-07', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '1996-05-14', NULL),
	(4, 54, 'Diego', 'Pesce', '1969-01-28', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '1997-04-30', NULL),
	(4, 67, 'Ivano Benito', 'Scoppetta', '1970-04-07', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '1999-11-26', NULL),
	(4, 86, 'Luigi', 'Sorrentino', '1974-07-02', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '2001-07-12', NULL),
	(4, 94, 'Nicholle ', 'Shippy  ', '1977-09-27', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '2004-03-03', NULL),
	(4, 347, 'Mariah ', 'Janis  ', '1960-11-27', 'fisso dirigente', 'annuale', 2400.40, 'Direttore ristorante', '2007-05-23', NULL),
	(5, 33, 'Domenico', 'Nunziata', '1968-06-04', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '1996-05-15', NULL),
	(5, 54, 'Alessandro', 'Russo', '1969-09-03', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '1998-12-17', NULL),
	(5, 67, 'Tiziana', 'Sellitto', '1970-10-05', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '2000-10-23', NULL),
	(5, 86, 'Gaetano', 'Valiante', '1974-10-31', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '2001-11-13', NULL),
	(5, 94, 'Emeline', 'Brunk  ', '1978-08-01', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '2005-08-05', NULL),
	(5, 347, 'Anna ', 'Nero', '1962-03-26', 'fisso dirigente', 'annuale', 2500.34, 'Direttore amministrativo', '2007-06-19', NULL),
	(6, 33, 'Roberta', 'Pacileo', '1968-10-10', 'fisso dirigente', 'annuale', 1900.78, 'Capo ufficio contabile', '1996-08-27', NULL),
	(6, 54, 'Giuseppe', 'Sagliocco', '1969-09-24', 'fisso dirigente', 'annuale', 1900.78, 'Capo ufficio contabile', '1999-09-08', NULL),
	(6, 67, 'Gaetano', 'Sementina', '1971-09-27', 'fisso dirigente', 'annuale', 1900.78, 'Capo ufficio contabile', '2000-11-22', NULL),
	(6, 86, 'Giuseppina', 'Vines', '1976-06-03', 'fisso dirigente', 'annuale', 1900.78, 'Capo ufficio contabile', '2002-07-29', NULL),
	(6, 94, 'Latosha ', 'Patricia  ', '1978-12-12', 'fisso dirigente', 'annuale', 1900.78, 'Capo ufficio contabile', '2005-09-28', '2019-02-08'),
	(6, 347, 'Ezra ', 'Mendenhall  ', '1968-12-14', 'stagionale', 'giornaliera', 35.00, NULL, '2018-10-24', '2019-06-04'),
	(7, 33, 'Moira ', 'Rodd  ', '1963-11-24', 'stagionale', 'giornaliera', 50.00, NULL, '2018-10-02', '2019-03-11'),
	(7, 54, 'Jeanette ', 'Richards  ', '1965-03-26', 'stagionale', 'giornaliera', 40.00, NULL, '2018-10-03', '2019-03-19'),
	(7, 67, 'Boris ', 'Bolender  ', '1966-04-18', 'stagionale', 'giornaliera', 35.00, NULL, '2018-10-05', '2019-04-08'),
	(7, 86, 'Jacklyn ', 'Rainer  ', '1967-05-09', 'stagionale', 'giornaliera', 50.00, NULL, '2018-10-11', '2019-04-11'),
	(7, 94, 'Henriette ', 'Rodrigues  ', '1968-04-15', 'stagionale', 'giornaliera', 40.00, NULL, '2018-10-19', '2019-05-17'),
	(8, 33, 'Tana   ', 'Cushing', '1959-03-21', 'stagionale', 'giornaliera', 50.00, NULL, '2019-01-22', '2019-12-10'),
	(8, 54, 'Jeannette', ' Delaune  ', '1959-09-25', 'stagionale', 'giornaliera', 40.00, NULL, '2019-01-25', '2019-12-11'),
	(8, 67, 'Marcelene ', 'Isabelle  ', '1962-12-02', 'stagionale', 'giornaliera', 35.00, NULL, '2019-01-28', '2019-12-23');
/*!40000 ALTER TABLE `Dipendenti` ENABLE KEYS */;

-- Dumping structure for procedure scroKING.getAlberghi
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getAlberghi`()
BEGIN
	SELECT *
	FROM Alberghi;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getClienti
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getClienti`()
BEGIN
	SELECT *
	FROM Clienti;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getDipendenti
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getDipendenti`()
BEGIN
	SELECT *
	FROM Dipendenti;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getMezzi
DELIMITER //
CREATE DEFINER=`stefano`@`%` PROCEDURE `getMezzi`()
BEGIN
	SELECT *
	FROM Mezzi;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getPrenotazioni
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getPrenotazioni`()
BEGIN
	SELECT *
	FROM Prenotazioni;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getSoggiorni
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getSoggiorni`()
BEGIN
	SELECT *
	FROM Soggiorni;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getTelefoniAlberghi
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getTelefoniAlberghi`()
BEGIN
	SELECT *
	FROM TelefoniAlberghi;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.getViaggi
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `getViaggi`()
BEGIN
	SELECT *
	FROM Viaggi;
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertAlbergo
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertAlbergo`(
	IN `pCodAlbergo` INT,
	IN `pDenominazione` VARCHAR(50),
	IN `pStanzeDisponibili` INT



)
BEGIN
	INSERT INTO Alberghi (codAlbergo, denominazione, stanzeDisponibili) VALUES (pCodAlbergo, pDenominazione, pStanzeDisponibili);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertCliente
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertCliente`(
	IN `pCodFiscale` VARCHAR(16),
	IN `pNome` VARCHAR(15),
	IN `pCognome` VARCHAR(20),
	IN `pSesso` ENUM('M', 'F'),
	IN `pTelefono` VARCHAR(16),
	IN `pIndirizzo` VARCHAR(30)

)
BEGIN
	INSERT INTO Clienti (codFiscale, nomeCliente, cognomeCliente, sesso, telefono, indirizzo)	VALUES (pCodFiscale, pNome, pCognome, pSesso, pTelefono, pIndirizzo);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertDipendenteFisso
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertDipendenteFisso`(
	IN `pAlbergo` INT(10),
	IN `pNome` VARCHAR(20),
	IN `pCognome` VARCHAR(20),
	IN `pDataNascita` DATE

,
	IN `pRetribuzione` DECIMAL(10,2),
	IN `pQualifica` VARCHAR(50),
	IN `pDataInizioContratto` DATE
)
BEGIN
	SET @nCodContratto = (SELECT MAX(numContratto)+1 FROM Dipendenti WHERE albergo = pAlbergo);

	INSERT INTO Dipendenti (numContratto, albergo, nomeDipendente, cognomeDipendente, dataNascita, tipoDipendente, tipoRetribuzione, retribuzione, qualifica, dataInizioContratto) 
	VALUES(@nCodContratto, pAlbergo, pNome, pCognome, pDataNascita, 'fisso', 'annuale', pRetribuzione, pQualifica, pDataInizioContratto);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertDipendenteStagionale
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertDipendenteStagionale`(
	IN `pAlbergo` INT(10),
	IN `pNome` VARCHAR(20),
	IN `pCognome` VARCHAR(20),
	IN `pDataNascita` DATE,
	IN `pRetribuzione` DECIMAL(10,2),
	IN `pDataInizioContratto` DATE,
	IN `pDataFineContratto` DATE


)
BEGIN
	SET @nCodContratto = (SELECT MAX(numContratto)+1 FROM Dipendenti WHERE albergo = pAlbergo);

	INSERT INTO Dipendenti (numContratto, albergo, nomeDipendente, cognomeDipendente, dataNascita, tipoDipendente, tipoRetribuzione, retribuzione, dataInizioContratto, dataFineContratto) 
	VALUES(@nCodContratto, pAlbergo, pNome, pCognome, pDataNascita, 'stagionale', 'giornaliera', pRetribuzione, pDataInizioContratto, pDataFineContratto);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertMezzo
DELIMITER //
CREATE DEFINER=`stefano`@`%` PROCEDURE `insertMezzo`(
	IN `pDescrizioneMezzo` VARCHAR(30),
	IN `pCapienzaMezzo` INT(10)




)
BEGIN 
	INSERT INTO Mezzi (descrizioneMezzo, capienzaMezzo)
	VALUES (pDescrizioneMezzo,pCapienzaMezzo);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertPrenotazione
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertPrenotazione`(
	IN `pCliente` CHAR(16),
	IN `pViaggio` INT,
	IN `pPSconto` DECIMAL(10,2),
	IN `pDataPrenotazone` DATE

)
BEGIN
	INSERT INTO Prenotazioni (cliente, viaggio, pSconto, dataPrenotazione)
	VALUES (pCliente, pViaggio, pPSconto, pDataPrenotazone);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertSoggiorno
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertSoggiorno`(
	IN `pViaggio` INT,
	IN `pAlbergo` INT,
	IN `pDataInizioSoggiorno` DATE,
	IN `pDataFineSoggiorno` DATE,
	IN `pNumStanze` INT

)
BEGIN
	INSERT INTO Soggiorni(viaggio, albergo, dataInizioSoggiorno, dataFineSoggiorno, numStanze)
	VALUES (pViaggio, pAlbergo, pDataInizioSoggiorno, pDataFineSoggiorno, pNumStanze);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertTelefono
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertTelefono`(
	IN `pNumero` VARCHAR(16)
,
	IN `pAlbergo` INT

)
BEGIN
	INSERT INTO TelefoniAlberghi (numero, albergo) VALUES (pNumero, pAlbergo);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.insertViaggio
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `insertViaggio`(
	IN `pCodViaggio` INT(10),
	IN `pTipoViaggio` VARCHAR(30),
	IN `pLuogoPartenza` VARCHAR(30),
	IN `pLuogoDestinazione` VARCHAR(30),
	IN `pCostoViaggio` DECIMAL(10,2),
	IN `pDataInizioViaggio` DATE,
	IN `pDataFineViaggio` DATE



)
BEGIN 
	INSERT INTO Viaggi (codViaggio, tipoViaggio, luogoPartenza, luogoDestinazione, costoViaggio, dataInizioViaggio, dataFineViaggio)
	VALUES(pCodViaggio, pTipoViaggio, pLuogoPartenza, pLuogoDestinazione, pCostoViaggio, pDataInizioViaggio, pDataFineViaggio);
END//
DELIMITER ;

-- Dumping structure for procedure scroKING.instertDipendenteFissoDirigente
DELIMITER //
CREATE DEFINER=`marco`@`%` PROCEDURE `instertDipendenteFissoDirigente`(
	IN `pAlbergo` INT,
	IN `pNome` INT,
	IN `pCognome` INT,
	IN `pDataNascita` INT,
	IN `pRetribuzione` INT,
	IN `pQualifica` INT,
	IN `pDataInizioContratto` INT
)
BEGIN
	SET @nCodContratto = (SELECT MAX(numContratto)+1 FROM Dipendenti WHERE albergo = pAlbergo);

	INSERT INTO Dipendenti (numContratto, albergo, nomeDipendente, cognomeDipendente, dataNascita, tipoDipendente, tipoRetribuzione, retribuzione, qualifica, dataInizioContratto) 
	VALUES(@nCodContratto, pAlbergo, pNome, pCognome, pDataNascita, 'fisso', 'annuale', pRetribuzione, pQualifica, pDataInizioContratto);
END//
DELIMITER ;

-- Dumping structure for table scroKING.Mezzi
CREATE TABLE IF NOT EXISTS `Mezzi` (
  `codMezzo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descrizioneMezzo` varchar(30) NOT NULL,
  `capienzaMezzo` int(10) unsigned NOT NULL,
  `viaggio` int(10) unsigned DEFAULT NULL,
  `costoAffitto` decimal(10,2) unsigned DEFAULT NULL,
  `dataInizioAffitto` date DEFAULT NULL,
  `dataFineAffitto` date DEFAULT NULL,
  PRIMARY KEY (`codMezzo`),
  KEY `FK_Mezzi_Viaggi` (`viaggio`),
  CONSTRAINT `FK_Mezzi_Viaggi` FOREIGN KEY (`viaggio`) REFERENCES `Viaggi` (`codViaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Mezzi: ~19 rows (approximately)
/*!40000 ALTER TABLE `Mezzi` DISABLE KEYS */;
INSERT INTO `Mezzi` (`codMezzo`, `descrizioneMezzo`, `capienzaMezzo`, `viaggio`, `costoAffitto`, `dataInizioAffitto`, `dataFineAffitto`) VALUES
	(1, 'ciarashuttle', 2, NULL, NULL, NULL, NULL),
	(2, 'boeing-747', 524, 4, 99.00, '2019-06-07', '2019-06-17'),
	(3, 'costa-minchia', 3000, 13, 300.00, '2019-08-10', '2019-08-24'),
	(4, 'veliero', 470, 3, 100.00, '2019-12-12', '2020-12-12'),
	(5, 'pullman', 55, 8, 999.99, '2019-03-04', '2019-03-07'),
	(6, 'lancia DELTA', 5, NULL, NULL, NULL, NULL),
	(7, 'pullman', 55, 7, 350.00, '2019-02-10', '2019-02-10'),
	(8, 'pullman', 55, 9, 650.00, '2019-04-06', '2019-04-06'),
	(9, 'boeing-747', 524, 5, 90.00, '2019-02-10', '2019-02-12'),
	(10, 'minivan', 9, 11, 190.00, '2019-03-08', '2019-03-09'),
	(11, 'doblò DICAPOBIANCO', 5, NULL, NULL, NULL, NULL),
	(12, 'taxi', 4, 13, 300.00, '2019-01-01', '2019-01-02'),
	(13, 'boeing-747', 524, 10, 120.00, '2019-09-01', '2019-09-10'),
	(14, 'alfa MITO', 4, NULL, NULL, NULL, NULL),
	(15, 'WW POLO', 5, NULL, NULL, NULL, NULL),
	(16, 'WW GOLF', 5, NULL, NULL, NULL, NULL),
	(17, 'audi a3 SPORTBACK', 5, NULL, NULL, NULL, NULL),
	(18, 'fiat FREEMONT', 7, NULL, NULL, NULL, NULL),
	(19, 'Navetta Unimol', 55, 1, 0.00, '2019-02-20', '2019-02-21');
/*!40000 ALTER TABLE `Mezzi` ENABLE KEYS */;

-- Dumping structure for table scroKING.Prenotazioni
CREATE TABLE IF NOT EXISTS `Prenotazioni` (
  `cliente` varchar(16) NOT NULL,
  `viaggio` int(10) unsigned NOT NULL,
  `pSconto` decimal(5,2) unsigned NOT NULL,
  `dataPrenotazione` date NOT NULL,
  PRIMARY KEY (`cliente`,`viaggio`),
  KEY `Prenotazioni_ibfk_1` (`viaggio`),
  KEY `Prenotazioni_ibfk_2` (`cliente`),
  CONSTRAINT `Prenotazioni_ibfk_1` FOREIGN KEY (`viaggio`) REFERENCES `Viaggi` (`codViaggio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Prenotazioni_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `Clienti` (`codFiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Prenotazioni: ~13 rows (approximately)
/*!40000 ALTER TABLE `Prenotazioni` DISABLE KEYS */;
INSERT INTO `Prenotazioni` (`cliente`, `viaggio`, `pSconto`, `dataPrenotazione`) VALUES
	('CRMGNN98H04H926X', 1, 100.00, '2019-02-19'),
	('CRMGNN98H04H926X', 13, 100.00, '2019-01-13'),
	('DSCCRS98P05B519J', 9, 14.00, '2019-01-14'),
	('FGNSFN98H10B519L', 4, 12.00, '2019-01-13'),
	('FRNRMN70R07H501E', 8, 0.00, '2019-01-14'),
	('NTNSST79A01F839B', 6, 1.50, '2019-01-14'),
	('PPPPPP98A00B519G', 2, 0.00, '2019-01-13'),
	('RSSMRC98E10B519G', 1, 1.00, '2019-02-12'),
	('RSSMRC98E10B519G', 3, 10.00, '2019-02-22'),
	('RSSMRC98E10B519G', 9, 10.00, '2019-03-30'),
	('RSSMRC98E10B519G', 11, 5.00, '2019-03-01'),
	('VLLLCU94R06H501Z', 5, 0.00, '2019-01-13'),
	('VLNLSS98H11B519J', 7, 2.00, '2019-01-14');
/*!40000 ALTER TABLE `Prenotazioni` ENABLE KEYS */;

-- Dumping structure for table scroKING.Soggiorni
CREATE TABLE IF NOT EXISTS `Soggiorni` (
  `viaggio` int(11) unsigned NOT NULL,
  `albergo` int(11) unsigned NOT NULL,
  `dataInizioSoggiorno` date NOT NULL,
  `dataFineSoggiorno` date NOT NULL,
  `numStanze` int(11) unsigned NOT NULL,
  PRIMARY KEY (`viaggio`,`albergo`),
  KEY `FK_Soggiorni_Alberghi` (`albergo`),
  KEY `FK_Soggiorni_Viaggi` (`viaggio`),
  CONSTRAINT `FK_Soggiorni_Alberghi` FOREIGN KEY (`albergo`) REFERENCES `Alberghi` (`codAlbergo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Soggiorni_Viaggi` FOREIGN KEY (`viaggio`) REFERENCES `Viaggi` (`codViaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Soggiorni: ~9 rows (approximately)
/*!40000 ALTER TABLE `Soggiorni` DISABLE KEYS */;
INSERT INTO `Soggiorni` (`viaggio`, `albergo`, `dataInizioSoggiorno`, `dataFineSoggiorno`, `numStanze`) VALUES
	(3, 689, '2019-12-16', '2019-12-19', 4),
	(4, 463, '2019-06-07', '2019-06-17', 1),
	(4, 578, '2019-06-06', '2019-06-07', 1),
	(5, 18, '2019-02-10', '2019-02-12', 2),
	(6, 347, '2019-01-30', '2019-02-01', 1),
	(8, 75647, '2019-03-04', '2019-03-07', 20),
	(9, 6545, '2019-04-07', '2019-04-16', 2),
	(11, 2335, '2019-03-08', '2019-03-09', 3),
	(13, 7, '2019-08-10', '2019-08-24', 3);
/*!40000 ALTER TABLE `Soggiorni` ENABLE KEYS */;

-- Dumping structure for table scroKING.TelefoniAlberghi
CREATE TABLE IF NOT EXISTS `TelefoniAlberghi` (
  `numero` varchar(16) NOT NULL,
  `albergo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `Telefoni_ibfk_1` (`albergo`),
  CONSTRAINT `TelefoniAlberghi_ibfk_1` FOREIGN KEY (`albergo`) REFERENCES `Alberghi` (`codAlbergo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.TelefoniAlberghi: ~32 rows (approximately)
/*!40000 ALTER TABLE `TelefoniAlberghi` DISABLE KEYS */;
INSERT INTO `TelefoniAlberghi` (`numero`, `albergo`) VALUES
	('+39 0874 481455', 33),
	('+39 0874 484931', 33),
	('+39 0874 413341', 54),
	('+39 0874 413342', 54),
	('+39 0875 702696', 67),
	('+39 0875 705946', 67),
	('+39 0875 705220', 86),
	('+39 0875 705246', 86),
	('+39 010 561756', 94),
	('+39 010 592541', 94),
	('+39 0865 936006', 347),
	('+39 0865 936085', 347),
	('+01 212 840 5516', 356),
	('+01 212 840 8222', 356),
	('+44 0207262 5022', 463),
	('+49 30 56837877', 564),
	('+39 0865 2126', 578),
	('+86 21 5237 8888', 648),
	('+972 2 542 3000', 689),
	('+36 1 479 4000 ', 735),
	('+36 1 479 4333 ', 735),
	('+39 085 8961378', 2335),
	('+39 085 8961379', 2335),
	('+49 4930 238280', 5646),
	('+41 22 717 11 11', 6516),
	('+39 02 72002371', 6545),
	('+86 10 6841 2211', 7812),
	('+39 0874 311901', 8564),
	('+39 0874 418178', 8564),
	('+39 06 87809370', 75647),
	('+81 3 3345 8269 ', 7537383),
	('+81 3 4510 0521', 7537383);
/*!40000 ALTER TABLE `TelefoniAlberghi` ENABLE KEYS */;

-- Dumping structure for table scroKING.Viaggi
CREATE TABLE IF NOT EXISTS `Viaggi` (
  `codViaggio` int(10) unsigned NOT NULL,
  `tipoViaggio` varchar(30) NOT NULL,
  `luogoPartenza` varchar(30) NOT NULL,
  `luogoDestinazione` varchar(30) NOT NULL,
  `costoViaggio` decimal(10,2) unsigned NOT NULL,
  `dataInizioViaggio` date NOT NULL,
  `dataFineViaggio` date NOT NULL,
  PRIMARY KEY (`codViaggio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table scroKING.Viaggi: ~14 rows (approximately)
/*!40000 ALTER TABLE `Viaggi` DISABLE KEYS */;
INSERT INTO `Viaggi` (`codViaggio`, `tipoViaggio`, `luogoPartenza`, `luogoDestinazione`, `costoViaggio`, `dataInizioViaggio`, `dataFineViaggio`) VALUES
	(1, 'Scrocco', 'Campobasso', 'Pesche', 0.00, '2019-02-20', '2019-02-20'),
	(2, 'Crociera', 'Termoli', 'Genova', 400.00, '2019-05-10', '2019-05-20'),
	(3, 'Crociata', 'Roma', 'Gerusalemme', 100.00, '2019-12-12', '2020-12-12'),
	(4, 'Internazionale', 'Roma', 'Londra', 800.00, '2019-06-07', '2019-06-17'),
	(5, 'Internazionale', 'Roma', 'amsterdam', 400.00, '2019-02-10', '2019-02-12'),
	(6, 'Relax', 'Campobasso', 'Castelpetroso', 370.00, '2019-01-30', '2019-02-01'),
	(7, 'Istruzione ', 'Campobasso', 'Città del Vaticano', 100.00, '2019-02-10', '2019-02-10'),
	(8, 'istruzione', 'Campobasso', 'Roma', 150.00, '2019-03-04', '2019-03-07'),
	(9, 'Organizzato ', 'Campobasso', 'Milano ', 250.00, '2019-04-06', '2019-04-17'),
	(10, 'Organizzzato ', 'Roma ', 'Gerusalemme', 1000.00, '2019-09-01', '2019-09-10'),
	(11, 'Relax', 'Campobasso', 'Pescara', 100.00, '2019-03-08', '2019-03-12'),
	(13, 'Mare', 'Campobasso', 'Alghero', 670.00, '2019-08-10', '2019-08-24'),
	(14, 'Mare', 'Campobasso', 'Cagliari', 1000.00, '2019-07-01', '2019-07-15'),
	(15, 'mare', 'Campobasso', 'termoli', 45.00, '2019-04-17', '2019-05-31');
/*!40000 ALTER TABLE `Viaggi` ENABLE KEYS */;

-- Dumping structure for trigger scroKING.Alberghi_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Alberghi_before_insert` BEFORE INSERT ON `Alberghi` FOR EACH ROW BEGIN
	IF (NEW.codAlbergo <= 0) THEN
      signal sqlstate '45000' set message_text = 'Errore Inserimento: codice Albergo non disponibile';
	END IF;

	IF (NEW.stanzeDisponibili < 0) THEN
      signal sqlstate '45000' set message_text = 'Errore Inserimento: stanze Disponibili errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Alberghi_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Alberghi_before_update` BEFORE UPDATE ON `Alberghi` FOR EACH ROW BEGIN
	IF (NEW.codAlbergo <= 0) THEN
      signal sqlstate '45000' set message_text = 'Errore Inserimento: codice Albergo non disponibile';
	END IF;
	
	
	IF (NEW.stanzeDisponibili < 0) THEN
      signal sqlstate '45000' set message_text = 'Errore Inserimento: stanze Disponibili errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Clienti_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Clienti_before_insert` BEFORE INSERT ON `Clienti` FOR EACH ROW BEGIN
	IF ( CHAR_LENGTH(NEW.codFiscale) <> 16) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimetno: Codice Fiscale errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Clienti_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Clienti_before_update` BEFORE UPDATE ON `Clienti` FOR EACH ROW BEGIN
	IF ( CHAR_LENGTH(NEW.codFiscale) <> 16) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimetno: Codice Fiscale errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Dipendenti_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Dipendenti_before_insert` BEFORE INSERT ON `Dipendenti` FOR EACH ROW BEGIN
	IF ( NEW.retribuzione < 0) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire retribuzione positiva.';
	END IF;
	
	IF ( NEW.dataInizioContratto < NEW.dataFineContratto ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: date contratto errate.';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Dipendenti_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Dipendenti_before_update` BEFORE UPDATE ON `Dipendenti` FOR EACH ROW BEGIN
	IF ( NEW.retribuzione < 0) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire retribuzione positiva.';
	END IF;
	
	IF ( NEW.dataInizioContratto < NEW.dataFineContratto ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: date contratto errate.';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Mezzi_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Mezzi_before_insert` BEFORE INSERT ON `Mezzi` FOR EACH ROW BEGIN
	IF (NEW.capienzaMezzo <= 0) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire capienza positiva';
	END IF;
	
	IF ( NEW.dataInizioAffitto < CURRENT_DATE() OR NEW.dataFineAffitto < NEW.dataInizioAffitto ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Date affitto errate';
	END IF;
	
	IF ( NEW.costoAffitto < 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire prezzo positivo';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Mezzi_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Mezzi_before_update` BEFORE UPDATE ON `Mezzi` FOR EACH ROW BEGIN
	IF (NEW.capienzaMezzo <= 0) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire capienza positiva';
	END IF;
	
	IF ( NEW.dataInizioAffitto < CURRENT_DATE() OR NEW.dataFineAffitto < NEW.dataInizioAffitto ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Date affitto errate';
	END IF;
	
	IF ( NEW.costoAffitto < 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire prezzo positivo';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Prenotazioni_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Prenotazioni_before_insert` BEFORE INSERT ON `Prenotazioni` FOR EACH ROW BEGIN
	SET @dataViaggio = (SELECT dataInizioViaggio FROM Viaggi WHERE codViaggio = NEW.viaggio);
	
	IF ( @dataViaggio < new.dataPrenotazione ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Prenotazione non effettuabile successivamente alla data del viaggio';
	END IF;
	
	IF ( NEW.pSconto < 0 OR NEW.pSconto > 100 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Sconto errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Prenotazioni_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Prenotazioni_before_update` BEFORE UPDATE ON `Prenotazioni` FOR EACH ROW BEGIN
	SET @dataViaggio = (SELECT dataInizioViaggio FROM Viaggi WHERE codViaggio = NEW.viaggio);
	
	IF ( @dataViaggio < new.dataPrenotazione ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Prenotazione non effettuabile successivamente alla data del viaggio';
	END IF;
	
	IF ( NEW.pSconto < 0 OR NEW.pSconto > 100 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Sconto errato';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Soggiorni_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Soggiorni_before_insert` BEFORE INSERT ON `Soggiorni` FOR EACH ROW BEGIN
	SET @disponibili = (SELECT stanzeDisponibili FROM Alberghi WHERE codAlbergo=NEW.albergo);
	
	IF ( @disponibili < new.numStanze) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Numero di stanze richieste non disponibili.';
	END IF;
	
	IF ( NEW.dataInizioSoggiorno < CURRENT_DATE() OR NEW.dataFineSoggiorno < NEW.dataInizioSoggiorno) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: date soggiorno errate';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Soggiorni_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Soggiorni_before_update` BEFORE UPDATE ON `Soggiorni` FOR EACH ROW BEGIN
	SET @disponibili = (SELECT stanzeDisponibili FROM Alberghi WHERE codAlbergo=NEW.albergo);
	
	IF ( @disponibili < new.numStanze) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Numero di stanze richieste non disponibili.';
	END IF;
	
	IF ( NEW.dataInizioSoggiorno < CURRENT_DATE() OR NEW.dataFineSoggiorno < NEW.dataInizioSoggiorno) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: date soggiorno errate';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.TelefoniAlberghi_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TelefoniAlberghi_before_insert` BEFORE INSERT ON `TelefoniAlberghi` FOR EACH ROW BEGIN
	IF ( CHAR_LENGTH(NEW.numero) >16 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un numero massimo 16 cifre';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.TelefoniAlberghi_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TelefoniAlberghi_before_update` BEFORE UPDATE ON `TelefoniAlberghi` FOR EACH ROW BEGIN
	IF ( CHAR_LENGTH(NEW.numero) >16 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un numero massimo 16 cifre';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Viaggi_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Viaggi_before_insert` BEFORE INSERT ON `Viaggi` FOR EACH ROW BEGIN
	IF ( NEW.codViaggio <= 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un codice viaggio positivo';
	END IF;
	
	IF ( NEW.dataInizioViaggio < CURRENT_DATE() OR NEW.dataFineViaggio < NEW.dataInizioViaggio ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Date viaggio errate';
	END IF;
	IF ( NEW.costoViaggio < 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un prezzo positivo';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger scroKING.Viaggi_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Viaggi_before_update` BEFORE UPDATE ON `Viaggi` FOR EACH ROW BEGIN
	IF ( NEW.codViaggio <= 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un codice viaggio positivo';
	END IF;
	
	IF ( NEW.dataInizioViaggio < CURRENT_DATE() OR NEW.dataFineViaggio < NEW.dataInizioViaggio ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Date viaggio errate';
	END IF;
	IF ( NEW.costoViaggio < 0 ) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Errore Inserimento: Inserire un prezzo positivo';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
