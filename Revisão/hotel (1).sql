-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/08/2026 às 21:17
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Pedro', 'pedro@email.com', '465.734.459-67'),
(2, 'Rafael', 'rafael@email.com', '126.365.495-67'),
(3, 'João', 'joao@email.com', '417.256.321-67'),
(4, 'Julia', 'julia@email.com', '716.634.879-67'),
(5, 'Mario', 'mario@email.com', '167.596.374-67'),
(6, 'José', 'jose@email.com', '147.847.996-67');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `codhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date NOT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) NOT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`codhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquart`) VALUES
(5, '2026-08-05', '0000-00-00', '21:05:17', NULL, 0.00, 1, 1),
(6, '2026-08-05', '0000-00-00', '16:13:40', NULL, 0.00, 5, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(255) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(1, '11', '1º Andar', 'Individual'),
(2, '12', '1º Andar', 'Casal'),
(3, '13', '1º Andar', 'Familía + Cama Solteiro'),
(4, '14', '1º Andar', 'Familía +  2 Cama Solteiro'),
(5, '21', '2º Andar', 'Familía + Cama Solteiro'),
(6, '22', '2º Andar', 'Individual'),
(7, '23', '2º Andar', 'Casal'),
(8, '31', '3º Andar', 'Mega Familía'),
(9, '32', '3º Andar', 'Familía + Cama Solteiro'),
(10, '33', '3º Andar', 'Casal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `valor`, `qtde`, `tipo`) VALUES
(1, 'Coca Cola 600ml', 8.00, 500, 'Bebida'),
(2, 'Guaraná 600ml', 7.50, 800, 'Bebida'),
(3, 'Água Mineral 500ml', 4.00, 2000, 'Bebida'),
(4, 'Suco de Laranja 500ml', 9.00, 600, 'Bebida'),
(5, 'Cerveja', 10.00, 4000, 'Bebida'),
(6, 'Café Expresso', 5.50, 150, 'Bebida'),
(7, 'Chá Gelado', 6.50, 150, 'Bebida'),
(8, 'Pão de Queijo', 7.00, 9000, 'Lanche'),
(9, 'Bolo de Chocolate', 12.00, 8000, 'Sobremesa'),
(10, 'Massagem Relaxante 30min', 80.00, 5, 'Massagem'),
(11, 'Massagem com Pedras Quentes', 180.00, 3, 'Massagem');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `codhospedagem` int(11) DEFAULT NULL,
  `codservico` int(11) DEFAULT NULL,
  `datacompra` date NOT NULL,
  `horacompra` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`codhospedagem`, `codservico`, `datacompra`, `horacompra`) VALUES
(5, 9, '2026-08-05', '16:15:58'),
(5, 1, '2026-08-07', '08:15:59');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`codhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquart` (`codquart`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `codhospedagem` (`codhospedagem`),
  ADD KEY `codservico` (`codservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `codhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquart`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`codhospedagem`) REFERENCES `hospedagem` (`codhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`codservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
