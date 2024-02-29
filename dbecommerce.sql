-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 29, 2024 alle 18:39
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbecommerce`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `sesso` varchar(1) NOT NULL,
  `data_nascita` date NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `recapito` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `consegna`
--

CREATE TABLE `consegna` (
  `id_consegna` int(11) NOT NULL,
  `corriere` varchar(255) NOT NULL,
  `tracking_number` varchar(255) NOT NULL,
  `data_consegna_stimata` date NOT NULL,
  `data_consegna_effettiva` date DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `data_spedizione` datetime NOT NULL,
  `cod_ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `contiene`
--

CREATE TABLE `contiene` (
  `quantita` int(11) NOT NULL,
  `cod_ordine` int(11) NOT NULL,
  `cod_orologio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id_ordine` int(11) NOT NULL,
  `data_ordine` datetime NOT NULL,
  `stato` enum('In attesa','Confermato','In elaborazione','Spedito','Consegnato','Annullato','In sospeso','Rimborsato') DEFAULT NULL,
  `spedizione` varchar(255) NOT NULL,
  `cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `orologio`
--

CREATE TABLE `orologio` (
  `id_orologio` int(11) NOT NULL,
  `modello` varchar(255) NOT NULL,
  `movimento` varchar(255) NOT NULL,
  `materiale_cassa` varchar(255) NOT NULL,
  `diametro_cassa` decimal(10,2) NOT NULL,
  `colore_quadrante` varchar(255) NOT NULL,
  `impermeabilità` varchar(255) NOT NULL,
  `funzioni` varchar(255) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `immagine` varchar(255) DEFAULT NULL,
  `disponibilità` tinyint(1) NOT NULL DEFAULT 1,
  `cod_categoria` int(11) NOT NULL,
  `cod_venditore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `id_recensione` int(11) NOT NULL,
  `valutazione` enum('1','2','3','4','5') DEFAULT NULL,
  `titolo` varchar(255) NOT NULL,
  `commento` varchar(2048) NOT NULL,
  `data` datetime NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_orologio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `reso`
--

CREATE TABLE `reso` (
  `id_reso` int(11) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `stato` enum('richiesta','accetazione','ricezione') DEFAULT NULL,
  `data` datetime NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `venditore`
--

CREATE TABLE `venditore` (
  `id_venditore` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `recapito` varchar(255) NOT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `ragione_sociale` varchar(255) DEFAULT NULL,
  `tipo` enum('p','a') DEFAULT NULL CHECK (`tipo` = 'p' and `cognome` is not null and `ragione_sociale` is null or `tipo` = 'a' and `ragione_sociale` is not null and `cognome` is null)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indici per le tabelle `consegna`
--
ALTER TABLE `consegna`
  ADD PRIMARY KEY (`id_consegna`),
  ADD KEY `cod_ordine` (`cod_ordine`);

--
-- Indici per le tabelle `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`cod_ordine`,`cod_orologio`),
  ADD KEY `cod_orologio` (`cod_orologio`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `cod_cliente` (`cod_cliente`);

--
-- Indici per le tabelle `orologio`
--
ALTER TABLE `orologio`
  ADD PRIMARY KEY (`id_orologio`),
  ADD KEY `cod_categoria` (`cod_categoria`),
  ADD KEY `cod_venditore` (`cod_venditore`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`id_recensione`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `cod_orologio` (`cod_orologio`);

--
-- Indici per le tabelle `reso`
--
ALTER TABLE `reso`
  ADD PRIMARY KEY (`id_reso`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `cod_ordine` (`cod_ordine`);

--
-- Indici per le tabelle `venditore`
--
ALTER TABLE `venditore`
  ADD PRIMARY KEY (`id_venditore`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `consegna`
--
ALTER TABLE `consegna`
  MODIFY `id_consegna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id_ordine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `orologio`
--
ALTER TABLE `orologio`
  MODIFY `id_orologio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `id_recensione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `reso`
--
ALTER TABLE `reso`
  MODIFY `id_reso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `venditore`
--
ALTER TABLE `venditore`
  MODIFY `id_venditore` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `consegna`
--
ALTER TABLE `consegna`
  ADD CONSTRAINT `consegna_ibfk_1` FOREIGN KEY (`cod_ordine`) REFERENCES `ordine` (`id_ordine`);

--
-- Limiti per la tabella `contiene`
--
ALTER TABLE `contiene`
  ADD CONSTRAINT `contiene_ibfk_1` FOREIGN KEY (`cod_ordine`) REFERENCES `ordine` (`id_ordine`),
  ADD CONSTRAINT `contiene_ibfk_2` FOREIGN KEY (`cod_orologio`) REFERENCES `orologio` (`id_orologio`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limiti per la tabella `orologio`
--
ALTER TABLE `orologio`
  ADD CONSTRAINT `orologio_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `orologio_ibfk_2` FOREIGN KEY (`cod_venditore`) REFERENCES `venditore` (`id_venditore`);

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `recensione_ibfk_2` FOREIGN KEY (`cod_orologio`) REFERENCES `orologio` (`id_orologio`);

--
-- Limiti per la tabella `reso`
--
ALTER TABLE `reso`
  ADD CONSTRAINT `reso_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reso_ibfk_2` FOREIGN KEY (`cod_ordine`) REFERENCES `ordine` (`id_ordine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
