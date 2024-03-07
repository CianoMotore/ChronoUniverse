-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 07, 2024 alle 17:26
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

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`id_orologio`, `modello`, `movimento`, `materiale_cassa`, `diametro_cassa`, `colore_quadrante`, `impermeabilità`, `funzioni`, `prezzo`, `immagine`, `disponibilità`, `categoria`, `marca`) VALUES
(1, 'Submariner', 'Automatic', 'Stainless Steel', 40.00, 'Black', '300 meters', 'Date', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Rolex'),
(2, 'Seamaster', 'Automatic', 'Titanium', 43.50, 'Blue', '600 meters', 'Date', 5.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Omega'),
(3, 'Carrera', 'Automatic', 'Stainless Steel', 41.00, 'White', '100 meters', 'Chronograph', 4.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Tag Heuer'),
(4, 'Navitimer', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'Chronograph', 7.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Breitling'),
(5, 'Tank Solo', 'Quartz', 'Stainless Steel', 31.00, 'Silver', '30 meters', 'None', 2.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Cartier'),
(6, 'Reverso', 'Manual', 'Stainless Steel', 42.90, 'Black', '30 meters', 'None', 5.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Jaeger-LeCoultre'),
(7, 'Prospex', 'Automatic', 'Stainless Steel', 44.30, 'Black', '200 meters', 'Date', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Seiko'),
(8, 'Promaster', 'Eco-Drive', 'Stainless Steel', 42.00, 'Black', '200 meters', 'Chronograph', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Citizen'),
(9, 'Le Locle', 'Automatic', 'Stainless Steel', 39.30, 'White', '30 meters', 'Date', 650.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Tissot'),
(10, 'Khaki Field', 'Automatic', 'Stainless Steel', 38.00, 'Black', '100 meters', 'None', 495.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Hamilton'),
(11, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Silver', '30 meters', 'Date', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Longines'),
(12, 'Big Crown ProPilot', 'Automatic', 'Stainless Steel', 41.00, 'Black', '100 meters', 'Date, GMT', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Oris'),
(13, 'Aviation', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'Chronograph', 4.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Bell & Ross'),
(14, '104', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'Date', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Sinn'),
(15, 'Classique', 'Manual', '18k White Gold', 38.00, 'Silver', '30 meters', 'None', 16.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Breguet'),
(16, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '50 meters', 'Date', 22.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(17, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '150 meters', 'Date', 19.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Vacheron Constantin'),
(18, 'Speedmaster', 'Automatic', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 4.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Omega'),
(19, 'Superocean', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '500 meters', 'Date', 3.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Breitling'),
(20, 'Luminor Base Logo', 'Manual', 'Stainless Steel', 44.00, 'Black', '100 meters', 'None', 3.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Panerai'),
(21, 'Black Bay', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'None', 3.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Tudor'),
(22, 'GMT-Master II', 'Automatic', 'Stainless Steel', 40.00, 'Black', '100 meters', 'GMT', 14.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Rolex'),
(23, 'Pilot\'s Watch', 'Automatic', 'Stainless Steel', 41.00, 'Black', '60 meters', 'Date', 4.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'IWC'),
(24, 'Master Ultra Thin', 'Automatic', 'Stainless Steel', 39.00, 'Silver', '50 meters', 'None', 7.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Jaeger-LeCoultre'),
(25, 'BR 03-92', 'Automatic', 'Ceramic', 42.00, 'Black', '100 meters', 'None', 0.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Bell & Ross'),
(26, '1858 Geosphere', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'World Time, GMT', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Montblanc'),
(27, 'Santos-Dumont', 'Quartz', 'Stainless Steel', 38.00, 'Silver', '30 meters', 'None', 3.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Cartier'),
(28, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 21.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(29, 'Datejust', 'Automatic', 'Stainless Steel', 36.00, 'Silver', '100 meters', 'Date', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Rolex'),
(30, 'Speedmaster Moonwatch', 'Manual', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 5.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Omega'),
(31, 'Portugieser', 'Automatic', 'Stainless Steel', 40.40, 'Silver', '30 meters', 'Date', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'IWC'),
(32, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 17.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(33, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 11.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Blancpain'),
(34, 'El Primero', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Zenith'),
(35, 'Classique', 'Automatic', '18K Rose Gold', 39.00, 'Silver', '30 meters', 'None', 23.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Breguet'),
(36, 'Polo S', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'Date', 10.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Piaget'),
(37, 'Marine', 'Automatic', 'Stainless Steel', 44.00, 'Blue', '100 meters', 'Date', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Ulysse Nardin'),
(38, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '150 meters', 'Date', 21.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Vacheron Constantin'),
(39, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'None', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Jaquet Droz'),
(40, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '50 meters', 'Date', 19.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(41, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 14.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Blancpain'),
(42, 'Type XXI', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Breguet'),
(43, 'Octo Finissimo', 'Automatic', 'Titanium', 40.00, 'Black', '100 meters', 'None', 12.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Bulgari'),
(44, 'Mille Miglia', 'Automatic', 'Stainless Steel', 44.00, 'Black', '50 meters', 'Chronograph', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Chopard'),
(45, 'Laureato', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'None', 7.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Girard-Perregaux'),
(46, 'Senator', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '50 meters', 'None', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Glashütte Original'),
(47, 'Classic Fusion', 'Automatic', 'Titanium', 42.00, 'Black', '50 meters', 'None', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Hublot'),
(48, 'Portugieser', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '30 meters', 'None', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'IWC'),
(49, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Silver', '30 meters', 'None', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Jaquet Droz'),
(50, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Blue', '30 meters', 'Date', 1.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Longines'),
(51, 'Nautilus', 'Automatic', 'Stainless Steel', 40.50, 'Blue', '120 meters', 'Date', 29.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Patek Philippe'),
(52, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '50 meters', 'Date', 24.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(53, 'Portugieser', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '30 meters', 'None', 7.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'IWC'),
(54, 'Classic Fusion', 'Automatic', 'Titanium', 42.00, 'Black', '50 meters', 'None', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Hublot'),
(55, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 11.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Blancpain'),
(56, 'Chronomaster', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Zenith'),
(57, 'Laureato', 'Automatic', 'Stainless Steel', 38.00, 'Blue', '100 meters', 'None', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Girard-Perregaux'),
(58, 'Mille Miglia', 'Automatic', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph', 6.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Chopard'),
(59, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '150 meters', 'Date', 16.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Vacheron Constantin'),
(60, '1858', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'None', 3.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Montblanc'),
(61, 'Marine', 'Automatic', 'Stainless Steel', 44.00, 'Black', '300 meters', 'Date', 9.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Ulysse Nardin'),
(62, 'Datejust', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '100 meters', 'Date', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Rolex'),
(63, 'Nautilus', 'Automatic', 'Stainless Steel', 40.80, 'Blue', '120 meters', 'Date, Moon Phase', 44.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Patek Philippe'),
(64, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '50 meters', 'Date', 17.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Audemars Piguet'),
(65, 'Black Bay', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'None', 4.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Tudor'),
(66, 'Portugieser', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '30 meters', 'Chronograph, Date', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'IWC'),
(67, 'Luminor Marina', 'Automatic', 'Stainless Steel', 44.00, 'Black', '300 meters', 'Date, Second Time Zone', 8.00, 0x2f696d616765732f6272616e64696e672f7365617263686c6f676f2f31782f676f6f676c656c6f676f5f6465736b5f686569726c6f6f6d5f636f6c6f725f31353078353564702e676966, 1, '', 'Panerai');

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
  MODIFY `id_orologio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
