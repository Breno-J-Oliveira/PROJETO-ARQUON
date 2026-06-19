-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql103.infinityfree.com
-- Generation Time: Jun 19, 2026 at 12:38 AM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_42144845_arquon`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nota` tinyint(4) NOT NULL
) ;

--
-- Dumping data for table `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `id_produto`, `id_usuario`, `nota`, `nota_qualidade`, `nota_tamanho`, `nota_custo_beneficio`, `comentario`, `foto_url`, `data_criacao`) VALUES
(1, 20, 1, 4, NULL, NULL, NULL, 'MUITO BOM', NULL, '2026-06-18 02:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `carrinho_temp`
--

CREATE TABLE `carrinho_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) DEFAULT 1,
  `tamanho` varchar(10) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `macro_categoria` enum('Parte Superior','Parte Inferior','Corpo Inteiro','Acessórios','Calçados') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `macro_categoria`) VALUES
(1, 'Masculino', 'Parte Superior'),
(2, 'Feminino', 'Parte Superior'),
(3, 'Acessorios', 'Acessórios'),
(4, 'Techwear', 'Corpo Inteiro'),
(5, 'Streetwear', 'Parte Inferior'),
(6, 'Alta Costura', 'Corpo Inteiro'),
(7, 'Calçados', 'Calçados'),
(8, 'Óculos', 'Acessórios'),
(9, 'Jóias', 'Acessórios'),
(10, 'Relógios', 'Acessórios'),
(11, 'Chapéus', 'Acessórios'),
(12, 'Cintos', 'Acessórios'),
(13, 'Luvas', 'Acessórios'),
(14, 'Lenços', 'Acessórios'),
(15, 'Bolsas', 'Acessórios'),
(16, 'Mochilas', 'Acessórios');

-- --------------------------------------------------------

--
-- Table structure for table `celebridades`
--

CREATE TABLE `celebridades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) NOT NULL,
  `foto_url` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `ordem` int(11) DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `celebridades`
--

INSERT INTO `celebridades` (`id`, `nome`, `foto_url`, `descricao`, `instagram_url`, `ativo`, `ordem`, `criado_em`) VALUES
(1, 'Kendall Jenner', 'kendall-jenner.jpg', 'Modelo e empresária', 'https://instagram.com/kendalljenner', 1, 1, '2026-06-17 01:42:16'),
(2, 'Bella Hadid', 'bella-hadid.jpg', 'Supermodelo', 'https://instagram.com/bellahadid', 1, 2, '2026-06-17 01:42:16'),
(3, 'Hailey Bieber', 'hailey-bieber.jpg', 'Modelo', 'https://instagram.com/haileybieber', 1, 3, '2026-06-17 01:42:16'),
(4, 'Gigi Hadid', 'gigi-hadid.jpg', 'Supermodelo', 'https://instagram.com/gigihadid', 1, 4, '2026-06-17 01:42:16'),
(5, 'Rihanna', 'rihanna.jpg', 'Cantora e empresária', 'https://instagram.com/badgalriri', 1, 5, '2026-06-17 01:42:16'),
(6, 'Zendaya', 'zendaya.jpg', 'Atriz e modelo', 'https://instagram.com/zendaya', 1, 6, '2026-06-17 01:42:16'),
(7, 'Harry Styles', 'harry-styles.jpg', 'Cantor e ator', 'https://instagram.com/harrystyles', 1, 7, '2026-06-17 01:42:16'),
(8, 'Timothée Chalamet', 'timothee-chalamet.jpg', 'Ator', 'https://instagram.com/tchalamet', 1, 8, '2026-06-17 01:42:16'),
(9, 'Billie Eilish', 'billie-eilish.jpg', 'Cantora', 'https://instagram.com/billieeilish', 1, 9, '2026-06-17 01:42:16'),
(10, 'Dua Lipa', 'dua-lipa.jpg', 'Cantora', 'https://instagram.com/dualipa', 1, 10, '2026-06-17 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `celebridade_produtos`
--

CREATE TABLE `celebridade_produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_celebridade` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colecao_produtos`
--

CREATE TABLE `colecao_produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_colecao` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colecoes`
--

CREATE TABLE `colecoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `foto_url` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `ordem` int(11) DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `colecoes`
--

