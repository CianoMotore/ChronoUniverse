-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 05, 2024 alle 15:54
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
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `email` varchar(255) NOT NULL,
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
-- Struttura della tabella `dettaglioordine`
--

CREATE TABLE `dettaglioordine` (
  `id_dettaglio` int(11) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `iva` int(11) NOT NULL,
  `quantità` int(11) NOT NULL,
  `codice_orologio` int(11) NOT NULL,
  `codice_ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzo`
--

CREATE TABLE `indirizzo` (
  `id_indirizzo` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `nazione` varchar(255) NOT NULL,
  `città` varchar(255) NOT NULL,
  `cap` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `recapito` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id_ordine` int(11) NOT NULL,
  `data_ordine` datetime NOT NULL,
  `stato` varchar(255) NOT NULL,
  `data_consegna` datetime NOT NULL,
  `costo_spedizione` decimal(10,2) NOT NULL,
  `data_spedizione` datetime NOT NULL,
  `corriere` varchar(255) NOT NULL,
  `indirizzo_spedizione` varchar(255) NOT NULL,
  `inisrizzo_fatturazione` varchar(255) NOT NULL,
  `codice_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `id_orologio` int(11) NOT NULL,
  `modello` varchar(255) NOT NULL,
  `movimento` varchar(255) NOT NULL,
  `materiale_cassa` varchar(255) NOT NULL,
  `diametro_cassa` decimal(10,2) NOT NULL,
  `colore_quadrante` varchar(255) NOT NULL,
  `impermeabilità` varchar(255) NOT NULL,
  `funzioni` varchar(255) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `immagine` blob DEFAULT NULL,
  `disponibilità` tinyint(1) NOT NULL DEFAULT 1,
  `categoria` varchar(255) NOT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `id_recensione` int(11) NOT NULL,
  `valutazione` int(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `commento` varchar(2048) NOT NULL,
  `data` datetime NOT NULL,
  `codice_cliente` varchar(255) NOT NULL,
  `codice_orologio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `reso`
--

CREATE TABLE `reso` (
  `id_reso` int(11) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `stato` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  `codice_cliente` varchar(255) NOT NULL,
  `codice_ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `dettaglioordine`
--
ALTER TABLE `dettaglioordine`
  ADD PRIMARY KEY (`id_dettaglio`),
  ADD KEY `codice_orologio` (`codice_orologio`),
  ADD KEY `codice_ordine` (`codice_ordine`);

--
-- Indici per le tabelle `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD PRIMARY KEY (`email`,`id_indirizzo`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `codice_cliente` (`codice_cliente`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`id_orologio`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`id_recensione`),
  ADD KEY `codice_cliente` (`codice_cliente`),
  ADD KEY `codice_orologio` (`codice_orologio`);

--
-- Indici per le tabelle `reso`
--
ALTER TABLE `reso`
  ADD PRIMARY KEY (`id_reso`),
  ADD KEY `codice_cliente` (`codice_cliente`),
  ADD KEY `codice_ordine` (`codice_ordine`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `dettaglioordine`
--
ALTER TABLE `dettaglioordine`
  MODIFY `id_dettaglio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id_ordine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
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
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `dettaglioordine`
--
ALTER TABLE `dettaglioordine`
  ADD CONSTRAINT `dettaglioordine_ibfk_1` FOREIGN KEY (`codice_orologio`) REFERENCES `prodotto` (`id_orologio`),
  ADD CONSTRAINT `dettaglioordine_ibfk_2` FOREIGN KEY (`codice_ordine`) REFERENCES `ordine` (`id_ordine`);

--
-- Limiti per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD CONSTRAINT `indirizzo_ibfk_1` FOREIGN KEY (`email`) REFERENCES `cliente` (`email`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`codice_cliente`) REFERENCES `cliente` (`email`);

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`codice_cliente`) REFERENCES `cliente` (`email`),
  ADD CONSTRAINT `recensione_ibfk_2` FOREIGN KEY (`codice_orologio`) REFERENCES `prodotto` (`id_orologio`);

--
-- Limiti per la tabella `reso`
--
ALTER TABLE `reso`
  ADD CONSTRAINT `reso_ibfk_1` FOREIGN KEY (`codice_cliente`) REFERENCES `cliente` (`email`),
  ADD CONSTRAINT `reso_ibfk_2` FOREIGN KEY (`codice_ordine`) REFERENCES `ordine` (`id_ordine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
