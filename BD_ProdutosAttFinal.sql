-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2024 at 02:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BD_ProdutosAttFinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `ID_Usuario`
--

CREATE TABLE `ID_Usuario` (
  `ID_Usuario` int(8) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TB_Carrinho`
--

CREATE TABLE `TB_Carrinho` (
  `ID_Carrinho` int(8) NOT NULL,
  `ID_User` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TB_Itens`
--

CREATE TABLE `TB_Itens` (
  `ID_ItensNoCarrinho` int(8) NOT NULL,
  `ID_Carrinho` int(8) NOT NULL,
  `ID_Produto` int(8) NOT NULL,
  `Qtd` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TB_Produto`
--

CREATE TABLE `TB_Produto` (
  `ID_Produto` int(8) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Preco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ID_Usuario`
--
ALTER TABLE `ID_Usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- Indexes for table `TB_Carrinho`
--
ALTER TABLE `TB_Carrinho`
  ADD PRIMARY KEY (`ID_Carrinho`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `TB_Itens`
--
ALTER TABLE `TB_Itens`
  ADD PRIMARY KEY (`ID_ItensNoCarrinho`),
  ADD KEY `ID_Carrinho` (`ID_Carrinho`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Indexes for table `TB_Produto`
--
ALTER TABLE `TB_Produto`
  ADD PRIMARY KEY (`ID_Produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
