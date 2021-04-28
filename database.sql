-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2020 at 12:18 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dailyscreening`
--

-- --------------------------------------------------------

--
-- Table structure for table `acesso`
--

CREATE TABLE `acesso` (
  `id_acesso` bigint(20) NOT NULL,
  `id_medico` bigint(20) NOT NULL,
  `id_paciente` bigint(20) NOT NULL,
  `paciente_id_paciente` bigint(20) NOT NULL,
  `medico_id_medico` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acesso`
--

INSERT INTO `acesso` (`id_acesso`, `id_medico`, `id_paciente`, `paciente_id_paciente`, `medico_id_medico`) VALUES
(1, 123, 12, 1, 123),
(2, 100, 11, 11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` bigint(20) NOT NULL,
  `id_medico` bigint(20) NOT NULL,
  `id_paciente` bigint(20) NOT NULL,
  `data` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sala` varchar(512) DEFAULT NULL,
  `hospital` varchar(512) DEFAULT NULL,
  `paciente_id_paciente` bigint(20) NOT NULL,
  `medico_id_medico` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `id_medico`, `id_paciente`, `data`, `hora`, `sala`, `hospital`, `paciente_id_paciente`, `medico_id_medico`) VALUES
(1, 123, 12, NULL, '2020-04-29 13:28:41', NULL, NULL, 1, 123),
(2, 100, 11, '2020-03-08', '2020-04-29 13:55:57', NULL, NULL, 11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `doenca`
--

CREATE TABLE `doenca` (
  `id_doenca` bigint(20) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `area` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doenca`
--

INSERT INTO `doenca` (`id_doenca`, `nome`, `area`) VALUES
(1, 'Parkinson', 'Neurologia'),
(2, 'Diabetes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ficha`
--

CREATE TABLE `ficha` (
  `id_ficha` bigint(20) NOT NULL,
  `id_doenca` bigint(20) NOT NULL,
  `id_paciente` bigint(20) NOT NULL,
  `doenca_id_doenca` bigint(20) NOT NULL,
  `paciente_id_paciente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ficha`
--

INSERT INTO `ficha` (`id_ficha`, `id_doenca`, `id_paciente`, `doenca_id_doenca`, `paciente_id_paciente`) VALUES
(1, 1, 12, 1, 1),
(2, 2, 11, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `medicamento`
--

CREATE TABLE `medicamento` (
  `id_medicamento` bigint(20) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `fabrico` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `nome`, `fabrico`) VALUES
(1, 'Inibidor de decarboxilase\r\n', 'infarmed'),
(2, 'Insulina', 'infarmed');

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id_medico` bigint(20) NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `meio_nome` varchar(300) DEFAULT NULL,
  `ultimo_nome` varchar(50) NOT NULL,
  `cc` bigint(20) NOT NULL,
  `identificacao` bigint(20) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `primeiro_nome`, `meio_nome`, `ultimo_nome`, `cc`, `identificacao`, `area`, `hospital`, `password`) VALUES
(100, 'Ana', NULL, 'Rocha', 45987456, 200, NULL, NULL, ''),
(123, 'Manuel', NULL, 'Silva', 12345789, 485, NULL, NULL, ''),
(124, 'André', NULL, 'Moreira', 0, 12345, NULL, NULL, '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` bigint(20) NOT NULL,
  `primeiro_nome` varchar(512) NOT NULL,
  `meio_nome` varchar(512) DEFAULT NULL,
  `ultimo_nome` varchar(512) DEFAULT NULL,
  `sns` bigint(20) NOT NULL,
  `cc` bigint(20) NOT NULL,
  `dia_nascimento` smallint(6) NOT NULL,
  `mes_nascimento` smallint(6) NOT NULL,
  `ano_nascimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `primeiro_nome`, `meio_nome`, `ultimo_nome`, `sns`, `cc`, `dia_nascimento`, `mes_nascimento`, `ano_nascimento`) VALUES
(1, 'Ana', 'Maria', 'Silva', 23456789, 12345678, 3, 2, 2000),
(11, 'Joana', NULL, 'Gomes', 15465465, 23456787, 2, 3, 1998);

-- --------------------------------------------------------

--
-- Table structure for table `receita`
--

CREATE TABLE `receita` (
  `id_receita` bigint(20) NOT NULL,
  `id_medico` bigint(20) NOT NULL,
  `id_medicamento` bigint(20) NOT NULL,
  `quantidade` smallint(6) NOT NULL,
  `periodo` varchar(512) NOT NULL,
  `medicamento_id_medicamento` bigint(20) NOT NULL,
  `paciente_id_paciente` bigint(20) NOT NULL,
  `medico_id_medico` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receita`
--

INSERT INTO `receita` (`id_receita`, `id_medico`, `id_medicamento`, `quantidade`, `periodo`, `medicamento_id_medicamento`, `paciente_id_paciente`, `medico_id_medico`) VALUES
(1, 123, 1, 2, 'De 12 em 12 horas', 1, 1, 123),
(2, 100, 2, 1, 'Antes de comer', 2, 11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tratamento`
--

CREATE TABLE `tratamento` (
  `id_tratamento` bigint(20) NOT NULL,
  `id_medico` bigint(20) NOT NULL,
  `id_paciente` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hospital` varchar(512) DEFAULT NULL,
  `paciente_id_paciente` bigint(20) NOT NULL,
  `medico_id_medico` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tratamento`
--

INSERT INTO `tratamento` (`id_tratamento`, `id_medico`, `id_paciente`, `data`, `hora`, `hospital`, `paciente_id_paciente`, `medico_id_medico`) VALUES
(1, 123, 12, '2020-01-01', '2020-04-29 13:43:39', NULL, 1, 123),
(2, 100, 11, '2020-01-01', '2020-04-29 14:06:35', 'Santa Maria', 11, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso`
--
ALTER TABLE `acesso`
  ADD PRIMARY KEY (`id_acesso`,`paciente_id_paciente`,`medico_id_medico`),
  ADD KEY `acesso_fk1` (`paciente_id_paciente`),
  ADD KEY `acesso_fk2` (`medico_id_medico`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`,`paciente_id_paciente`,`medico_id_medico`),
  ADD KEY `consulta_fk1` (`paciente_id_paciente`),
  ADD KEY `consulta_fk2` (`medico_id_medico`);

--
-- Indexes for table `doenca`
--
ALTER TABLE `doenca`
  ADD PRIMARY KEY (`id_doenca`);

--
-- Indexes for table `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`id_ficha`,`doenca_id_doenca`,`paciente_id_paciente`),
  ADD KEY `ficha_fk1` (`doenca_id_doenca`),
  ADD KEY `ficha_fk2` (`paciente_id_paciente`);

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `cc` (`cc`),
  ADD UNIQUE KEY `identificacao` (`identificacao`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `sns` (`sns`),
  ADD UNIQUE KEY `cc` (`cc`);

--
-- Indexes for table `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`id_receita`,`medicamento_id_medicamento`,`paciente_id_paciente`,`medico_id_medico`),
  ADD KEY `receita_fk1` (`medicamento_id_medicamento`),
  ADD KEY `receita_fk2` (`paciente_id_paciente`),
  ADD KEY `receita_fk3` (`medico_id_medico`);

--
-- Indexes for table `tratamento`
--
ALTER TABLE `tratamento`
  ADD PRIMARY KEY (`id_tratamento`,`paciente_id_paciente`,`medico_id_medico`),
  ADD KEY `tratamento_fk1` (`paciente_id_paciente`),
  ADD KEY `tratamento_fk2` (`medico_id_medico`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso`
--
ALTER TABLE `acesso`
  MODIFY `id_acesso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `doenca`
--
ALTER TABLE `doenca`
  MODIFY `id_doenca` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ficha`
--
ALTER TABLE `ficha`
  MODIFY `id_ficha` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `receita`
--
ALTER TABLE `receita`
  MODIFY `id_receita` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tratamento`
--
ALTER TABLE `tratamento`
  MODIFY `id_tratamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acesso`
--
ALTER TABLE `acesso`
  ADD CONSTRAINT `acesso_fk1` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `acesso_fk2` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_fk1` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `consulta_fk2` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Constraints for table `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `ficha_fk1` FOREIGN KEY (`doenca_id_doenca`) REFERENCES `doenca` (`id_doenca`),
  ADD CONSTRAINT `ficha_fk2` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Constraints for table `receita`
--
ALTER TABLE `receita`
  ADD CONSTRAINT `receita_fk1` FOREIGN KEY (`medicamento_id_medicamento`) REFERENCES `medicamento` (`id_medicamento`),
  ADD CONSTRAINT `receita_fk2` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `receita_fk3` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Constraints for table `tratamento`
--
ALTER TABLE `tratamento`
  ADD CONSTRAINT `tratamento_fk1` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `tratamento_fk2` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
