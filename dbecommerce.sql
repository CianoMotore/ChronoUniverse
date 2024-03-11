-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 11, 2024 alle 11:39
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
  `stato` enum('IN Elaborazione','In Spedizione','Consegnato','Annulato','In Sospeso','Reso') DEFAULT NULL,
  `data_consegna` datetime NOT NULL,
  `costo_spedizione` decimal(10,2) NOT NULL,
  `data_spedizione` datetime NOT NULL,
  `corriere` varchar(255) NOT NULL,
  `indirizzo_spedizione` varchar(255) NOT NULL,
  `indirizzo_fatturazione` varchar(255) DEFAULT NULL,
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
(1, 'Submariner', 'Automatic', 'Stainless Steel', 40.00, 'Black', '300 meters', 'Date', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f36352d786d6863627867383365737a6b756534343934366c3539632d4f726967696e616c2e706e67, 1, '', 'Rolex'),
(2, 'Seamaster', 'Automatic', 'Titanium', 43.50, 'Blue', '600 meters', 'Date', 5.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f3938312d63696b3739376c36796b67666439303133307074686535312d4f726967696e616c2e706e67, 1, '', 'Omega'),
(4, 'Navitimer', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'Chronograph', 7.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f313638302d717a33697834667372346c626e3475326d70333573716f722d4f726967696e616c2e706e67, 1, '', 'Breitling'),
(5, 'Tank Solo', 'Quartz', 'Stainless Steel', 31.00, 'Silver', '30 meters', 'None', 2.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323733333431332d78773567786362713739796b6776627a33726565663278312d5371756172653336302e6a7067, 1, '', 'Cartier'),
(6, 'Reverso', 'Manual', 'Stainless Steel', 42.90, 'Black', '30 meters', 'None', 5.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32393531303733322d6a696f3633647a3774793333336470796a327a6a3938726e2d5371756172653336302e6a7067, 1, '', 'Jaeger-LeCoultre'),
(7, 'Prospex', 'Automatic', 'Stainless Steel', 44.30, 'Black', '200 meters', 'Date', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323933373232312d3477366f316368636761366d6a75323570677630757667642d5371756172653336302e6a7067, 1, '', 'Seiko'),
(8, 'Promaster', 'Eco-Drive', 'Stainless Steel', 42.00, 'Black', '200 meters', 'Chronograph', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323739393435382d646c733638627a6e676b38766f346d78736d37706767656e2d5371756172653336302e6a7067, 1, '', 'Citizen'),
(9, 'Le Locle', 'Automatic', 'Stainless Steel', 39.30, 'White', '30 meters', 'Date', 650.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33313030393235382d6c30667363696631333164676e35377a69786f7533796c622d5371756172653336302e6a7067, 1, '', 'Tissot'),
(10, 'Khaki Field', 'Automatic', 'Stainless Steel', 38.00, 'Black', '100 meters', 'None', 495.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333231373437312d363532753474306e333232647535717466756f6e7869646c2d5371756172653336302e6a7067, 1, '', 'Hamilton'),
(11, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Silver', '30 meters', 'Date', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33303031373531382d736b6532396477673638646f31306e3663346c696f6f6d312d5371756172653336302e6a7067, 1, '', 'Longines'),
(12, 'Big Crown ProPilot', 'Automatic', 'Stainless Steel', 41.00, 'Black', '100 meters', 'Date, GMT', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333139393837332d70746874377676387676696a73696365676132636b3968712d5371756172653336302e6a7067, 1, '', 'Oris'),
(13, 'Aviation', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'Chronograph', 4.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323738313132372d31726e6f767269336c376769766e616b7763716f673130782d5371756172653336302e6a7067, 1, '', 'Bell & Ross'),
(14, '104', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'Date', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32373133313539322d356c3033346e797a68733774756472687875316e646c77352d5371756172653336302e6a7067, 1, '', 'Sinn'),
(15, 'Classique', 'Manual', '18k White Gold', 38.00, 'Silver', '30 meters', 'None', 16.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33303730343430392d30786d6d636a71636f68636839713177397068307238676e2d5371756172653336302e6a7067, 1, '', 'Breguet'),
(16, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '50 meters', 'Date', 22.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f323738312d6c766862376c3665776266776e706d6438386e33666b32712d4f726967696e616c2e706e67, 1, '', 'Audemars Piguet'),
(17, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '150 meters', 'Date', 19.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323238373134352d3377687a39656d67693276396b6c6272366f7038313361672d5371756172653336302e6a7067, 1, '', 'Vacheron Constantin'),
(18, 'Speedmaster', 'Automatic', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 4.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f37312d6a73323438696476646176337265746e6d783275633677782d4f726967696e616c2e706e67, 1, '', 'Omega'),
(19, 'Superocean', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '500 meters', 'Date', 3.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333231323436362d376c6b776e7276776d706d75336c387167383567787939672d5371756172653336302e6a7067, 1, '', 'Breitling'),
(20, 'Luminor Base Logo', 'Manual', 'Stainless Steel', 44.00, 'Black', '100 meters', 'None', 3.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32373537323937362d65396237396e6937616c74326b323367646d6174716931702d5371756172653336302e6a7067, 1, '', 'Panerai'),
(21, 'Black Bay', 'Automatic', 'Stainless Steel', 41.00, 'Black', '200 meters', 'None', 3.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32373537323937362d65396237396e6937616c74326b323367646d6174716931702d5371756172653336302e6a7067, 1, '', 'Tudor'),
(22, 'GMT-Master II', 'Automatic', 'Stainless Steel', 40.00, 'Black', '100 meters', 'GMT', 14.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f323638312d7567366c676b3738696539706230366d31737871353330342d4f726967696e616c2e706e67, 1, '', 'Rolex'),
(23, 'Pilot\'s Watch', 'Automatic', 'Stainless Steel', 41.00, 'Black', '60 meters', 'Date', 4.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f323833332d6c6f36716438706277786e6d6b793138356371383930366b2d4f726967696e616c2e706e67, 1, '', 'IWC'),
(24, 'Master Ultra Thin', 'Automatic', 'Stainless Steel', 39.00, 'Silver', '50 meters', 'None', 7.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f38372d6d69687865756a6d31347a707632377933777535706336672d4f726967696e616c2e706e67, 1, '', 'Jaeger-LeCoultre'),
(25, 'BR 03-92', 'Automatic', 'Ceramic', 42.00, 'Black', '100 meters', 'None', 0.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323136353731352d6a6873647a636131356634786568626663716a65327237622d5371756172653336302e6a7067, 1, '', 'Bell & Ross'),
(26, '1858 Geosphere', 'Automatic', 'Stainless Steel', 42.00, 'Black', '100 meters', 'World Time, GMT', 6.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323435313237392d616262787463757536726c6a6a6d75396c74767a3573656c2d5371756172653336302e6a7067, 1, '', 'Montblanc'),
(27, 'Santos-Dumont', 'Quartz', 'Stainless Steel', 38.00, 'Silver', '30 meters', 'None', 3.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32373839313234302d36303775316f3834686435393272323961653730706436662d5371756172653336302e6a7067, 1, '', 'Cartier'),
(28, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 21.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32393932323831302d79663332626a79786e77743637356f65737a6133667836642d5371756172653336302e6a7067, 1, '', 'Audemars Piguet'),
(29, 'Datejust', 'Automatic', 'Stainless Steel', 36.00, 'Silver', '100 meters', 'Date', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f323738322d7665723035736a356f30736f7578616a6a656c6870646c792d4f726967696e616c2e706e67, 1, '', 'Rolex'),
(30, 'Speedmaster Moonwatch', 'Manual', 'Stainless Steel', 42.00, 'Black', '50 meters', 'Chronograph, Tachymeter', 5.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f323930312d677935326461317265366c3867686871727965623464786c2d4f726967696e616c2e706e67, 1, '', 'Omega'),
(31, 'Portugieser', 'Automatic', 'Stainless Steel', 40.40, 'Silver', '30 meters', 'Date', 8.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323839383030322d6263777877716a30363235686d62316b31316736327234722d5371756172653336302e6a7067, 1, '', 'IWC'),
(32, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Black', '50 meters', 'Date', 17.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f3337302d77706f363837727379696b31676f7173386d7a6a343337782d4f726967696e616c2e706e67, 1, '', 'Audemars Piguet'),
(33, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 11.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f63646e2d6367692f696d6167652f663d6175746f2c6d657461646174613d6e6f6e652c713d36352c683d3330352f696d616765732f746f706d6f64656c732f313137302d75756f33386763773965633836786436397176756c776b782d4f726967696e616c2e706e67, 1, '', 'Blancpain'),
(34, 'El Primero', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 6.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32373934313536372d6e70673879726f6d7a767a6f6575747366376573386e64652d5371756172653336302e6a7067, 1, '', 'Zenith'),
(35, 'Classique', 'Automatic', '18K Rose Gold', 39.00, 'Silver', '30 meters', 'None', 23.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323439343434362d693735323375617664373434756e337070746832677739302d5371756172653336302e6a7067, 1, '', 'Breguet'),
(36, 'Polo S', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'Date', 10.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32323034313837302d6576666a6f32667a6a396436693432736f6d67376c3535702d5371756172653336302e6a7067, 1, '', 'Piaget'),
(37, 'Marine', 'Automatic', 'Stainless Steel', 44.00, 'Blue', '100 meters', 'Date', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33313437313436312d706c6137716d6364713472706d38383839687930656564352d5371756172653336302e6a7067, 1, '', 'Ulysse Nardin'),
(38, 'Overseas', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '150 meters', 'Date', 21.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32393934303735382d6d6d696b6771737565636e703366336c6c616639743763612d5371756172653336302e6a7067, 1, '', 'Vacheron Constantin'),
(39, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Black', '30 meters', 'None', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333131323236362d673066747772713132356c7773636e7738727430316d33302d5371756172653336302e6a7067, 1, '', 'Jaquet Droz'),
(40, 'Royal Oak', 'Automatic', 'Stainless Steel', 41.00, 'Blue', '50 meters', 'Date', 19.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32333535323939312d376461386a6b3238323739626b676e69733330646a796e672d5371756172653336302e6a7067, 1, '', 'Audemars Piguet'),
(41, 'Fifty Fathoms', 'Automatic', 'Stainless Steel', 45.00, 'Black', '300 meters', 'Date', 14.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333235353631312d67397a6f35366d786c6c616a6268726a6162307a796a39692d5371756172653336302e6a7067, 1, '', 'Blancpain'),
(42, 'Type XXI', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '100 meters', 'Chronograph', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323437323133352d37787430376f30666e633467656e626d6d3531786d7370312d5371756172653336302e6a7067, 1, '', 'Breguet'),
(43, 'Octo Finissimo', 'Automatic', 'Titanium', 40.00, 'Black', '100 meters', 'None', 12.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323438373438342d33676a6e326d6d787578317767767375366b6336616966632d5371756172653336302e6a7067, 1, '', 'Bulgari'),
(44, 'Mille Miglia', 'Automatic', 'Stainless Steel', 44.00, 'Black', '50 meters', 'Chronograph', 6.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323531313933302d7778627a673033346f63336f73366f3369307a6c686d386d2d5371756172653336302e6a7067, 1, '', 'Chopard'),
(45, 'Laureato', 'Automatic', 'Stainless Steel', 42.00, 'Blue', '100 meters', 'None', 7.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f32363933313934392d6c35717569327933356a6e6e7a6b7067656b7464366e32782d5371756172653336302e6a7067, 1, '', 'Girard-Perregaux'),
(46, 'Senator', 'Automatic', 'Stainless Steel', 42.00, 'Silver', '50 meters', 'None', 9.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33303436383936372d75736d77337638653767763764666636756b646d6f6462372d5371756172653336302e6a7067, 1, '', 'Glashütte Original'),
(47, 'Classic Fusion', 'Automatic', 'Titanium', 42.00, 'Black', '50 meters', 'None', 6.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33323538313738332d336279323675327076306d3036667167736765736d7268362d5371756172653336302e6a7067, 1, '', 'Hublot'),
(48, 'Portugieser', 'Automatic', 'Stainless Steel', 41.00, 'Silver', '30 meters', 'None', 8.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33303238313739352d713133747734746e316535347663396d667969356e6e65372d5371756172653336302e6a7067, 1, '', 'IWC'),
(49, 'Grande Seconde', 'Automatic', 'Stainless Steel', 43.00, 'Silver', '30 meters', 'None', 6.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33333032333435352d31667275326377686b396870666139697a38723736777a782d5371756172653336302e6a7067, 1, '', 'Jaquet Droz'),
(50, 'Master Collection', 'Automatic', 'Stainless Steel', 38.50, 'Blue', '30 meters', 'Date', 1.00, 0x68747470733a2f2f63646e322e6368726f6e6f32342e636f6d2f696d616765732f756872656e2f33303832373439352d79356b6d6867663678377478766e6a7139316f65726a30642d5371756172653336302e6a7067, 1, '', 'Longines');

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
