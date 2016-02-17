-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 17. Feb 2016 um 10:28
-- Server Version: 5.6.24-0ubuntu2
-- PHP-Version: 5.6.4-4ubuntu6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `coffeehouse`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Benutzer`
--

CREATE TABLE IF NOT EXISTS `Benutzer` (
`ID` int(11) NOT NULL,
  `Benutzername` varchar(30) NOT NULL,
  `Passwort` varchar(16) NOT NULL,
  `Rolle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bestellung`
--

CREATE TABLE IF NOT EXISTS `Bestellung` (
`ID` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  `Benutzer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Getränk`
--

CREATE TABLE IF NOT EXISTS `Getränk` (
`ID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Preis` decimal(6,2) NOT NULL,
  `Art` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Posten`
--

CREATE TABLE IF NOT EXISTS `Posten` (
`ID` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL,
  `Bestellung_ID` int(11) NOT NULL,
  `Getränk_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Posten_Zusatz`
--

CREATE TABLE IF NOT EXISTS `Posten_Zusatz` (
  `Posten_ID` int(11) NOT NULL,
  `Zusatz_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zusatz`
--

CREATE TABLE IF NOT EXISTS `Zusatz` (
`ID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL,
  `Preis` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Benutzer`
--
ALTER TABLE `Benutzer`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Bestellung`
--
ALTER TABLE `Bestellung`
 ADD PRIMARY KEY (`ID`), ADD KEY `Benutzer_ID` (`Benutzer_ID`);

--
-- Indizes für die Tabelle `Getränk`
--
ALTER TABLE `Getränk`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Posten`
--
ALTER TABLE `Posten`
 ADD PRIMARY KEY (`ID`), ADD KEY `Getränk_ID` (`Getränk_ID`), ADD KEY `Bestellung_ID` (`Bestellung_ID`);

--
-- Indizes für die Tabelle `Posten_Zusatz`
--
ALTER TABLE `Posten_Zusatz`
 ADD PRIMARY KEY (`Zusatz_ID`,`Posten_ID`), ADD KEY `FOREIGN` (`Posten_ID`,`Zusatz_ID`);

--
-- Indizes für die Tabelle `Zusatz`
--
ALTER TABLE `Zusatz`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Benutzer`
--
ALTER TABLE `Benutzer`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Bestellung`
--
ALTER TABLE `Bestellung`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Getränk`
--
ALTER TABLE `Getränk`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Posten`
--
ALTER TABLE `Posten`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Zusatz`
--
ALTER TABLE `Zusatz`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Bestellung`
--
ALTER TABLE `Bestellung`
ADD CONSTRAINT `Bestellung_ibfk_1` FOREIGN KEY (`Benutzer_ID`) REFERENCES `Benutzer` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Posten`
--
ALTER TABLE `Posten`
ADD CONSTRAINT `Posten_ibfk_1` FOREIGN KEY (`Bestellung_ID`) REFERENCES `Bestellung` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `Posten_ibfk_2` FOREIGN KEY (`Getränk_ID`) REFERENCES `Getränk` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Posten_Zusatz`
--
ALTER TABLE `Posten_Zusatz`
ADD CONSTRAINT `Posten_Zusatz_ibfk_1` FOREIGN KEY (`Posten_ID`) REFERENCES `Posten` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `Posten_Zusatz_ibfk_2` FOREIGN KEY (`Zusatz_ID`) REFERENCES `Zusatz` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
