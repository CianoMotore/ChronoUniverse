-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 12, 2024 alle 03:11
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

DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatoReso` (IN `p_id_reso` INT, IN `p_stato` VARCHAR(255))   BEGIN
    -- Verifica se lo stato passato è valido
    IF p_stato NOT IN ('Accettato', 'In lavorazione', 'Spedito', 'Completato', 'Annullato') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stato non valido';
    END IF;

    -- Aggiorna lo stato e imposta la data corrente
    UPDATE reso
    SET stato = p_stato, data = NOW()
    WHERE id_reso = p_id_reso;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `data_nascita` date NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `recapito` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`email`, `nome`, `cognome`, `data_nascita`, `indirizzo`, `pwd`, `recapito`) VALUES
('giovanniarcaro052@gmail.com', 'Giovanni', 'Arcaro', '2024-03-08', 'Stradella dell\'Ospedale, 35', '1312321321312321', '+3913257195'),
('giovanniarcaro05@gmail.com', 'Giovannia', 'Arcaro', '2024-03-16', 'Stradella dell\'Ospedale, 35', '5', '321321321');

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
  `stato` enum('IN Elaborazione','In Spedizione','Consegnato','Annulato','In Sospeso','Reso') DEFAULT NULL,
  `data_consegna` datetime NOT NULL,
  `costo_spedizione` decimal(10,2) NOT NULL,
  `data_spedizione` datetime NOT NULL,
  `corriere` varchar(255) NOT NULL,
  `indirizzo_spedizione` varchar(255) NOT NULL,
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
  `immagine` varchar(255) DEFAULT NULL,
  `disponibilità` tinyint(1) NOT NULL DEFAULT 1,
  `categoria` varchar(255) NOT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`id_orologio`, `modello`, `movimento`, `materiale_cassa`, `diametro_cassa`, `colore_quadrante`, `impermeabilità`, `funzioni`, `prezzo`, `immagine`, `disponibilità`, `categoria`, `marca`) VALUES
(1, 'Submariner', 'Automatic', 'Stainless Steel', 40.00, 'Black', '300 meters', 'Date', 9000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/65-xmhcbxg83eszkue44946l59c-Original.png', 1, '', 'Rolex'),
(2, 'Seamaster', 'Automatic', 'Titanium', 43.50, 'Blue', '600 meters', 'Date', 5000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/981-cik797l6ykgfd90130pthe51-Original.png', 1, '', 'Omega'),
(4, 'Navitimer', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'Chronograph', 7000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/1680-qz3ix4fsr4lbn4u2mp35sqor-Original.png', 1, '', 'Breitling'),
(5, 'Tank Solo', 'Quartz', 'Stainless Steel', 31.00, 'Silver', '30 meters', 'None', 2000.00, 'https://cdn2.chrono24.com/images/uhren/32733413-xw5gxcbq79ykgvbz3reef2x1-Square360.jpg', 1, '', 'Cartier'),
(6, 'Reverso', 'Manual', 'Stainless Steel', 42.90, 'Black', '30 meters', 'None', 5000.00, 'https://cdn2.chrono24.com/images/uhren/29510732-jio63dz7ty333dpyj2zj98rn-Square360.jpg', 1, '', 'Jaeger-LeCoultre'),
(7, 'Prospex', 'Automatic', 'Stainless Steel', 44.30, 'Black', '200 meters', 'Date', 1000.00, 'https://cdn2.chrono24.com/images/uhren/32937221-4w6o1chcga6mju25pgv0uvgd-Square360.jpg', 1, '', 'Seiko'),
(8, 'Promaster', 'Eco-Drive', 'Stainless Steel', 42.00, 'Black', '200 meters', 'Chronograph', 1000.00, 'https://cdn2.chrono24.com/images/uhren/32799458-dls68bzngk8vo4mxsm7pggen-Square360.jpg', 1, '', 'Citizen'),
(9, 'Le Locle', 'Automatic', 'Stainless Steel', 39.30, 'White', '30 meters', 'Date', 650000.00, 'https://cdn2.chrono24.com/images/uhren/31009258-l0fscif131dgn57zixou3ylb-Square360.jpg', 1, '', 'Tissot'),
(10, 'Khaki Field', 'Automatic', 'Stainless Steel', 38.00, 'Black', '100 meters', 'None', 495000.00, 'https://cdn2.chrono24.com/images/uhren/33217471-652u4t0n322du5qtfuonxidl-Square360.jpg', 1, '', 'Hamilton'),
(11, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Silver', '30 meters', 'Date', 1000.00, 'https://cdn2.chrono24.com/images/uhren/30017518-ske29dwg68do10n6c4lioom1-Square360.jpg', 1, '', 'Longines'),
(12, 'Big Crown ProPilot', 'Automatic', 'Stainless Steel', 41.00, 'Black', '100 meters', 'Date, GMT', 1000.00, 'https://cdn2.chrono24.com/images/uhren/33199873-ptht7vv8vvijsicega2ck9hq-Square360.jpg', 1, '', 'Oris'),
(13, 'Aviation', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'Chronograph', 4000.00, 'https://cdn2.chrono24.com/images/uhren/32781127-1rnovri3l7givnakwcqog10x-Square360.jpg', 1, '', 'Bell & Ross'),
(14, '104', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'Date', 1000.00, 'https://cdn2.chrono24.com/images/uhren/27131592-5l034nyzhs7tudrhxu1ndlw5-Square360.jpg', 1, '', 'Sinn'),
(15, 'Classique', 'Manual', '18k White Gold', 38.00, 'Silver', '30 meters', 'None', 16000.00, 'https://cdn2.chrono24.com/images/uhren/30704409-0xmmcjqcohch9q1w9ph0r8gn-Square360.jpg', 1, '', 'Breguet'),
(16, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '50 meters', 'Date', 22000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/2781-lvhb7l6ewbfwnpmd88n3fk2q-Original.png', 1, '', 'Audemars Piguet'),
(17, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '150 meters', 'Date', 19000.00, 'https://cdn2.chrono24.com/images/uhren/32287145-3whz9emgi2v9klbr6op813ag-Square360.jpg', 1, '', 'Vacheron Constantin'),
(18, 'Speedmaster', 'Automatic', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 4000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/71-js248idvdav3retnmx2uc6wx-Original.png', 1, '', 'Omega'),
(19, 'Superocean', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '500 meters', 'Date', 3000.00, 'https://cdn2.chrono24.com/images/uhren/33212466-7lkwnrvwmpmu3l8qg85gxy9g-Square360.jpg', 1, '', 'Breitling'),
(20, 'Luminor Base Logo', 'Manual', 'Stainless Steel', 44.00, 'Black', '100 meters', 'None', 3000.00, 'https://cdn2.chrono24.com/images/uhren/27572976-e9b79ni7alt2k23gdmatqi1p-Square360.jpg', 1, '', 'Panerai'),
(21, 'Black Bay', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'None', 3000.00, 'https://cdn2.chrono24.com/images/uhren/27572976-e9b79ni7alt2k23gdmatqi1p-Square360.jpg', 1, '', 'Tudor'),
(22, 'GMT-Master II', 'Automatic', 'Stainless Steel', 40.00, 'Black', '100 meters', 'GMT', 14000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/2681-ug6lgk78ie9pb06m1sxq5304-Original.png', 1, '', 'Rolex'),
(23, 'Pilot\'s Watch', 'Automatic', 'Stainless Steel', 41.00, 'Black', '60 meters', 'Date', 4000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/2833-lo6qd8pbwxnmky185cq8906k-Original.png', 1, '', 'IWC'),
(24, 'Master Ultra Thin', 'Automatic', 'Stainless Steel', 39.00, 'Silver', '50 meters', 'None', 7000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/87-mihxeujm14zpv27y3wu5pc6g-Original.png', 1, '', 'Jaeger-LeCoultre'),
(25, 'BR 03-92', 'Automatic', 'Ceramic', 42.00, 'Black', '100 meters', 'None', 0.00, 'https://cdn2.chrono24.com/images/uhren/32165715-jhsdzca15f4xehbfcqje2r7b-Square360.jpg', 1, '', 'Bell & Ross'),
(26, '1858 Geosphere', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'World Time, GMT', 6000.00, 'https://cdn2.chrono24.com/images/uhren/32451279-abbxtcuu6rljjmu9ltvz5sel-Square360.jpg', 1, '', 'Montblanc'),
(27, 'Santos-Dumont', 'Quartz', 'Stainless Steel', 38.00, 'Silver', '30 meters', 'None', 3000.00, 'https://cdn2.chrono24.com/images/uhren/27891240-607u1o84hd592r29ae70pd6f-Square360.jpg', 1, '', 'Cartier'),
(28, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 21000.00, 'https://cdn2.chrono24.com/images/uhren/29922810-yf32bjyxnwt675oesza3fx6d-Square360.jpg', 1, '', 'Audemars Piguet'),
(29, 'Datejust', 'Automatic', 'Stainless Steel', 36.00, 'Silver', '100 meters', 'Date', 9000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/2782-ver05sj5o0souxajjelhpdly-Original.png', 1, '', 'Rolex'),
(30, 'Speedmaster Moonwatch', 'Manual', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 5000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/2901-gy52da1re6l8ghhqryeb4dxl-Original.png', 1, '', 'Omega'),
(31, 'Portugieser', 'Automatic', 'Stainless Steel', 40.40, 'Silver', '30 meters', 'Date', 8000.00, 'https://cdn2.chrono24.com/images/uhren/32898002-bcwxwqj0625hmb1k11g62r4r-Square360.jpg', 1, '', 'IWC'),
(32, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 17000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/370-wpo687rsyik1goqs8mzj437x-Original.png', 1, '', 'Audemars Piguet'),
(33, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 11000.00, 'https://cdn2.chrono24.com/cdn-cgi/image/f=auto,metadata=none,q=65,h=305/images/topmodels/1170-uuo38gcw9ec86xd69qvulwkx-Original.png', 1, '', 'Blancpain'),
(34, 'El Primero', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 6000.00, 'https://cdn2.chrono24.com/images/uhren/27941567-npg8yromzvzoeutsf7es8nde-Square360.jpg', 1, '', 'Zenith'),
(35, 'Classique', 'Automatic', '18K Rose Gold', 39.00, 'Silver', '30 meters', 'None', 23000.00, 'https://cdn2.chrono24.com/images/uhren/32494446-i7523uavd744un3ppth2gw90-Square360.jpg', 1, '', 'Breguet'),
(36, 'Polo S', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'Date', 10000.00, 'https://cdn2.chrono24.com/images/uhren/22041870-evfjo2fzj9d6i42somg7l55p-Square360.jpg', 1, '', 'Piaget'),
(37, 'Marine', 'Automatic', 'Stainless Steel', 44.00, 'Blue', '100 meters', 'Date', 9000.00, 'https://cdn2.chrono24.com/images/uhren/31471461-pla7qmcdq4rpm8889hy0eed5-Square360.jpg', 1, '', 'Ulysse Nardin'),
(38, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '150 meters', 'Date', 21000.00, 'https://cdn2.chrono24.com/images/uhren/29940758-mmikgqsuecnp3f3llaf9t7ca-Square360.jpg', 1, '', 'Vacheron Constantin'),
(39, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'None', 9000.00, 'https://cdn2.chrono24.com/images/uhren/33112266-g0ftwrq125lwscnw8rt01m30-Square360.jpg', 1, '', 'Jaquet Droz'),
(40, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '50 meters', 'Date', 19000.00, 'https://cdn2.chrono24.com/images/uhren/23552991-7da8jk28279bkgnis30djyng-Square360.jpg', 1, '', 'Audemars Piguet'),
(41, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 14000.00, 'https://cdn2.chrono24.com/images/uhren/33255611-g9zo56mxllajbhrjab0zyj9i-Square360.jpg', 1, '', 'Blancpain'),
(42, 'Type XXI', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 9000.00, 'https://cdn2.chrono24.com/images/uhren/32472135-7xt07o0fnc4genbmm51xmsp1-Square360.jpg', 1, '', 'Breguet'),
(43, 'Octo Finissimo', 'Automatic', 'Titanium', 40.00, 'Black', '100 meters', 'None', 12000.00, 'https://cdn2.chrono24.com/images/uhren/32487484-3gjn2mmxux1wgvsu6kc6aifc-Square360.jpg', 1, '', 'Bulgari'),
(44, 'Mille Miglia', 'Automatic', 'Stainless Steel', 44.00, 'Black', '50 meters', 'Chronograph', 6000.00, 'https://cdn2.chrono24.com/images/uhren/32511930-wxbzg034oc3os6o3i0zlhm8m-Square360.jpg', 1, '', 'Chopard'),
(45, 'Laureato', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'None', 7000.00, 'https://cdn2.chrono24.com/images/uhren/26931949-l5qui2y35jnnzkpgektd6n2x-Square360.jpg', 1, '', 'Girard-Perregaux'),
(46, 'Senator', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '50 meters', 'None', 9000.00, 'https://cdn2.chrono24.com/images/uhren/30468967-usmw3v8e7gv7dff6ukdmodb7-Square360.jpg', 1, '', 'Glashütte Original'),
(47, 'Classic Fusion', 'Automatic', 'Titanium', 42.00, 'Black', '50 meters', 'None', 6000.00, 'https://cdn2.chrono24.com/images/uhren/32581783-3by26u2pv0m06fqgsgesmrh6-Square360.jpg', 1, '', 'Hublot'),
(48, 'Portugieser', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '30 meters', 'None', 8000.00, 'https://cdn2.chrono24.com/images/uhren/30281795-q13tw4tn1e54vc9mfyi5nne7-Square360.jpg', 1, '', 'IWC'),
(49, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Silver', '30 meters', 'None', 6000.00, 'https://cdn2.chrono24.com/images/uhren/33023455-1fru2cwhk9hpfa9iz8r76wzx-Square360.jpg', 1, '', 'Jaquet Droz'),
(50, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Blue', '30 meters', 'Date', 1000.00, 'https://cdn2.chrono24.com/images/uhren/30827495-y5kmhgf6x7txvnjq91oerj0d-Square360.jpg', 1, '', 'Longines');

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
  `stato` enum('Accettato','In lavorazione','Spedito','Completato') DEFAULT NULL,
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
  MODIFY `id_orologio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

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