INSERT INTO `colecoes` (`id`, `nome`, `descricao`, `foto_url`, `ativo`, `ordem`, `criado_em`) VALUES
(1, 'Summer 2024', 'Coleção de verão com peças leves e frescas', 'capa_6a28c443aedfe.jpg', 1, 1, '2026-06-17 01:42:16'),
(2, 'Winter Luxury', 'Peças de inverno premium para ocasiões especiais', 'capa_6a28c439731be.jpg', 1, 2, '2026-06-17 01:42:16'),
(3, 'Streetwear Elite', 'Edições limitadas de streetwear de luxo', 'capa_6a28c44bdec05.jpg', 1, 3, '2026-06-17 01:42:16'),
(4, 'Gala Collection', 'Peças para eventos de gala e cerimônias', 'gala-collection.jpg', 1, 4, '2026-06-17 01:42:16'),
(5, 'Techwear Pro', 'Roupas funcionais com design futurista', 'techwear-pro.jpg', 1, 5, '2026-06-17 01:42:16'),
(6, 'Vintage Archive', 'Peças vintage selecionadas do arquivo', 'vintage-archive.jpg', 1, 6, '2026-06-17 01:42:16'),
(7, 'Limited Drops', 'Lançamentos exclusivos em quantidade limitada', 'limited-drops.jpg', 1, 7, '2026-06-17 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `configuracoes_sistema`
--

CREATE TABLE `configuracoes_sistema` (
  `id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(100) NOT NULL,
  `valor` text DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuracoes_tema`
--

CREATE TABLE `configuracoes_tema` (
  `id` int(10) UNSIGNED NOT NULL,
  `chave` varchar(100) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `tipo` enum('color','font','size','other') DEFAULT 'color',
  `descricao` varchar(200) DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `configuracoes_tema`
--

INSERT INTO `configuracoes_tema` (`id`, `chave`, `valor`, `tipo`, `descricao`, `criado_em`) VALUES
(1, 'color-primary', '#641838', 'color', 'Cor primária (vinho)', '2026-06-17 01:42:03'),
(2, 'color-primary-light', '#781D43', 'color', 'Vinho claro', '2026-06-17 01:42:03'),
(3, 'color-primary-dark', '#50132D', 'color', 'Vinho escuro', '2026-06-17 01:42:03'),
(4, 'color-secondary', '#E7B93F', 'color', 'Cor de destaque (dourado)', '2026-06-17 01:42:03'),
(5, 'color-secondary-light', '#FFDE4C', 'color', 'Dourado claro', '2026-06-17 01:42:03'),
(6, 'color-secondary-dark', '#B99432', 'color', 'Dourado escuro', '2026-06-17 01:42:03'),
(7, 'color-tertiary', '#A0A0A0', 'color', 'Cinza', '2026-06-17 01:42:03'),
(8, 'color-tertiary-light', '#C0C0C0', 'color', 'Cinza claro', '2026-06-17 01:42:03'),
(9, 'color-tertiary-dark', '#808080', 'color', 'Cinza escuro', '2026-06-17 01:42:03'),
(10, 'color-dark', '#0C0716', 'color', 'Fundo principal', '2026-06-17 01:42:03'),
(11, 'color-dark-dark', '#0A0612', 'color', 'Fundo mais escuro', '2026-06-17 01:42:03'),
(12, 'color-dark-light', '#0E081A', 'color', 'Fundo claro', '2026-06-17 01:42:03'),
(13, 'color-light', '#FFFFFF', 'color', 'Texto claro', '2026-06-17 01:42:03'),
(14, 'color-light-dark', '#DCDCDC', 'color', 'Texto suave', '2026-06-17 01:42:03'),
(15, 'color-text', '#DEDDDF', 'color', 'Cor do texto', '2026-06-17 01:42:03'),
(16, 'color-bg', '#0C0716', 'color', 'Cor de fundo', '2026-06-17 01:42:03'),
(17, 'color-gold', '#E7B93F', 'color', 'Cor âncora (dourado)', '2026-06-17 01:42:03'),
(18, 'color-void', '#0A0612', 'color', 'Fundo máximo', '2026-06-17 01:42:03'),
(19, 'color-accent', '#10b981', 'color', 'Destaque alternativo', '2026-06-17 01:42:03'),
(20, 'color-error', '#ff5268', 'color', 'Cor de erro', '2026-06-17 01:42:03'),
(21, 'color-success', '#4CAF50', 'color', 'Sucesso', '2026-06-17 01:42:03'),
(22, 'color-danger', '#F44336', 'color', 'Perigo', '2026-06-17 01:42:03'),
(23, 'arqon-logo-color', '#DEDDDF', 'color', 'Cor da logo SVG', '2026-06-17 01:42:03'),
(24, 'font-primary', '\'Cinzel\', serif', 'font', 'Fonte primária', '2026-06-17 01:42:03'),
(25, 'font-secondary', '\'Inter\', sans-serif', 'font', 'Fonte secundária', '2026-06-17 01:42:03'),
(26, 'font-code', '\"Fira Code\", monospace', 'font', 'Fonte de código', '2026-06-17 01:42:03'),
(27, 'border-radius', '10px', 'size', 'Border radius padrão', '2026-06-17 01:42:03'),
(28, 'border-radius-large', '16px', 'size', 'Border radius grande', '2026-06-17 01:42:03'),
(29, 'spacing-unit', '8px', 'size', 'Unidade de espaçamento', '2026-06-17 01:42:03'),
(30, 'transition-speed', '0.3s', 'size', 'Velocidade de transição', '2026-06-17 01:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `contatos`
--

CREATE TABLE `contatos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `assunto` varchar(200) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `lido` tinyint(1) DEFAULT 0,
  `respondido` tinyint(1) DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cores`
--

CREATE TABLE `cores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `hex_code` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cores`
--

INSERT INTO `cores` (`id`, `nome`, `hex_code`) VALUES
(1, 'Preto', '#000000'),
(2, 'Branco', '#FFFFFF'),
(3, 'Bege', '#F5F5DC'),
(4, 'Azul', '#0000FF'),
(5, 'Vermelho', '#FF0000'),
(6, 'Dourado', '#D4AF37'),
(7, 'Cinza', '#808080'),
(8, 'Verde', '#008000'),
(9, 'Marrom', '#8B4513'),
(10, 'Roxo', '#800080'),
(11, 'Rosa', '#FFC0CB'),
(12, 'Laranja', '#FFA500'),
(13, 'Amarelo', '#FFFF00'),
(14, 'Turquesa', '#40E0D0'),
(15, 'Prata', '#C0C0C0'),
(16, 'Bronze', '#CD7F32'),
(17, 'Coral', '#FF7F50'),
(18, 'Oliva', '#808000'),
(19, 'Índigo', '#4B0082'),
(20, 'Violeta', '#EE82EE'),
(21, 'Creme', '#FFFDD0'),
(22, 'Chocolate', '#D2691E'),
(23, 'Terracota', '#E2725B');

-- --------------------------------------------------------

--
-- Table structure for table `cupons`
--

CREATE TABLE `cupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `tipo` enum('percentual','fixo') NOT NULL DEFAULT 'percentual',
  `valor` decimal(10,2) NOT NULL,
  `usos_maximos` int(10) UNSIGNED DEFAULT 100,
  `usos_atuais` int(10) UNSIGNED DEFAULT 0,
  `id_produto` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `valor_minimo` decimal(10,2) DEFAULT NULL,
  `status_ativo` tinyint(1) DEFAULT 1,
  `descricao` varchar(200) DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cupons`
--

INSERT INTO `cupons` (`id`, `codigo`, `tipo`, `valor`, `usos_maximos`, `usos_atuais`, `id_produto`, `id_usuario`, `validade`, `valor_minimo`, `status_ativo`, `descricao`, `criado_em`) VALUES
(1, 'ARQON10', 'percentual', '10.00', 100, 0, NULL, NULL, '2025-12-31', '200.00', 1, '10% de desconto', '2026-06-17 01:42:16'),
(2, 'VAULT20', 'percentual', '20.00', 50, 0, NULL, NULL, '2025-06-30', '500.00', 1, '20% de desconto', '2026-06-17 01:42:16'),
(3, 'FIRST50', 'fixo', '50.00', 200, 0, NULL, NULL, '2025-12-31', '100.00', 1, 'R$ 50 de desconto', '2026-06-17 01:42:16'),
(4, 'SUMMER25', 'percentual', '25.00', 200, 0, NULL, NULL, '2025-09-30', '300.00', 1, '25% de desconto no verão', '2026-06-17 01:42:16'),
(5, 'WINTER30', 'percentual', '30.00', 100, 0, NULL, NULL, '2025-08-31', '400.00', 1, '30% de desconto no inverno', '2026-06-17 01:42:16'),
(6, 'VIP40', 'percentual', '40.00', 50, 0, NULL, NULL, '2025-12-31', '1000.00', 1, '40% para VIPs', '2026-06-17 01:42:16'),
(7, 'FLASH100', 'fixo', '100.00', 150, 0, NULL, NULL, '2025-07-31', '500.00', 1, 'R$ 100 de desconto flash', '2026-06-17 01:42:16'),
(8, 'LOYALTY15', 'percentual', '15.00', 300, 0, NULL, NULL, '2025-12-31', '150.00', 1, '15% para clientes fiéis', '2026-06-17 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `entregas`
--

CREATE TABLE `entregas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_locacao` int(10) UNSIGNED NOT NULL,
  `codigo_rastreio` varchar(100) DEFAULT NULL,
  `status_gps` varchar(100) DEFAULT NULL,
  `data_postagem` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estilos`
--

CREATE TABLE `estilos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `estilos`
--

INSERT INTO `estilos` (`id`, `nome`) VALUES
(4, 'Avant-garde'),
(8, 'Bohemian'),
(12, 'Casual'),
(3, 'Classico'),
(6, 'Cyberpunk'),
(11, 'Elegant'),
(13, 'Formal'),
(2, 'Futurista'),
(7, 'Gothic'),
(5, 'Industrial'),
(1, 'Minimalista'),
(9, 'Preppy'),
(10, 'Sporty'),
(14, 'Urban'),
(15, 'Vintage');

-- --------------------------------------------------------

--
-- Table structure for table `fidelidade`
--

CREATE TABLE `fidelidade` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nivel` enum('bronze','prata','ouro','platinum') DEFAULT 'bronze',
  `pontos_totais` int(10) UNSIGNED DEFAULT 0,
  `total_alugueis` int(10) UNSIGNED DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fidelidade`
--

INSERT INTO `fidelidade` (`id`, `id_usuario`, `nivel`, `pontos_totais`, `total_alugueis`, `criado_em`, `atualizado_em`) VALUES
(1, 1, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(2, 2, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(3, 3, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(4, 4, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(5, 5, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(6, 6, 'bronze', 0, 0, '2026-06-17 01:42:16', '2026-06-17 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `contato_principal` varchar(150) DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `uuid`, `nome`, `cnpj`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `cep`, `contato_principal`, `status`, `id_usuario`, `data_criacao`, `data_atualizacao`) VALUES
(1, NULL, 'Luxury Fashion Ltda', '12.345.678/0001-90', 'contato@luxury.com', '(11) 3456-7890', NULL, 'São Paulo', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(2, NULL, 'Premium Brands SA', '98.765.432/0001-10', 'comercial@premium.com', '(21) 9876-5432', NULL, 'Rio de Janeiro', 'RJ', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(3, NULL, 'Elite Fashion Group', '45.678.901/0001-23', 'vendas@elite.com', '(31) 2345-6789', NULL, 'Belo Horizonte', 'MG', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(4, NULL, 'High End Couture', '67.890.123/0001-45', 'info@highend.com', '(41) 3456-7890', NULL, 'Curitiba', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(5, NULL, 'Designer Collection', '23.456.789/0001-67', 'contact@designer.com', '(51) 9876-5432', NULL, 'Porto Alegre', 'RS', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(6, NULL, 'Vogue Imports', '11.222.333/0001-44', 'import@vogue.com', '(11) 9999-8888', NULL, 'São Paulo', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(7, NULL, 'Harper Style House', '22.333.444/0001-55', 'style@harper.com', '(21) 8888-7777', NULL, 'Rio de Janeiro', 'RJ', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(8, NULL, 'Elle Fashion Supply', '33.444.555/0001-66', 'supply@elle.com', '(31) 7777-6666', NULL, 'Belo Horizonte', 'MG', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(9, NULL, 'Glamour Couture', '44.555.666/0001-77', 'couture@glamour.com', '(41) 6666-5555', NULL, 'Curitiba', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(10, NULL, 'Vogue Accessories', '55.666.777/0001-88', 'access@vogue.com', '(51) 5555-4444', NULL, 'Porto Alegre', 'RS', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(11, NULL, 'Fashion Forward', '66.777.888/0001-99', 'forward@fashion.com', '(11) 4444-3333', NULL, 'São Paulo', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(12, NULL, 'Style Elite Group', '77.888.999/0001-00', 'elite@style.com', '(21) 3333-2222', NULL, 'Rio de Janeiro', 'RJ', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(13, NULL, 'Trend Setters Ltd', '88.999.000/0001-11', 'trend@setters.com', '(31) 2222-1111', NULL, 'Belo Horizonte', 'MG', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(14, NULL, 'Chic Boutique Supply', '99.000.111/0001-22', 'chic@boutique.com', '(41) 1111-0000', NULL, 'Curitiba', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(15, NULL, 'Moda Premium Brasil', '00.111.222/0001-33', 'premium@moda.com', '(51) 0000-9999', NULL, 'Porto Alegre', 'RS', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(16, NULL, 'Ricardo Fashion Vendor', '00.000.000/0001-99', 'ricardo@arqon.com', '(11) 99999-9999', NULL, 'São Paulo', 'SP', NULL, NULL, 'ativo', 5, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(17, NULL, 'Amazon Luxury Imports', '11.111.111/0001-11', 'amazon@luxury.com', '(92) 3333-4444', NULL, 'Manaus', 'AM', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(18, NULL, 'Belem Fashion Center', '22.222.222/0001-22', 'belem@fashion.com', '(91) 3222-5555', NULL, 'Belém', 'PA', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(19, NULL, 'Rio Branco Style', '33.333.333/0001-33', 'riobranco@style.com', '(68) 3221-6666', NULL, 'Rio Branco', 'AC', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(20, NULL, 'Macapá Elegance', '44.444.444/0001-44', 'macapa@elegance.com', '(96) 3111-7777', NULL, 'Macapá', 'AP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(21, NULL, 'Palmas Premium', '55.555.555/0001-55', 'palmas@premium.com', '(63) 3215-8888', NULL, 'Palmas', 'TO', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(22, NULL, 'Boa Vista Couture', '66.666.666/0001-66', 'boavista@couture.com', '(95) 3623-9999', NULL, 'Boa Vista', 'RR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(23, NULL, 'Porto Velho Trends', '77.777.777/0001-77', 'portovelho@trends.com', '(69) 3214-0000', NULL, 'Porto Velho', 'RO', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(24, NULL, 'Salvador Chic', '88.888.888/0001-88', 'salvador@chic.com', '(71) 3333-1111', NULL, 'Salvador', 'BA', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(25, NULL, 'Recife Moda Praia', '99.999.999/0001-99', 'recife@modapraia.com', '(81) 3462-2222', NULL, 'Recife', 'PE', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(26, NULL, 'Fortaleza Glamour', '12.121.212/0001-00', 'fortaleza@glamour.com', '(85) 3246-3333', NULL, 'Fortaleza', 'CE', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(27, NULL, 'São Luís Fashion', '23.232.323/0001-11', 'saoluis@fashion.com', '(98) 3218-4444', NULL, 'São Luís', 'MA', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(28, NULL, 'Natal Luxury Wear', '34.343.434/0001-22', 'natal@luxury.com', '(84) 3215-5555', NULL, 'Natal', 'RN', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(29, NULL, 'João Pessoa Elegance', '45.454.545/0001-33', 'joaopessoa@elegance.com', '(83) 3216-6666', NULL, 'João Pessoa', 'PB', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(30, NULL, 'Teresina Style House', '56.565.656/0001-44', 'teresina@style.com', '(86) 3217-7777', NULL, 'Teresina', 'PI', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(31, NULL, 'Aracaju Trends', '67.676.767/0001-55', 'aracaju@trends.com', '(79) 3218-8888', NULL, 'Aracaju', 'SE', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(32, NULL, 'Maceió Fashion Week', '78.787.878/0001-66', 'maceio@fashion.com', '(82) 3219-9999', NULL, 'Maceió', 'AL', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(33, NULL, 'Brasília Power Suit', '89.898.989/0001-77', 'brasilia@powersuit.com', '(61) 3333-0000', NULL, 'Brasília', 'DF', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(34, NULL, 'Goiânia Glam', '90.909.090/0001-88', 'goiania@glam.com', '(62) 3251-1111', NULL, 'Goiânia', 'GO', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(35, NULL, 'Cuiabá Couture', '01.010.101/0001-99', 'cuiaba@couture.com', '(65) 3312-2222', NULL, 'Cuiabá', 'MT', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(36, NULL, 'Campo Grande Elegance', '02.020.202/0001-00', 'campogrande@elegance.com', '(67) 3382-3333', NULL, 'Campo Grande', 'MS', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(37, NULL, 'São Paulo Fashion Hub', '03.030.303/0001-11', 'sp@fashionhub.com', '(11) 3333-4444', NULL, 'São Paulo', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(38, NULL, 'Rio Luxury Brands', '04.040.404/0001-22', 'rio@luxury.com', '(21) 3444-5555', NULL, 'Rio de Janeiro', 'RJ', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(39, NULL, 'Belo Horizonte Chic', '05.050.505/0001-33', 'bh@chic.com', '(31) 3555-6666', NULL, 'Belo Horizonte', 'MG', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(40, NULL, 'Vitória Elegance', '06.060.606/0001-44', 'vitoria@elegance.com', '(27) 3666-7777', NULL, 'Vitória', 'ES', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(41, NULL, 'Guarulhos Style', '07.070.707/0001-55', 'guarulhos@style.com', '(11) 3777-8888', NULL, 'Guarulhos', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(42, NULL, 'Campinas Luxury', '08.080.808/0001-66', 'campinas@luxury.com', '(19) 3888-9999', NULL, 'Campinas', 'SP', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(43, NULL, 'Curitiba Fashion Lab', '09.090.909/0001-77', 'curitiba@fashionlab.com', '(41) 3999-0000', NULL, 'Curitiba', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(44, NULL, 'Porto Alegre Glamour', '10.101.010/0001-88', 'poa@glamour.com', '(51) 3111-2222', NULL, 'Porto Alegre', 'RS', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(45, NULL, 'Florianópolis Beach Wear', '11.212.121/0001-99', 'floripa@beachwear.com', '(48) 3222-3333', NULL, 'Florianópolis', 'SC', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(46, NULL, 'Joinville Couture', '12.323.232/0001-00', 'joinville@couture.com', '(47) 3433-4444', NULL, 'Joinville', 'SC', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(47, NULL, 'Londrina Style', '13.434.343/0001-11', 'londrina@style.com', '(43) 3333-5555', NULL, 'Londrina', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16'),
(48, NULL, 'Maringá Elegance', '14.545.454/0001-22', 'maringa@elegance.com', '(44) 3222-6666', NULL, 'Maringá', 'PR', NULL, NULL, 'ativo', NULL, '2026-06-17 01:42:16', '2026-06-17 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `itens_estoque`
--

CREATE TABLE `itens_estoque` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_cor` int(10) UNSIGNED NOT NULL,
  `tamanho` varchar(10) NOT NULL,
  `rfid_nfc_tag` varchar(100) NOT NULL,
  `status_atual` enum('Disponível','No Vault','Alugado','Transporte','Manutenção','Higienização') DEFAULT 'Disponível',
  `condicao_fisica` varchar(100) DEFAULT 'Perfeita',
  `qtd_locacoes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `itens_estoque`
--

INSERT INTO `itens_estoque` (`id`, `id_produto`, `id_cor`, `tamanho`, `rfid_nfc_tag`, `status_atual`, `condicao_fisica`, `qtd_locacoes`) VALUES
(1, 1, 1, 'P', 'RFID-001-P', 'Disponível', 'Perfeita', 0),
(2, 1, 1, 'M', 'RFID-001-M', 'Disponível', 'Perfeita', 0),
(3, 1, 1, 'G', 'RFID-001-G', 'No Vault', 'Perfeita', 0),
(4, 2, 1, '46', 'RFID-002-46', 'Disponível', 'Perfeita', 0),
(5, 2, 1, '48', 'RFID-002-48', 'Disponível', 'Perfeita', 0),
(6, 2, 1, '50', 'RFID-002-50', 'Disponível', 'Perfeita', 0),
(7, 3, 1, '36', 'RFID-003-36', 'Disponível', 'Perfeita', 0),
(8, 3, 1, '38', 'RFID-003-38', 'No Vault', 'Perfeita', 0),
(9, 4, 3, 'M', 'RFID-004-M', 'Disponível', 'Perfeita', 0),
(10, 4, 3, 'G', 'RFID-004-G', 'Disponível', 'Perfeita', 0),
(11, 5, 2, '40', 'RFID-005-40', 'Disponível', 'Perfeita', 0),
(12, 5, 2, '42', 'RFID-005-42', 'Disponível', 'Perfeita', 0),
(13, 6, 1, 'UN', 'RFID-006-UN', 'Disponível', 'Perfeita', 0),
(14, 7, 1, 'P', 'RFID-007-P', 'Disponível', 'Perfeita', 0),
(15, 7, 1, 'M', 'RFID-007-M', 'Disponível', 'Perfeita', 0),
(16, 7, 1, 'G', 'RFID-007-G', 'No Vault', 'Perfeita', 0),
(17, 8, 1, '46', 'RFID-008-46', 'Disponível', 'Perfeita', 0),
(18, 8, 1, '48', 'RFID-008-48', 'Disponível', 'Perfeita', 0),
(19, 9, 1, 'U', 'RFID-009-U', 'Disponível', 'Perfeita', 0),
(20, 10, 6, 'U', 'RFID-010-U', 'Disponível', 'Perfeita', 0),
(21, 11, 9, 'U', 'RFID-011-U', 'No Vault', 'Perfeita', 0),
(22, 12, 1, 'U', 'RFID-012-U', 'Disponível', 'Perfeita', 0),
(23, 13, 2, '40', 'RFID-013-40', 'Disponível', 'Perfeita', 0),
(24, 13, 2, '42', 'RFID-013-42', 'Disponível', 'Perfeita', 0),
(25, 14, 18, 'U', 'RFID-014-U', 'Disponível', 'Perfeita', 0),
(26, 15, 1, '42', 'RFID-015-42', 'Disponível', 'Perfeita', 0),
(27, 15, 1, '44', 'RFID-015-44', 'Disponível', 'Perfeita', 0),
(28, 16, 3, 'U', 'RFID-016-U', 'No Vault', 'Perfeita', 0),
(29, 17, 1, 'U', 'RFID-017-U', 'No Vault', 'Perfeita', 0),
(30, 18, 11, 'U', 'RFID-018-U', 'Disponível', 'Perfeita', 0),
(31, 19, 1, '44', 'RFID-019-44', 'Disponível', 'Perfeita', 0),
(32, 20, 1, '36', 'RFID-020-36', 'No Vault', 'Perfeita', 0),
(33, 20, 1, '38', 'RFID-020-38', 'Disponível', 'Perfeita', 0),
(34, 38, 1, 'P', 'RFID-HOO1-P', 'Disponível', 'Perfeita', 0),
(35, 38, 1, 'M', 'RFID-HOO1-M', 'Disponível', 'Perfeita', 0),
(36, 38, 1, 'G', 'RFID-HOO1-G', 'Disponível', 'Perfeita', 0),
(37, 39, 1, 'P', 'RFID-SHA2-P', 'Disponível', 'Perfeita', 0),
(38, 39, 1, 'M', 'RFID-SHA2-M', 'Disponível', 'Perfeita', 0),
(39, 39, 1, 'G', 'RFID-SHA2-G', 'No Vault', 'Perfeita', 0),
(40, 40, 1, 'M', 'RFID-HOO3-M-MUSGO', 'No Vault', 'Perfeita', 0),
(41, 40, 1, 'M', 'RFID-HOO3-M-BLUSH', 'Disponível', 'Perfeita', 0),
(42, 40, 1, 'M', 'RFID-HOO3-M-SLATE', 'Disponível', 'Perfeita', 0),
(43, 40, 1, 'G', 'RFID-HOO3-G-MUSGO', 'Disponível', 'Perfeita', 0),
(44, 41, 1, 'P', 'RFID-TEE4-P', 'Disponível', 'Perfeita', 0),
(45, 41, 1, 'M', 'RFID-TEE4-M', 'Disponível', 'Perfeita', 0),
(46, 41, 1, 'G', 'RFID-TEE4-G', 'Disponível', 'Perfeita', 0),
(47, 42, 1, 'M', 'RFID-CRW5-M', 'Disponível', 'Perfeita', 0),
(48, 42, 1, 'G', 'RFID-CRW5-G', 'Disponível', 'Perfeita', 0),
(49, 42, 1, 'GG', 'RFID-CRW5-GG', 'Disponível', 'Perfeita', 0),
(50, 43, 1, 'P', 'RFID-HOO6-P', 'Disponível', 'Perfeita', 0),
(51, 43, 1, 'M', 'RFID-HOO6-M', 'Disponível', 'Perfeita', 0),
(52, 43, 1, 'G', 'RFID-HOO6-G', 'Disponível', 'Perfeita', 0),
(53, 44, 1, 'P', 'RFID-LTH7-P', 'Disponível', 'Perfeita', 0),
(54, 44, 1, 'M', 'RFID-LTH7-M', 'Disponível', 'Perfeita', 0),
(55, 44, 1, 'G', 'RFID-LTH7-G', 'Disponível', 'Perfeita', 0),
(56, 45, 1, 'P', 'RFID-BLZ8-P', 'Disponível', 'Perfeita', 0),
(57, 45, 1, 'M', 'RFID-BLZ8-M', 'Disponível', 'Perfeita', 0),
(58, 45, 1, 'G', 'RFID-BLZ8-G', 'Disponível', 'Perfeita', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jwt_blacklist`
--

CREATE TABLE `jwt_blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jwt_blacklist`
--

INSERT INTO `jwt_blacklist` (`id`, `token_hash`, `expires_at`, `criado_em`) VALUES
(1, '708b5e8b583dea4e644ea19e975815ff937ede3a58eca3cbbcb8b3f4a1e0ee3f', '2026-06-18 01:57:18', '2026-06-18 04:00:02'),
(2, 'dea69d74643d63a462314c3a8be35bbf844b1793c6662c3c2fb6d795311a8dec', '2026-06-18 02:00:37', '2026-06-18 04:00:52'),
(3, '408e91b563568669789b2850cf00fee9fd97378954c93e1a233d147923587bf4', '2026-06-18 10:04:07', '2026-06-18 12:10:25'),
(4, '27399af3d6f492963f22af7e799e2f8840df697db6b9981da081d9bda7786c9a', '2026-06-18 10:18:03', '2026-06-18 12:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `locacoes`
--

CREATE TABLE `locacoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_item_estoque` int(10) UNSIGNED NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `valor_aluguel` decimal(10,2) NOT NULL,
  `valor_caucao` decimal(10,2) NOT NULL,
  `status_pedido` enum('pendente','pago','enviado','entregue','devolvido','concluido','cancelado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `locacoes`
--

INSERT INTO `locacoes` (`id`, `id_usuario`, `id_item_estoque`, `data_inicio`, `data_fim`, `valor_aluguel`, `valor_caucao`, `status_pedido`) VALUES
(1, 7, 29, '2026-06-17', '2026-06-24', '2240.00', '640.00', 'pago'),
(2, 8, 32, '2026-06-19', '2026-06-23', '760.00', '380.00', 'enviado'),
(3, 9, 40, '2026-06-25', '2026-07-07', '900.00', '150.00', 'pendente');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `sucesso` tinyint(1) DEFAULT 0,
  `tentado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs_webhooks`
--

CREATE TABLE `logs_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `servico_origem` varchar(50) DEFAULT NULL,
  `payload_recebido` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `lookbooks_ia`
--

CREATE TABLE `lookbooks_ia` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `produtos_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `comissao_percentual` decimal(5,2) DEFAULT 25.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `descricao`, `logo_url`, `comissao_percentual`) VALUES
(1, 'Gucci', 'Luxo italiano', NULL, '25.00'),
(2, 'Prada', 'Alta costura italiana', NULL, '25.00'),
(3, 'Balenciaga', 'Moda de vanguarda', NULL, '25.00'),
(4, 'Off-White', 'Streetwear de luxo', NULL, '25.00'),
(5, 'Saint Laurent', 'Elegancia francesa', NULL, '25.00'),
(6, 'Versace', 'Glamour italiano', NULL, '25.00'),
(7, 'Givenchy', 'Sophisticaçao francesa', NULL, '25.00'),
(8, 'Alexander McQueen', 'Avant-garde britanico', NULL, '25.00'),
(9, 'Chanel', 'Casa de moda francesa', NULL, '25.00'),
(10, 'Hermès', 'Luxo artesanal frances', NULL, '25.00'),
(11, 'Louis Vuitton', 'Marca de luxo francesa', NULL, '25.00'),
(12, 'Dior', 'Alta costura francesa', NULL, '25.00'),
(13, 'Fendi', 'Casa de moda italiana', NULL, '25.00'),
(14, 'Bottega Veneta', 'Artesanato italiano', NULL, '25.00'),
(15, 'Valentino', 'Elegancia italiana', NULL, '25.00'),
(16, 'Celine', 'Minimalismo frances', NULL, '25.00'),
(17, 'Loewe', 'Design espanhol', NULL, '25.00'),
(18, 'Jacquemus', 'Moda francesa contemporanea', NULL, '25.00'),
(19, 'Rick Owens', 'Avant-garde americano', NULL, '25.00'),
(20, 'Yohji Yamamoto', 'Design japones', NULL, '25.00'),
(21, 'Comme des Garçons', 'Vanguarda japonesa', NULL, '25.00'),
(22, 'Issey Miyake', 'Design inovador japones', NULL, '25.00'),
(23, 'Acne Studios', 'Minimalismo sueco', NULL, '25.00'),
(24, 'Fear of God', 'Streetwear americano', NULL, '25.00'),
(25, 'Palm Angels', 'Luxo californiano', NULL, '25.00'),
(26, 'Ambush', 'Acessorios de luxo', NULL, '25.00'),
(27, 'A-Cold-Wall*', 'Design conceptual', NULL, '25.00'),
(28, 'Burberry', 'Luxo britanico', NULL, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `niveis_acesso`
--

CREATE TABLE `niveis_acesso` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `permissoes_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Dumping data for table `niveis_acesso`
--

INSERT INTO `niveis_acesso` (`id`, `nome`, `permissoes_json`) VALUES
(1, 'MEMBER', '{\"catalogo\": true, \"aluguel\": true}'),
(2, 'VAULT_MGMT', '{\"inventario\": true, \"locacoes\": true}'),
(3, 'PRIORITY_ACCESS', '{\"beneficios_exclusivos\": true}'),
(4, 'TOTAL_CONTROL', '{\"admin\": true}'),
(5, 'VENDOR', '{\"fornecedor\": true}');

-- --------------------------------------------------------

--
-- Table structure for table `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `mensagem` text DEFAULT NULL,
  `tipo` enum('info','sucesso','aviso','erro') DEFAULT 'info',
  `lida` tinyint(1) DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `numero_serie` varchar(50) DEFAULT NULL,
  `id_marca` int(10) UNSIGNED NOT NULL,
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_estilo` int(10) UNSIGNED NOT NULL,
  `id_fornecedor` int(10) UNSIGNED DEFAULT NULL,
  `genero` varchar(20) DEFAULT 'Unissex',
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `descricao_rica` text DEFAULT NULL,
  `composicao` varchar(255) DEFAULT NULL,
  `cor_principal` varchar(50) DEFAULT NULL,
  `condicao` varchar(50) DEFAULT 'Excelente',
  `valor_mercado` decimal(10,2) NOT NULL,
  `valor_diaria` decimal(10,2) NOT NULL,
  `foto_principal_url` longtext DEFAULT NULL,
  `status_venda` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `sku`, `numero_serie`, `id_marca`, `id_categoria`, `id_estilo`, `id_fornecedor`, `genero`, `nome`, `descricao`, `descricao_rica`, `composicao`, `cor_principal`, `condicao`, `valor_mercado`, `valor_diaria`, `foto_principal_url`, `status_venda`) VALUES
(1, 'ARQ-TW-001', 'SN001', 27, 6, 2, NULL, 'Feminino', 'Vestido Gala Esmeralda Serpente', 'Elegância hipnótica em veludo profundo e tramas de ouro para noites imortais.', NULL, 'Veludo de seda com bordados metalizados', 'Preto', 'Excelente', '7800.00', '450.00', 'capa_6a3339fab97e2.jpg', 1),
(2, 'ARQ-PR-002', 'SN002', 2, 1, 2, NULL, 'Masculino', 'Jaqueta Techwear Alpine Frost', 'Minimalismo técnico com isolamento térmico de alta performance para o rigor do inverno.', NULL, 'Poliéster de alta densidade com isolamento térmico premium', 'Preto', 'Excelente', '3500.00', '200.00', 'capa_6a33498f0d9c0.jpg', 1),
(3, 'ARQ-GV-003', 'SN003', 7, 6, 7, NULL, 'Feminino', 'Vestido Gown Crimson Vesper', 'Elegância arquitetônica em veludo bordeaux: silhueta dramática para noites inesquecíveis.', NULL, '100% Veludo de Algodão (visivelmente pesado, com um brilho rico e textura densa)', 'Preto', 'Excelente', '28000.00', '1200.00', 'capa_6a336f35e9a12.jpg', 1),
(4, 'ARQ-BR-004', 'SN004', 28, 2, 3, NULL, 'Unissex', 'Trench Coat Burberry', 'Trench coat bege', NULL, 'Algodao 100%', 'Bege', 'Muito Bom', '3200.00', '180.00', 'burberry-trench-beige.jpg', 1),
(5, 'ARQ-OW-005', 'SN005', 4, 5, 2, NULL, 'Unissex', 'Sneaker Off-White', 'Tenis edicao limitada', NULL, 'Couro sintetico', 'Branco', 'Novo', '1800.00', '120.00', 'offwhite-sneaker-white.jpg', 1),
(6, 'ARQ-GC-006', 'SN006', 1, 3, 3, NULL, 'Feminino', 'Bolsa Gucci Dionysus', 'Bolsa couro GG', NULL, 'Couro 100%', 'Preto', 'Excelente', '2800.00', '100.00', 'gucci-bag-black.jpg', 1),
(7, 'ARQ-001', 'SN000100', 1, 1, 1, NULL, 'Masculino', 'Jaqueta Gucci Noir Premium', 'Jaqueta de couro premium', NULL, 'Couro 100%', 'Preto', 'Excelente', '4500.00', '225.00', 'prod-001.jpg', 1),
(8, 'ARQ-002', 'SN000101', 2, 2, 3, NULL, 'Feminino', 'Vestido Prada Gala', 'Vestido de noite', NULL, 'Seda 100%', 'Preto', 'Excelente', '5500.00', '275.00', 'prod-002.jpg', 1),
(9, 'ARQ-003', 'SN000102', 3, 4, 2, NULL, 'Unissex', 'Blazer Balenciaga Tech', 'Blazer futurista', NULL, 'Poliéster 100%', 'Preto', 'Excelente', '3800.00', '190.00', 'prod-003.jpg', 1),
(10, 'ARQ-004', 'SN000103', 4, 5, 6, NULL, 'Masculino', 'Tênis Off-White Limited', 'Edição limitada', NULL, 'Couro sintético', 'Branco', 'Novo', '2200.00', '110.00', 'prod-004.jpg', 1),
(11, 'ARQ-005', 'SN000104', 5, 2, 3, NULL, 'Feminino', 'Bolsa Saint Laurent', 'Bolsa de luxo', NULL, 'Couro 100%', 'Preto', 'Excelente', '3200.00', '160.00', 'prod-005.jpg', 1),
(12, 'ARQ-006', 'SN000105', 6, 1, 4, NULL, 'Masculino', 'Camisa Versace Print', 'Camisa estampada', NULL, 'Algodão 100%', 'Dourado', 'Excelente', '1800.00', '90.00', 'prod-006.jpg', 1),
(13, 'ARQ-007', 'SN000106', 7, 6, 3, NULL, 'Feminino', 'Vestido Givenchy Noir', 'Vestido elegante', NULL, 'Seda 100%', 'Preto', 'Excelente', '4800.00', '240.00', 'prod-007.jpg', 1),
(14, 'ARQ-008', 'SN000107', 26, 6, 12, NULL, 'Unissex', 'Casaco Fleece Alabastro Shimmer', 'Textura ultra-sofisticada e conforto tátil supremo moldados para a elegância urbana noturna.', NULL, 'Fleece de pelúcia premium texturizado com toque de seda e forro em cetim', 'Preto', 'Excelente', '4200.00', '210.00', 'capa_6a335d3f26803.jpg', 1),
(15, 'ARQ-009', 'SN000108', 24, 6, 1, NULL, 'Feminino', 'Vestido Corset Alabastro Marfim', 'Silhueta escultural e minimalismo magnético em um design tomara que caia definitivo.', NULL, 'neoprene de alta densidade com acabamento acetinado', 'Preto', 'Excelente', '6500.00', '325.00', 'capa_6a335b614f49d.jpg', 1),
(16, 'ARQ-010', 'SN000109', 16, 3, 15, NULL, 'Feminino', 'Capa Vesper Dourada', 'Mistério e imponência em uma estrutura de capuz com brilho etéreo.', NULL, 'Tecido técnico acetinado com trama metalizada e forro em seda', 'Marrom', 'Excelente', '1200.00', '120.00', 'capa_6a3359a08c41a.jpg', 1),
(17, 'ARQ-011', 'SN000110', 22, 6, 1, NULL, 'Feminino', 'Top Assimétrico Eclipse Lunar', 'Elegância sculptural em seda prateada, desenhada para destacar o contraste entre o brilho e a penumbra.', NULL, 'Cetim de seda com elastano para estrutura fluida', 'Marrom', 'Excelente', '4500.00', '320.00', 'capa_6a33581049900.jpg', 1),
(18, 'ARQ-012', 'SN000111', 9, 6, 3, NULL, 'Feminino', 'Calça Tailored Alabastro', 'Estrutura impecável e corte minimalista para uma silhueta de poder absoluto.', NULL, 'Brim de algodão premium com elastano para ajuste estruturado', 'Preto', 'Excelente', '3200.00', '250.00', 'capa_6a3356b9ece53.jpg', 1),
(19, 'ARQ-013', 'SN000112', 9, 6, 12, NULL, 'Feminino', 'Blazer Alabastro Estruturado', 'Alfaiataria impecável que redefine o conceito de luz e forma no ambiente urbano.', NULL, 'Lã fria com seda e forro em acetato premium', 'Branco', 'Novo', '5200.00', '380.00', 'capa_6a33555e757ed.jpg', 1),
(20, 'ARQ-014', 'SN000113', 14, 3, 1, NULL, 'Unissex', 'Cinto Signature D² Noir', 'A síntese perfeita do minimalismo moderno com a imponência do couro nobre.', NULL, '100% Couro Bovino com fivela em liga metálica premium', 'Verde', 'Excelente', '2800.01', '190.00', 'capa_6a335406aa9c9.jpg', 1),
(38, 'ARQ-HOO-1001', NULL, 1, 5, 1, NULL, 'Unissex', 'Hoodie Vault Oversized Olive', 'Hoodie oversized em algodão premium peso 480g, cor verde oliva militar. Capuz duplo com cadarço plano.', 'Construído para dominar o espaço entre o conforto absoluto e a presença visual. Este hoodie em algodão cardado de 480g apresenta um caimento caído intencional, ombros descidos e punhos canelados reforçados. A tonalidade verde oliva militar foi desenvolvida exclusivamente para o Vault, evocando utilitário de patrulha com sofisticação urbana.', '100% Algodão Cardado 480g', 'Verde Oliva', 'Excelente', '1200.00', '85.00', 'capa_6a336bb3279db.jpg', 1),
(39, 'ARQ-SHA-1002', NULL, 1, 6, 3, NULL, 'Feminino', 'Shacket Dune Longline', 'Camisa-jacaca longline em lã-cardada pesada, tonalidade areia/deserto. Botões madrepérola e bolsos de parche.', 'A peça que desafia as estações. Em lã-cardada de peso médio com tratamento anti-bolinha, esta shacket longline apresenta um comprimento abaixo do quadril que cria silhueta alongada. A cor Dune — um bege que viaja entre o deserto e o concreto — é cortada com precisão minimalista. Botões em madrepérola natural e costuras selvedge completam o arsenal.', '80% Lã, 20% Poliamida', 'Bege Dune', 'Ótima', '1800.00', '110.00', 'capa_6a336bca1236f.jpg', 1),
(40, 'ARQ-HOO-1003', NULL, 1, 5, 2, NULL, 'Unissex', 'Hoodie Trinity Earth Tones', 'Hoodie em três variações de cores terrosas: musgo, blush e slate. Corte relaxed com bolso canguru.', 'Três versões do mesmo DNA. Cada hoodie é tingido em batch limitado com pigmentos reativos que garantem profundidade de cor e resistência à lavagem. O corte relaxed proporciona mobilidade total sem perder a estrutura. Bolso canguru com costura tripla e interior em fleece escovado para retenção térmica. Edição limitada ao Vault.', '85% Algodão, 15% Poliéster Reciclado', 'Multicolor Terroso', 'Excelente', '950.00', '75.00', 'capa_6a336bdce4320.jpg', 1),
(41, 'ARQ-TEE-1004', NULL, 1, 5, 1, NULL, 'Feminino', 'Cropped Tee Void Black', 'Camiseta cropped em algodão egípcio 220g, corte reto e gola redonda minimalista. Preto absoluto.', 'A peça mais perigosa do Vault. Em algodão egípcio de 220g com gramatura que segura a estrutura sem rigidez, este cropped é cortado para parar exatamente na cintura — nem um centímetro a mais. O preto Void foi desenvolvido com tinta reativa que mantém a profundide absortiva mesmo após 50 lavagens. Sem estampas. Sem logos. Pura presença.', '100% Algodão Egípcio 220g', 'Preto Void', 'Novo', '380.00', '45.00', 'capa_6a336bff2f1a9.jpg', 1),
(42, 'ARQ-CRW-1005', NULL, 1, 3, 5, NULL, 'Masculino', 'Crewneck Shadow + Bucket Set', 'Conjunto: crewneck oversized preto em algodão texturizado + bucket hat canvas preto.', 'Duas peças, uma só atitude. O crewneck apresenta queda pesada em algodão texturizado de 360g com ombreiras sutis que mantêm a estrutura nos ombros. O bucket hat em canvas encerado oferece proteção e stealth — zero logos, zero brilho. Juntos, formam o uniforme para quem opera nas sombras da cidade sem perder a classe.', '100% Algodão Texturizado 360g / Canvas Encerado', 'Preto Shadow', 'Excelente', '1400.00', '95.00', 'capa_6a336c1606197.jpg', 1),
(43, 'ARQ-HOO-1006', NULL, 1, 5, 4, NULL, 'Unissex', 'Hoodie Chroma Gradient', 'Hoodie oversized com gradiente fluido entre teal, âmbar, coral e rosa choque.', 'Uma explosão controlada de cor. Este hoodie oversized recebe tratamento tie-dye premium em gradiente contínuo que flui do teal profundo ao coral quente, passando pelo âmbar solar. Cada peça é única devido à técnica de imersão artesanal. Interior em fleece de algodão egípcio para conforto térmico. Para quem vive em technicolor dentro de um mundo cinza.', '100% Algodão Egípcio 400g', 'Gradiente Chroma', 'Novo', '1500.00', '95.00', 'capa_6a336c2ec3554.jpg', 1),
(44, 'ARQ-LTH-1007', NULL, 1, 6, 5, NULL, 'Unissex', 'Biker Jacket Cognac', 'Jaqueta biker em couro vegetal cor caramelo/cognac. Zíperes assimétricos e cinto de ajuste.', 'A rebeldia refinada. Esculpida em couro vegetal italiano de grão inteiro na tonalidade Cognac — um caramelo que escurece com o tempo, desenvolvendo patina única. Fechamento assimétrico, bolsos com zíper YKK e cintos de ajuste nos punhos e na cintura. Costura reforçada em kevlar nos pontos de tensão. Herança de estrada, sofisticação de cidade.', '100% Couro Vegetal Italiano', 'Cognac', 'Excelente', '4200.00', '180.00', 'capa_6a336c3fc9aed.jpg', 1),
(45, 'ARQ-BLZ-1008', NULL, 1, 6, 3, NULL, 'Feminino', 'Blazer Oversized Rose', 'Blazer oversized feminino em lã mista rosa blush, corte desestruturado e botões dourados.', 'Poder em tom pastel. Este blazer oversized desafia a rigidez do tailoring tradicional com ombros amplificados e caimento reto que flui sobre o corpo. Em lã mista de peso médio na tonalidade Rose — um blush que transita entre o meeting room e o rooftop lounge. Botões dourados foscos e forro acetinado completam a declaração.', '70% Lã, 28% Poliéster, 2% Elastano', 'Rose Blush', 'Novo', '2800.00', '140.00', 'capa_6a336c560959b.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produto_midias`
--

CREATE TABLE `produto_midias` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL,
  `tipo_midia` enum('imagem','video','3d_model') DEFAULT 'imagem',
  `url_midia` varchar(255) NOT NULL,
  `ordem` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produto_midias`
--

INSERT INTO `produto_midias` (`id`, `id_produto`, `tipo_midia`, `url_midia`, `ordem`, `created_at`) VALUES
(10, 1, '3d_model', '3d_6a333a65dfd83.glb', 0, '2026-06-18 00:23:01'),
(11, 2, 'imagem', 'galeria_6a33498f0dc60.png', 1, '2026-06-18 01:27:42'),
(12, 2, '3d_model', '3d_6a33498f0dd2e.glb', 0, '2026-06-18 01:27:42'),
(13, 20, '3d_model', '3d_6a335406aaade.glb', 0, '2026-06-18 02:12:22'),
(14, 19, 'imagem', 'galeria_6a33555e758b2.jpg', 1, '2026-06-18 02:18:06'),
(15, 19, '3d_model', '3d_6a33555e75952.glb', 0, '2026-06-18 02:18:06'),
(16, 18, 'imagem', 'galeria_6a3356b9ecf31.jpg', 1, '2026-06-18 02:23:53'),
(17, 18, '3d_model', '3d_6a3356b9ecff2.glb', 0, '2026-06-18 02:23:53'),
(18, 17, 'imagem', 'galeria_6a335810499c9.jpg', 1, '2026-06-18 02:29:36'),
(19, 17, '3d_model', '3d_6a33581049a7f.glb', 0, '2026-06-18 02:29:36'),
(20, 16, 'imagem', 'galeria_6a3359a08c568.jpg', 1, '2026-06-18 02:36:16'),
(21, 16, '3d_model', '3d_6a3359a08c668.glb', 0, '2026-06-18 02:36:16'),
(22, 15, 'imagem', 'galeria_6a335b614f5d6.jpg', 1, '2026-06-18 02:43:45'),
(23, 15, '3d_model', '3d_6a335b614f6f4.glb', 0, '2026-06-18 02:43:45'),
(24, 14, '3d_model', '3d_6a335d3f26923.glb', 0, '2026-06-18 02:51:43'),
(25, 3, 'imagem', 'galeria_6a336f35e9b87.jpg', 1, '2026-06-18 04:08:22'),
(26, 3, '3d_model', '3d_6a336f36012f2.glb', 0, '2026-06-18 04:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `sistema_logs`
--

CREATE TABLE `sistema_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `acao` varchar(255) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `data_hora` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sistema_logs`
--

INSERT INTO `sistema_logs` (`id`, `id_usuario`, `acao`, `tabela`, `data_hora`) VALUES
(1, 1, 'Produto #37 removido', 'produtos', '2026-06-17 01:43:19'),
(2, 1, 'Produto #36 removido', 'produtos', '2026-06-17 01:43:23'),
(3, 1, 'Produto #35 removido', 'produtos', '2026-06-17 01:43:26'),
(4, 1, 'Produto #34 removido', 'produtos', '2026-06-17 01:43:30'),
(5, 1, 'Produto #33 removido', 'produtos', '2026-06-17 01:43:34'),
(6, 1, 'Produto #32 removido', 'produtos', '2026-06-17 01:43:38'),
(7, 1, 'Produto #31 removido', 'produtos', '2026-06-17 01:43:42'),
(8, 1, 'Produto #30 removido', 'produtos', '2026-06-17 01:43:46'),
(9, 1, 'Produto #29 removido', 'produtos', '2026-06-17 01:43:49'),
(10, 1, 'Produto #28 removido', 'produtos', '2026-06-17 01:43:51'),
(11, 1, 'Produto #27 removido', 'produtos', '2026-06-17 01:43:54'),
(12, 1, 'Produto #26 removido', 'produtos', '2026-06-17 01:45:27'),
(13, 1, 'Produto #25 removido', 'produtos', '2026-06-17 01:45:30'),
(14, 1, 'Produto #24 removido', 'produtos', '2026-06-17 01:45:33'),
(15, 1, 'Produto #23 removido', 'produtos', '2026-06-17 01:45:36'),
(16, 1, 'Produto #22 removido', 'produtos', '2026-06-17 01:45:40'),
(17, 1, 'Produto #21 removido', 'produtos', '2026-06-17 01:45:44'),
(18, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:04:17'),
(19, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:05:01'),
(20, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:06:38'),
(21, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:07:08'),
(22, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:08:48'),
(23, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:21:13'),
(24, 1, 'Produto #1 atualizado', 'produtos', '2026-06-18 00:23:01'),
(25, 1, 'Produto #2 atualizado', 'produtos', '2026-06-18 01:27:42'),
(26, 1, 'Produto #20 atualizado', 'produtos', '2026-06-18 02:12:22'),
(27, 1, 'Produto #19 atualizado', 'produtos', '2026-06-18 02:18:06'),
(28, 1, 'Produto #18 atualizado', 'produtos', '2026-06-18 02:23:53'),
(29, 1, 'Produto #17 atualizado', 'produtos', '2026-06-18 02:29:36'),
(30, 1, 'Produto #16 atualizado', 'produtos', '2026-06-18 02:36:16'),
(31, 1, 'Produto #15 atualizado', 'produtos', '2026-06-18 02:43:45'),
(32, 1, 'Produto #14 atualizado', 'produtos', '2026-06-18 02:51:43'),
(33, 1, 'Produto #16 atualizado', 'produtos', '2026-06-18 03:36:56'),
(34, 1, 'Produto #38 atualizado', 'produtos', '2026-06-18 03:53:23'),
(35, 1, 'Produto #39 atualizado', 'produtos', '2026-06-18 03:53:45'),
(36, 1, 'Produto #40 atualizado', 'produtos', '2026-06-18 03:54:04'),
(37, 1, 'Produto #41 atualizado', 'produtos', '2026-06-18 03:54:39'),
(38, 1, 'Produto #42 atualizado', 'produtos', '2026-06-18 03:55:01'),
(39, 1, 'Produto #43 atualizado', 'produtos', '2026-06-18 03:55:26'),
(40, 1, 'Produto #44 atualizado', 'produtos', '2026-06-18 03:55:43'),
(41, 1, 'Produto #45 atualizado', 'produtos', '2026-06-18 03:56:05'),
(42, 1, 'Sincronizados 0 SKUs', 'itens_estoque', '2026-06-18 04:00:14'),
(43, 1, 'Produto #3 atualizado', 'produtos', '2026-06-18 04:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_locacao` int(10) UNSIGNED NOT NULL,
  `gateway_id` varchar(100) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `metodo` enum('cartao','pix') DEFAULT NULL,
  `status` enum('sucesso','falha','estornado') DEFAULT NULL,
  `data_transacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `foto_url` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `id_nivel_acesso` int(10) UNSIGNED NOT NULL,
  `status` enum('ativo','inativo','bloqueado') DEFAULT 'ativo',
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `uuid`, `nome`, `email`, `senha_hash`, `foto_url`, `cpf`, `id_nivel_acesso`, `status`, `data_criacao`) VALUES
(1, NULL, 'Administrador', 'admin@arqon.com', '$2y$10$8E3LEYhssx7A8nSxOIEo6OtNdlW5MOfbb3v0GuJfiDBWsZQNynBZ2', NULL, NULL, 4, 'ativo', '2026-06-17 01:42:16'),
(2, NULL, 'Usuario Teste', 'teste@arqon.com', '$2y$10$LIvsP5HyTNi1XUwSYLmYzu23EPrNUtOLl12jZs3yyyJXPsyw9Xf5m', NULL, NULL, 1, 'ativo', '2026-06-17 01:42:16'),
(3, NULL, 'Manager', 'manager@arqon.com', '$2y$10$JzWTDShM81VfcsRdMafJweO7JnVOT5d8Djgy98nKX.VCNR9Jn6r66', NULL, NULL, 2, 'ativo', '2026-06-17 01:42:16'),
(4, NULL, 'VIP Member', 'vip@arqon.com', '$2y$10$xARFe07VIGvVlpf64c5kd.pjo1Uo1/c0Qff49JVfnY.mxq8SFLT/i', NULL, NULL, 3, 'ativo', '2026-06-17 01:42:16'),
(5, NULL, 'Vendor Ricardo', 'ricardo@arqon.com', '$2y$10$gtdHvyyITIqTC6OsPtmcy.FLGmQijyDhA4iC7rHOvDNXYj50aZsCG', NULL, NULL, 5, 'ativo', '2026-06-17 01:42:16'),
(6, NULL, 'Usuario Normal', 'user@arqon.com', '$2y$10$kH2.U6oyLHEDbDY1utfpPuWACHKi/nsPi4JXyJomeGr6EfUYfYK2C', NULL, NULL, 1, 'ativo', '2026-06-17 01:42:16'),
(7, NULL, 'Breno José Pinto', 'breno.emailsenai@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$cDZNT3BHQ3daUS4zb3RMRg$Np1IinYX4ZNbK6D1ExLXjygnSV6EWtj88NR5jStVNVE', '/public/uploads/avatars/9848aa34b70f03264d66f3ec831324be.jpg', NULL, 1, 'ativo', '2026-06-18 03:57:13'),
(8, NULL, 'Breno J. Oliveira', 'breno@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$RGQ1MGVud2hkTEM4NUR5VA$vHa8iyVodswbnOe8kXzY2HtVGeOu+lXjdYPbNFzZs98', 'assets/images/default-avatar.png', NULL, 1, 'ativo', '2026-06-18 12:04:00'),
(9, NULL, 'Enzo Avanze', 'eavanze09@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$dndvZHY5eU1nMkhlTXFqcg$I/IJcPYgnZqhLS3IOZc5muG1DGr1tIaXZCK9CO6OyeI', '/public/uploads/avatars/b7cc9d970e2c0b169f386ca0d16c71fc.jpg', NULL, 1, 'ativo', '2026-06-18 12:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_enderecos`
--

CREATE TABLE `usuarios_enderecos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) DEFAULT 'Casa',
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `padrao_entrega` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `usuarios_enderecos`
--

INSERT INTO `usuarios_enderecos` (`id`, `id_usuario`, `titulo`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `padrao_entrega`) VALUES
(1, 7, 'Casa', '09271242', 'Rua Joaquim Carlos de Lima', '666', 'Parque Erasmo Assunção', 'Santo André', 0),
(2, 8, 'Endereço de Entrega', '09271242', 'Rua Joaquim Carlos de Lima', '222', 'Parque Erasmo Assunção', 'Santo André', 1),
(3, 9, 'Endereço de Entrega', '03260000', 'Avenida Casa Grande', '217', 'Vila Cunha Bueno', 'São Paulo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `id_usuario`, `id_produto`) VALUES
(1, 7, 43),
(2, 7, 17),
(3, 8, 20),
(4, 8, 18),
(5, 8, 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrinho_temp`
--
ALTER TABLE `carrinho_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_user` (`id_usuario`),
  ADD KEY `fk_cart_prod` (`id_produto`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `celebridades`
--
ALTER TABLE `celebridades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `celebridade_produtos`
--
ALTER TABLE `celebridade_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cp_celeb` (`id_celebridade`),
  ADD KEY `fk_cp_prod` (`id_produto`);

--
-- Indexes for table `colecao_produtos`
--
ALTER TABLE `colecao_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_colp_colecao` (`id_colecao`),
  ADD KEY `fk_colp_prod` (`id_produto`);

--
-- Indexes for table `colecoes`
--
ALTER TABLE `colecoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuracoes_sistema`
--
ALTER TABLE `configuracoes_sistema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chave` (`chave`);

--
-- Indexes for table `configuracoes_tema`
--
ALTER TABLE `configuracoes_tema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chave` (`chave`);

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cores`
--
ALTER TABLE `cores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_cupom_prod` (`id_produto`),
  ADD KEY `fk_cupom_user` (`id_usuario`);

--
-- Indexes for table `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ent_loc` (`id_locacao`);

--
-- Indexes for table `estilos`
--
ALTER TABLE `estilos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `fidelidade`
--
ALTER TABLE `fidelidade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `fk_fornecedor_user` (`id_usuario`);

--
-- Indexes for table `itens_estoque`
--
ALTER TABLE `itens_estoque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rfid_nfc_tag` (`rfid_nfc_tag`),
  ADD KEY `fk_item_prod` (`id_produto`),
  ADD KEY `fk_item_cor` (`id_cor`);

--
-- Indexes for table `jwt_blacklist`
--
ALTER TABLE `jwt_blacklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_hash` (`token_hash`),
  ADD KEY `idx_jwt_hash` (`token_hash`),
  ADD KEY `idx_jwt_expires` (`expires_at`);

--
-- Indexes for table `locacoes`
--
ALTER TABLE `locacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_loc_user` (`id_usuario`),
  ADD KEY `fk_loc_item` (`id_item_estoque`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_la_email` (`email`),
  ADD KEY `idx_la_ip` (`ip_address`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_not_user` (`id_usuario`),
  ADD KEY `idx_not_lida` (`lida`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reset_email` (`email`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `fk_prod_marca` (`id_marca`),
  ADD KEY `fk_prod_cat` (`id_categoria`),
  ADD KEY `fk_prod_estilo` (`id_estilo`),
  ADD KEY `fk_prod_fornecedor` (`id_fornecedor`);

--
-- Indexes for table `produto_midias`
--
ALTER TABLE `produto_midias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_midia_prod` (`id_produto`);

--
-- Indexes for table `sistema_logs`
--
ALTER TABLE `sistema_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trans_loc` (`id_locacao`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_user_nivel` (`id_nivel_acesso`);

--
-- Indexes for table `usuarios_enderecos`
--
ALTER TABLE `usuarios_enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_end_user` (`id_usuario`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wish_user` (`id_usuario`),
  ADD KEY `fk_wish_prod` (`id_produto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrinho_temp`
--
ALTER TABLE `carrinho_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `celebridades`
--
ALTER TABLE `celebridades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `celebridade_produtos`
--
ALTER TABLE `celebridade_produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colecao_produtos`
--
ALTER TABLE `colecao_produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colecoes`
--
ALTER TABLE `colecoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `configuracoes_sistema`
--
ALTER TABLE `configuracoes_sistema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuracoes_tema`
--
ALTER TABLE `configuracoes_tema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cores`
--
ALTER TABLE `cores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estilos`
--
ALTER TABLE `estilos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fidelidade`
--
ALTER TABLE `fidelidade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `itens_estoque`
--
ALTER TABLE `itens_estoque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `jwt_blacklist`
--
ALTER TABLE `jwt_blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locacoes`
--
ALTER TABLE `locacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_webhooks`
--
ALTER TABLE `logs_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lookbooks_ia`
--
ALTER TABLE `lookbooks_ia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `niveis_acesso`
--
ALTER TABLE `niveis_acesso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `produto_midias`
--
ALTER TABLE `produto_midias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sistema_logs`
--
ALTER TABLE `sistema_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuarios_enderecos`
--
ALTER TABLE `usuarios_enderecos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrinho_temp`
--
ALTER TABLE `carrinho_temp`
  ADD CONSTRAINT `fk_cart_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `celebridade_produtos`
--
ALTER TABLE `celebridade_produtos`
  ADD CONSTRAINT `fk_cp_celeb` FOREIGN KEY (`id_celebridade`) REFERENCES `celebridades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cp_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `colecao_produtos`
--
ALTER TABLE `colecao_produtos`
  ADD CONSTRAINT `fk_colp_colecao` FOREIGN KEY (`id_colecao`) REFERENCES `colecoes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_colp_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cupons`
--
ALTER TABLE `cupons`
  ADD CONSTRAINT `fk_cupom_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `fk_cupom_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `fk_ent_loc` FOREIGN KEY (`id_locacao`) REFERENCES `locacoes` (`id`);

--
-- Constraints for table `fidelidade`
--
ALTER TABLE `fidelidade`
  ADD CONSTRAINT `fk_fid_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fk_fornecedor_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `itens_estoque`
--
ALTER TABLE `itens_estoque`
  ADD CONSTRAINT `fk_item_cor` FOREIGN KEY (`id_cor`) REFERENCES `cores` (`id`),
  ADD CONSTRAINT `fk_item_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locacoes`
--
ALTER TABLE `locacoes`
  ADD CONSTRAINT `fk_loc_item` FOREIGN KEY (`id_item_estoque`) REFERENCES `itens_estoque` (`id`),
  ADD CONSTRAINT `fk_loc_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_prod_cat` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_prod_estilo` FOREIGN KEY (`id_estilo`) REFERENCES `estilos` (`id`),
  ADD CONSTRAINT `fk_prod_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prod_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`);

--
-- Constraints for table `produto_midias`
--
ALTER TABLE `produto_midias`
  ADD CONSTRAINT `fk_midia_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_trans_loc` FOREIGN KEY (`id_locacao`) REFERENCES `locacoes` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_user_nivel` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `niveis_acesso` (`id`);

--
-- Constraints for table `usuarios_enderecos`
--
ALTER TABLE `usuarios_enderecos`
  ADD CONSTRAINT `fk_end_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wish_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `fk_wish_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
