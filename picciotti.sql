-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 01, 2023 alle 22:43
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `picciotti`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(11) NOT NULL,
  `fk_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `aula`
--

INSERT INTO `aula` (`id_aula`, `fk_sede`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `id_carrello` int(11) NOT NULL,
  `fk_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `carrello`
--

INSERT INTO `carrello` (`id_carrello`, `fk_sede`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE `docente` (
  `username` varchar(512) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `cognome` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `docente`
--

INSERT INTO `docente` (`username`, `nome`, `cognome`, `email`, `password`) VALUES
('diobrandox', 'dio', 'brando', 'dioisgay@cock.cum', 'jojoisgay'),
('grotty', 'vittoria', 'la grotteria', 'grotteria@gmail.com', 'vivailicheni');

-- --------------------------------------------------------

--
-- Struttura della tabella `docente_sede`
--

CREATE TABLE `docente_sede` (
  `id_docente_sede` int(11) NOT NULL,
  `fk_docente` varchar(512) NOT NULL,
  `fk_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `docente_sede`
--

INSERT INTO `docente_sede` (`id_docente_sede`, `fk_docente`, `fk_sede`) VALUES
(1, 'grotty', 1),
(2, 'diobrandox', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `fk_carrello` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `item`
--

INSERT INTO `item` (`id_item`, `nome`, `fk_carrello`) VALUES
(1, 'pc portatile', 1),
(2, 'pc lenovo ', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_ricomprare`
--

CREATE TABLE `item_ricomprare` (
  `id_item_ricomprare` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `funzione` varchar(512) NOT NULL,
  `prezzo` decimal(11,0) NOT NULL,
  `fk_ufficio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `item_ricomprare`
--

INSERT INTO `item_ricomprare` (`id_item_ricomprare`, `nome`, `funzione`, `prezzo`, `fk_ufficio`) VALUES
(1, 'laptop', 'bho', '15', 1),
(2, 'schema madre', 'bho', '50', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int(11) NOT NULL,
  `posti` int(11) NOT NULL,
  `fk_sede` int(11) NOT NULL,
  `fk_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `laboratorio`
--

INSERT INTO `laboratorio` (`id_laboratorio`, `posti`, `fk_sede`, `fk_aula`) VALUES
(1, 30, 1, 1),
(2, 40, 1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `preside`
--

CREATE TABLE `preside` (
  `username` varchar(512) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `cognome` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `preside`
--

INSERT INTO `preside` (`username`, `nome`, `cognome`, `email`, `password`) VALUES
('anyachan', 'anya', 'forger', 'anya@hotmail.hub', 'anyamilfona');

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `id_richiesta` int(11) NOT NULL,
  `data` date NOT NULL,
  `priorità` varchar(512) NOT NULL,
  `descrizione` varchar(512) NOT NULL,
  `ambito` varchar(512) NOT NULL,
  `luogo` varchar(512) NOT NULL,
  `tipologia` varchar(512) NOT NULL,
  `status` varchar(512) NOT NULL,
  `fk_tecnico` varchar(512) NOT NULL,
  `fk_segretario` varchar(512) NOT NULL,
  `fk_docente` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`id_richiesta`, `data`, `priorità`, `descrizione`, `ambito`, `luogo`, `tipologia`, `status`, `fk_tecnico`, `fk_segretario`, `fk_docente`) VALUES
(1, '2023-02-06', 'si', 'non va un cazzo di niente ;)', 'bho', 'si', 'hardware', 'rotto', 'tecnogigio', 'mariobros', 'grotty');

-- --------------------------------------------------------

--
-- Struttura della tabella `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `indirizzo` varchar(512) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `fk_preside` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `sede`
--

INSERT INTO `sede` (`id_sede`, `indirizzo`, `nome`, `fk_preside`) VALUES
(1, 'via animeland 104', 'peanuts school', 'anyachan');

-- --------------------------------------------------------

--
-- Struttura della tabella `sede_segretario`
--

CREATE TABLE `sede_segretario` (
  `id_sede_segretario` int(11) NOT NULL,
  `fk_sede` int(11) NOT NULL,
  `fk_segretario` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `sede_segretario`
--

INSERT INTO `sede_segretario` (`id_sede_segretario`, `fk_sede`, `fk_segretario`) VALUES
(1, 1, 'mariobros');

-- --------------------------------------------------------

--
-- Struttura della tabella `segretario_hardware`
--

CREATE TABLE `segretario_hardware` (
  `username` varchar(512) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `cognome` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `fk_ufficio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `segretario_hardware`
--

INSERT INTO `segretario_hardware` (`username`, `nome`, `cognome`, `email`, `password`, `fk_ufficio`) VALUES
('mariobros', 'mario', 'mario', 'mariobros69@gmail.com', 'marioisgay', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `tecnico_software`
--

CREATE TABLE `tecnico_software` (
  `username` varchar(512) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `cognome` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `fk_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `tecnico_software`
--

INSERT INTO `tecnico_software` (`username`, `nome`, `cognome`, `email`, `password`, `fk_sede`) VALUES
('tecnogigio', 'gigio', 'topo', 'totogigiohacker@formaggio.it', 'vivailformaggio', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ufficio`
--

CREATE TABLE `ufficio` (
  `id_ufficio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ufficio`
--

INSERT INTO `ufficio` (`id_ufficio`) VALUES
(1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `fk_sede` (`fk_sede`);

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`id_carrello`),
  ADD KEY `fk_sede` (`fk_sede`);

--
-- Indici per le tabelle `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `docente_sede`
--
ALTER TABLE `docente_sede`
  ADD PRIMARY KEY (`id_docente_sede`),
  ADD KEY `fk_docente` (`fk_docente`),
  ADD KEY `fk_sede` (`fk_sede`);

--
-- Indici per le tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `fk_carrello` (`fk_carrello`);

--
-- Indici per le tabelle `item_ricomprare`
--
ALTER TABLE `item_ricomprare`
  ADD PRIMARY KEY (`id_item_ricomprare`),
  ADD KEY `fk_ufficio` (`fk_ufficio`);

--
-- Indici per le tabelle `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`),
  ADD KEY `fk_sede` (`fk_sede`),
  ADD KEY `fk_aula` (`fk_aula`);

--
-- Indici per le tabelle `preside`
--
ALTER TABLE `preside`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `richiesta`
--
ALTER TABLE `richiesta`
  ADD PRIMARY KEY (`id_richiesta`),
  ADD KEY `fk_docente` (`fk_docente`),
  ADD KEY `fk_tecnico` (`fk_tecnico`),
  ADD KEY `fk_segretario` (`fk_segretario`);

--
-- Indici per le tabelle `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD KEY `fk_preside` (`fk_preside`);

--
-- Indici per le tabelle `sede_segretario`
--
ALTER TABLE `sede_segretario`
  ADD PRIMARY KEY (`id_sede_segretario`),
  ADD KEY `fk_sede` (`fk_sede`),
  ADD KEY `fk_segretario` (`fk_segretario`);

--
-- Indici per le tabelle `segretario_hardware`
--
ALTER TABLE `segretario_hardware`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_ufficio` (`fk_ufficio`);

--
-- Indici per le tabelle `tecnico_software`
--
ALTER TABLE `tecnico_software`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_sede` (`fk_sede`);

--
-- Indici per le tabelle `ufficio`
--
ALTER TABLE `ufficio`
  ADD PRIMARY KEY (`id_ufficio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `aula`
--
ALTER TABLE `aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `docente_sede`
--
ALTER TABLE `docente_sede`
  MODIFY `id_docente_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `item_ricomprare`
--
ALTER TABLE `item_ricomprare`
  MODIFY `id_item_ricomprare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `id_richiesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `sede_segretario`
--
ALTER TABLE `sede_segretario`
  MODIFY `id_sede_segretario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `ufficio`
--
ALTER TABLE `ufficio`
  MODIFY `id_ufficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_sede` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`);

--
-- Limiti per la tabella `carrello`
--
ALTER TABLE `carrello`
  ADD CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`);

--
-- Limiti per la tabella `docente_sede`
--
ALTER TABLE `docente_sede`
  ADD CONSTRAINT `docente_sede_ibfk_1` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `fk_docente` FOREIGN KEY (`fk_docente`) REFERENCES `docente` (`username`);

--
-- Limiti per la tabella `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_carrello` FOREIGN KEY (`fk_carrello`) REFERENCES `carrello` (`id_carrello`),
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`fk_carrello`) REFERENCES `carrello` (`id_carrello`);

--
-- Limiti per la tabella `item_ricomprare`
--
ALTER TABLE `item_ricomprare`
  ADD CONSTRAINT `fk_ufficio` FOREIGN KEY (`fk_ufficio`) REFERENCES `ufficio` (`id_ufficio`);

--
-- Limiti per la tabella `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD CONSTRAINT `fk_aula` FOREIGN KEY (`fk_aula`) REFERENCES `aula` (`id_aula`),
  ADD CONSTRAINT `laboratorio_ibfk_1` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`);

--
-- Limiti per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  ADD CONSTRAINT `fk_segretario` FOREIGN KEY (`fk_segretario`) REFERENCES `segretario_hardware` (`username`),
  ADD CONSTRAINT `fk_tecnico` FOREIGN KEY (`fk_tecnico`) REFERENCES `tecnico_software` (`username`),
  ADD CONSTRAINT `richiesta_ibfk_1` FOREIGN KEY (`fk_docente`) REFERENCES `docente` (`username`);

--
-- Limiti per la tabella `sede`
--
ALTER TABLE `sede`
  ADD CONSTRAINT `fk_preside` FOREIGN KEY (`fk_preside`) REFERENCES `preside` (`username`);

--
-- Limiti per la tabella `sede_segretario`
--
ALTER TABLE `sede_segretario`
  ADD CONSTRAINT `sede_segretario_ibfk_1` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `sede_segretario_ibfk_2` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `sede_segretario_ibfk_3` FOREIGN KEY (`fk_segretario`) REFERENCES `segretario_hardware` (`username`);

--
-- Limiti per la tabella `segretario_hardware`
--
ALTER TABLE `segretario_hardware`
  ADD CONSTRAINT `segretario_hardware_ibfk_1` FOREIGN KEY (`fk_ufficio`) REFERENCES `ufficio` (`id_ufficio`);

--
-- Limiti per la tabella `tecnico_software`
--
ALTER TABLE `tecnico_software`
  ADD CONSTRAINT `tecnico_software_ibfk_1` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`id_sede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
