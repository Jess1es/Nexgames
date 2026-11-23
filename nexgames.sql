-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2026 às 05:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nexgames`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `cliente_cpf` char(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL,
  `comentario` text DEFAULT NULL,
  `data_avaliacao` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Despejando dados para a tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id_avaliacao`, `cliente_cpf`, `id_produto`, `nota`, `comentario`, `data_avaliacao`) VALUES
(1, '12345678966', 1, 5, 'legal veyr', '2026-11-20 23:40:12'),
(2, '12345678913', 21, 5, 'o melhor do mundo', '2026-11-21 15:16:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `cliente_cpf` char(11) NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `cliente_cpf`, `data_criacao`) VALUES
(2, '12345678966', '2026-11-18 16:13:47'),
(3, '12345678910', '2026-11-20 21:58:19'),
(4, '12345678913', '2026-11-21 14:12:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Ação', 'Prepare-se para experiências intensas, combates eletrizantes e desafios que exigem reflexos rápidos e muita habilidade.', 1),
(2, 'Aventura', 'Explore mundos incríveis, descubra segredos e embarque em jornadas repletas de desafios, mistérios e descobertas.', 1),
(3, 'RPG', 'Crie sua própria jornada, evolua personagens, conquiste habilidades e tome decisões que podem transformar sua história.', 1),
(4, 'Terror', 'Entre em cenários sombrios, enfrente seus maiores medos e descubra histórias capazes de arrepiar até os jogadores mais corajosos.', 1),
(5, 'Indie', 'Conheça jogos independentes que surpreendem pela criatividade, originalidade e experiências únicas.', 1),
(6, 'Simulação', 'Experimente diferentes realidades, administre situações e construa experiências que vão do cotidiano à imaginação.', 1),
(7, 'Sandbox', 'Sua criatividade não tem limites! Construa, explore e transforme mundos do seu próprio jeito, sem seguir apenas um caminho', 1),
(8, 'Sobrevivência', 'Enfrente ambientes hostis, administre recursos e faça o possível para continuar vivo diante de desafios imprevisíveis.', 1),
(9, 'Mundo Aberto', 'Explore mapas imensos, descubra lugares escondidos e escolha livremente como viver suas aventuras.', 1),
(10, 'Luta', 'Domine técnicas, escolha seus combatentes e prove suas habilidades em batalhas cheias de estratégia e adrenalina', 1),
(11, 'Multiplayer', 'Chame seus amigos, forme equipes ou enfrente outros jogadores em experiências compartilhadas e competitivas.', 1),
(12, 'Estratégia', 'Planeje cada movimento, tome decisões inteligentes e use suas habilidades para superar desafios e conquistar a vitória.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_site`
--

CREATE TABLE `cliente_site` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente_site`
--

INSERT INTO `cliente_site` (`cpf`, `nome`, `email`, `senha_hash`, `telefone`, `criado_em`) VALUES
('12345678910', 'thiago', 'thiago@gmail.com', '$2y$10$C4hpF3slo5aKCcvURN3R1u6qzJ85fM1vqbucKSNys2IskZFOq/75G', '11123456789', '2026-11-20 21:58:03'),
('12345678913', 'ana', 'ana@gmail.com', '$2y$10$D5ADogp/AsYA8LZI8adJp.hztsa5M.QdqbPhYFXrm9WsGmDVgh2Oi', '2112345678', '2026-11-21 14:11:48'),
('12345678966', 'ian', 'ian@gmail.com', '$2y$10$iOxeTDNLMzwi7DVjIEJKzOiBvAepJ41FpNx702pD.S4FdFr4D4k3W', '11123456789', '2026-11-18 15:45:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada_jogos`
--

CREATE TABLE `entrada_jogos` (
  `id_entrada_mercadoria` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` enum('rascunho','confirmada') NOT NULL DEFAULT 'rascunho',
  `valor_total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entrada_jogos`
--

INSERT INTO `entrada_jogos` (`id_entrada_mercadoria`, `fornecedor_id`, `data`, `status`, `valor_total`) VALUES
(1, 1, '2026-11-22', 'confirmada', 1554.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome`, `cnpj`, `telefone`, `email`, `ativo`) VALUES
(1, 'Nex Digital Distribuidora', '123456789', '11123456789', 'contato@nexdigital.example', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_entrada_jogos`
--

CREATE TABLE `item_entrada_jogos` (
  `id_item_entrada` int(11) NOT NULL,
  `id_entrada_mercadoria` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  `valor_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `item_entrada_jogos`
--

INSERT INTO `item_entrada_jogos` (`id_item_entrada`, `id_entrada_mercadoria`, `id_produto`, `quantidade`, `valor_unitario`, `subtotal`) VALUES
(1, 1, 13, 2, 777.00, 1554.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_item_pedido` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_item_pedido`, `id_pedido`, `id_produto`, `preco_unitario`, `subtotal`) VALUES
(2, 2, 11, 199.00, 199.00),
(3, 3, 14, 200.00, 200.00),
(4, 3, 8, 10.00, 10.00),
(5, 4, 1, 10.00, 10.00),
(6, 5, 1, 10.00, 10.00),
(7, 6, 6, 46.99, 46.99),
(8, 7, 10, 229.00, 229.00),
(9, 8, 12, 90.00, 90.00),
(10, 9, 14, 200.00, 200.00),
(11, 10, 15, 249.00, 249.00),
(12, 11, 21, 229.00, 229.00),
(13, 12, 20, 75.99, 75.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_carrinho`
--

CREATE TABLE `itens_carrinho` (
  `id_item_carrinho` int(11) NOT NULL,
  `id_carrinho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `data_adicionado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `metodo_pagamento`
--

CREATE TABLE `metodo_pagamento` (
  `id_metodo` int(11) NOT NULL,
  `cliente_cpf` char(11) NOT NULL,
  `tipo` enum('credito','debito','pix') NOT NULL,
  `identificacao` varchar(100) NOT NULL,
  `ultimos_digitos` char(4) DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `metodo_pagamento`
--

INSERT INTO `metodo_pagamento` (`id_metodo`, `cliente_cpf`, `tipo`, `identificacao`, `ultimos_digitos`, `criado_em`) VALUES
(7, '12345678966', 'credito', 'ian', '5678', '2026-11-20 17:14:14'),
(8, '12345678966', 'pix', 'Pix', NULL, '2026-11-20 17:53:29'),
(9, '12345678910', 'pix', 'Pix', NULL, '2026-11-20 21:59:21'),
(10, '12345678913', 'credito', 'ana', '4321', '2026-11-21 14:13:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota_fiscal_venda`
--

CREATE TABLE `nota_fiscal_venda` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `serie` varchar(5) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `nota_fiscal_venda`
--

INSERT INTO `nota_fiscal_venda` (`id`, `id_pedido`, `serie`, `numero`, `data_emissao`, `valor_total`) VALUES
(2, 2, '1', '1', '2026-11-18', 199.00),
(3, 3, '1', '2', '2026-11-20', 210.00),
(4, 4, '1', '3', '2026-11-20', 10.00),
(5, 6, '1', '4', '2026-11-20', 46.99),
(6, 7, '1', '5', '2026-11-20', 229.00),
(7, 8, '1', '6', '2026-11-20', 90.00),
(8, 9, '1', '7', '2026-11-20', 200.00),
(9, 10, '1', '8', '2026-11-20', 249.00),
(10, 11, '1', '9', '2026-11-21', 229.00),
(11, 12, '1', '10', '2026-11-22', 75.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `data_pagamento` datetime DEFAULT current_timestamp(),
  `forma_pagamento` enum('cartao','pix','boleto','outro') DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` enum('aprovado','pendente','cancelado') NOT NULL DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_pedido`, `data_pagamento`, `forma_pagamento`, `valor`, `status`) VALUES
(2, 2, '2026-11-18 16:44:06', 'cartao', 199.00, 'aprovado'),
(3, 3, '2026-11-20 14:37:29', 'pix', 210.00, 'aprovado'),
(4, 4, '2026-11-20 17:14:22', 'cartao', 10.00, 'aprovado'),
(5, 5, '2026-11-20 17:19:02', 'cartao', 10.00, 'pendente'),
(6, 6, '2026-11-20 17:45:54', 'cartao', 46.99, 'aprovado'),
(7, 7, '2026-11-20 17:48:07', 'cartao', 229.00, 'aprovado'),
(8, 8, '2026-11-20 17:53:29', 'pix', 90.00, 'aprovado'),
(9, 9, '2026-11-20 21:59:21', 'pix', 200.00, 'aprovado'),
(10, 10, '2026-11-20 23:34:12', 'cartao', 249.00, 'aprovado'),
(11, 11, '2026-11-21 14:13:09', 'cartao', 229.00, 'aprovado'),
(12, 12, '2026-11-22 00:08:35', 'pix', 75.99, 'aprovado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `cliente_cpf` char(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `STATUS` enum('aguardando_pagamento','pago','cancelado') NOT NULL DEFAULT 'aguardando_pagamento',
  `valor_total` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('pix','cartao') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `cliente_cpf`, `data`, `STATUS`, `valor_total`, `forma_pagamento`) VALUES
(2, '12345678966', '2026-11-18 16:44:06', 'pago', 199.00, 'cartao'),
(3, '12345678966', '2026-11-20 14:37:29', 'pago', 210.00, 'pix'),
(4, '12345678966', '2026-11-20 17:14:14', 'pago', 10.00, 'cartao'),
(5, '12345678966', '2026-11-20 17:19:02', 'aguardando_pagamento', 10.00, 'cartao'),
(6, '12345678966', '2026-11-20 17:45:54', 'pago', 46.99, 'cartao'),
(7, '12345678966', '2026-11-20 17:48:07', 'pago', 229.00, 'cartao'),
(8, '12345678966', '2026-11-20 17:53:29', 'pago', 90.00, 'pix'),
(9, '12345678910', '2026-11-20 21:59:21', 'pago', 200.00, 'pix'),
(10, '12345678966', '2026-11-20 23:34:12', 'pago', 249.00, 'cartao'),
(11, '12345678913', '2026-11-21 14:13:09', 'pago', 229.00, 'cartao'),
(12, '12345678966', '2026-11-22 00:08:35', 'pago', 75.99, 'pix');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `arquivo_download` varchar(255) NOT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp(),
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `preco_promocional` decimal(10,2) DEFAULT NULL,
  `em_oferta` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `descricao`, `preco`, `imagem`, `arquivo_download`, `data_cadastro`, `ativo`, `preco_promocional`, `em_oferta`) VALUES
(1, 'Minecraft: Java & Bedrock Edition', 'Explore mundos infinitos onde sua única limitação é a imaginação. Construa seu próprio lar, enfrente criaturas perigosas, descubra cavernas e transforme simples blocos em verdadeiras aventuras.', 99.00, 'public/uploads/produtos/1.jpg', 'pendente', '2026-09-25 23:41:47', 1, 50.00, 1),
(2, 'Sally Face', 'Entre em uma cidade cheia de mistérios ao lado de Sal Fisher, um garoto de rosto azul e passado enigmático. Investigue acontecimentos estranhos, descubra segredos sombrios e desvende uma história onde nada é exatamente o que parece.', 48.98, 'public/uploads/produtos/2.jpg', 'pendente', '2026-09-26 00:17:52', 1, NULL, 0),
(3, 'Terraria', 'Um mundo inteiro espera para ser explorado, construído e enfrentado. Cave profundamente, encontre tesouros, crie equipamentos poderosos e enfrente criaturas cada vez mais perigosas em uma aventura onde cada jornada é diferente.', 32.99, 'public/uploads/produtos/3.jpg', 'pendente', '2026-09-26 00:19:00', 1, NULL, 0),
(4, 'GTA V', 'Bem-vindo a Los Santos, uma cidade onde dinheiro, velocidade e perigo andam lado a lado. Alterne entre três criminosos com histórias diferentes, participe de grandes golpes e explore um mundo aberto onde o caos nunca está muito longe.', 149.99, 'public/uploads/produtos/4.jpg', 'pendente', '2026-09-26 00:20:42', 1, NULL, 0),
(5, 'The Sims 4', 'Crie personagens, construa a casa dos seus sonhos e controle cada capítulo da vida dos seus Sims. Faça amizades, construa carreiras, forme famílias ou simplesmente veja até onde suas escolhas podem levar.', 7.50, 'public/uploads/produtos/5.jpg', 'pendente', '2026-09-26 00:22:13', 1, NULL, 0),
(6, 'Hollow Knight', 'Desça às profundezas de Hallownest, um reino esquecido tomado por criaturas misteriosas e perigosas. Domine sua lâmina, descubra caminhos secretos e enfrente inimigos em uma jornada silenciosa repleta de desafios e descobertas.', 46.99, 'public/uploads/produtos/6.jpg', 'pendente', '2026-09-26 00:23:54', 1, NULL, 0),
(7, 'Stardew Valley', 'Deixe a vida agitada para trás e comece uma nova história em Stardew Valley. Cultive sua fazenda, pesque, explore cavernas, faça amizades e descubra os segredos de uma pequena comunidade cheia de histórias.', 24.99, 'public/uploads/produtos/7.jpg', 'pendente', '2026-09-26 00:25:30', 1, NULL, 0),
(8, 'Fortnite', 'Entre na batalha, encontre equipamentos e lute para ser o último jogador de pé. Construa estruturas, enfrente adversários e adapte sua estratégia a cada partida em um campo de batalha que está sempre mudando.', 10.00, 'public/uploads/produtos/8.jpg', 'pendente', '2026-09-26 00:30:00', 1, NULL, 0),
(9, 'Resident Evil Village', 'Em uma vila isolada cercada por mistérios, Ethan Winters embarca em uma busca desesperada por sua filha e acaba descobrindo um pesadelo muito maior do que imaginava. Enfrente criaturas aterrorizantes, explore locais sombrios e desvende os segredos de uma vila dominada por figuras tão perigosas quanto misteriosas.', 169.00, 'public/uploads/produtos/9.jpg', 'pendente', '2026-09-30 13:39:35', 1, NULL, 0),
(10, 'Mortal Kombat 11', 'Entre em uma nova batalha pelo destino dos reinos em Mortal Kombat 11. Escolha entre uma seleção de lutadores lendários, domine golpes especiais e enfrente adversários em combates intensos, enquanto uma história envolvendo passado, presente e futuro coloca heróis e vilões frente a frente.', 229.00, 'public/uploads/produtos/10.jpg', 'pendente', '2026-09-30 14:02:09', 1, NULL, 0),
(11, 'Cyberpunk 2077', 'Mergulhe em Night City, uma metrópole futurista dominada por megacorporações, tecnologia e ambição. Assuma o papel de V, um mercenário em busca de um implante capaz de garantir a imortalidade. Faça escolhas, enfrente inimigos e descubra uma cidade onde cada oportunidade pode esconder um novo perigo.', 199.00, 'public/uploads/produtos/11.jpg', 'pendente', '2026-09-30 14:08:13', 1, NULL, 0),
(12, 'League of Legends', 'Escolha seu campeão, forme sua equipe e entre em uma batalha estratégica pela vitória. Domine habilidades únicas, enfrente adversários em diferentes rotas e trabalhe em equipe para destruir a base inimiga. Em Summoner\'s Rift, cada decisão pode mudar o rumo da partida!', 90.00, 'public/uploads/produtos/12.jpg', 'pendente', '2026-09-30 14:12:17', 1, NULL, 0),
(13, 'The Last of Us Part I', 'Em um mundo devastado por uma pandemia, Joel recebe a missão de atravessar os Estados Unidos ao lado de Ellie, uma jovem que pode carregar a chave para um futuro diferente. Enfrente perigos, explore cidades abandonadas e descubra uma jornada marcada por sobrevivência, escolhas difíceis e uma relação que muda tudo.', 249.00, 'public/uploads/produtos/13.jpg', 'pendente', '2026-09-30 14:19:06', 1, NULL, 0),
(14, 'The Last of Us Part 2', 'Anos após os acontecimentos de sua primeira jornada, Ellie vive em um mundo ainda marcado pela violência e pela sobrevivência. Quando um acontecimento inesperado muda sua vida, ela parte em uma busca por respostas e justiça. Explore cidades devastadas, enfrente diferentes grupos e descubra uma história sobre escolhas, perdas e as consequências de cada caminho.', 200.00, 'public/uploads/produtos/14.jpg', 'pendente', '2026-09-30 14:26:00', 1, 179.00, 1),
(15, 'Hogwarts Legacy', 'Descubra a magia de Hogwarts em uma aventura ambientada no mundo bruxo do século XIX. Crie seu próprio estudante, aprenda feitiços, prepare poções, explore o castelo e seus arredores e desvende um antigo segredo que pode mudar o destino do mundo mágico.', 249.00, 'public/uploads/produtos/15.jpg', 'pendente', '2026-09-30 14:32:38', 1, NULL, 0),
(19, 'GTA VI', 'Explore o vibrante mundo de Leonida e mergulhe em uma aventura de ação e mundo aberto, repleta de adrenalina, crimes e reviravoltas. Acompanhe a história de Jason e Lucia enquanto enfrentam desafios, perigos e situações inesperadas em Vice City e seus arredores. Com cenários impressionantes, personagens marcantes e inúmeras possibilidades de exploração, GTA VI promete uma experiência cheia de emoção e liberdade.', 550.00, 'public/uploads/produtos/19.jpg', 'pendente', '2026-11-21 00:31:14', 1, 450.00, 1),
(20, 'five nights at freddy\'s', 'Prepare-se para enfrentar cinco noites assustadoras na Freddy Fazbear\'s Pizza, uma pizzaria onde os animatrônicos ganham vida durante a noite. No papel de um segurança noturno, você deverá monitorar as câmeras, controlar a energia e sobreviver até o amanhecer. Com uma atmosfera sombria, sustos inesperados e muitos mistérios, Five Nights at Freddy\'s oferece uma experiência de terror e suspense que coloca seus nervos à prova.', 75.99, 'public/uploads/produtos/20.jpg', 'pendente', '2026-11-21 00:34:46', 1, NULL, 0),
(21, 'naruto storm', 'Entre no universo ninja de Naruto e reviva momentos marcantes do anime em batalhas cheias de ação! Explore a Vila Oculta da Folha, enfrente adversários poderosos e domine técnicas especiais com seus personagens favoritos. Com combates dinâmicos, habilidades impressionantes e cenários inspirados no mundo de Naruto, Ultimate Ninja Storm oferece uma aventura emocionante para quem sonha em se tornar um grande ninja.', 229.00, 'public/uploads/produtos/21.jpg', 'pendente', '2026-11-21 00:38:22', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `id_produto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto_categoria`
--

INSERT INTO `produto_categoria` (`id_produto`, `id_categoria`) VALUES
(1, 2),
(1, 7),
(1, 8),
(2, 2),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(3, 7),
(4, 1),
(4, 2),
(4, 9),
(5, 6),
(5, 7),
(6, 1),
(6, 5),
(7, 3),
(7, 5),
(7, 6),
(8, 1),
(8, 11),
(9, 1),
(9, 4),
(9, 8),
(10, 1),
(10, 10),
(10, 11),
(11, 1),
(11, 3),
(11, 9),
(12, 11),
(12, 12),
(13, 1),
(13, 2),
(13, 8),
(14, 1),
(14, 2),
(14, 8),
(15, 2),
(15, 3),
(19, 1),
(19, 2),
(19, 6),
(19, 11),
(20, 4),
(20, 5),
(20, 12),
(21, 1),
(21, 2),
(21, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('admin','cliente') NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `perfil`, `ativo`) VALUES
(3, 'adm', 'admnexgames@gmail.com', '$2y$10$8FWJrXDpN0VjRPO5/B5Tgu0V8h1CmzMqi631wCLVRPflZ4k2.dQsS', 'admin', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD UNIQUE KEY `uk_avaliacao_cliente_produto` (`cliente_cpf`,`id_produto`),
  ADD KEY `fk_avaliacao_produto` (`id_produto`);

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD UNIQUE KEY `id_cliente` (`cliente_cpf`) USING BTREE;

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `cliente_site`
--
ALTER TABLE `cliente_site`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `entrada_jogos`
--
ALTER TABLE `entrada_jogos`
  ADD PRIMARY KEY (`id_entrada_mercadoria`),
  ADD KEY `fornecedor_id` (`fornecedor_id`),
  ADD KEY `data` (`data`),
  ADD KEY `status` (`status`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `item_entrada_jogos`
--
ALTER TABLE `item_entrada_jogos`
  ADD PRIMARY KEY (`id_item_entrada`),
  ADD UNIQUE KEY `uk_entrada_produto` (`id_entrada_mercadoria`,`id_produto`),
  ADD KEY `idx_item_entrada_produto` (`id_produto`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_item_pedido`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  ADD PRIMARY KEY (`id_item_carrinho`),
  ADD UNIQUE KEY `uk_carrinho_produto` (`id_carrinho`,`id_produto`),
  ADD KEY `idx_itens_carrinho_produto` (`id_produto`);

--
-- Índices de tabela `metodo_pagamento`
--
ALTER TABLE `metodo_pagamento`
  ADD PRIMARY KEY (`id_metodo`),
  ADD KEY `fk_metodo_cliente` (`cliente_cpf`);

--
-- Índices de tabela `nota_fiscal_venda`
--
ALTER TABLE `nota_fiscal_venda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_nota_pedido` (`id_pedido`),
  ADD KEY `valor_total` (`valor_total`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`cliente_cpf`) USING BTREE;

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD PRIMARY KEY (`id_produto`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `entrada_jogos`
--
ALTER TABLE `entrada_jogos`
  MODIFY `id_entrada_mercadoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `item_entrada_jogos`
--
ALTER TABLE `item_entrada_jogos`
  MODIFY `id_item_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  MODIFY `id_item_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `metodo_pagamento`
--
ALTER TABLE `metodo_pagamento`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `nota_fiscal_venda`
--
ALTER TABLE `nota_fiscal_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_cliente_site` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente_site` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_avaliacao_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `FK_cliente_cpf` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente_site` (`cpf`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `entrada_jogos`
--
ALTER TABLE `entrada_jogos`
  ADD CONSTRAINT `FK_entrada_fornecedor` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `item_entrada_jogos`
--
ALTER TABLE `item_entrada_jogos`
  ADD CONSTRAINT `fk_item_entrada_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_entrada_registro` FOREIGN KEY (`id_entrada_mercadoria`) REFERENCES `entrada_jogos` (`id_entrada_mercadoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  ADD CONSTRAINT `itens_carrinho_ibfk_1` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`id_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `itens_carrinho_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `metodo_pagamento`
--
ALTER TABLE `metodo_pagamento`
  ADD CONSTRAINT `fk_metodo_cliente` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente_site` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `nota_fiscal_venda`
--
ALTER TABLE `nota_fiscal_venda`
  ADD CONSTRAINT `fk_nota_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente_site` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente_site` (`cpf`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD CONSTRAINT `produto_categoria_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `produto_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
