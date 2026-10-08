-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/10/2026 às 20:06
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
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nivel_acesso` enum('geral','produto','pedido') NOT NULL DEFAULT 'geral'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL CHECK (`nota` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `data_avaliacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Ação', 'Jogos com combates, desafios e momentos de aventura.', 1),
(2, 'Aventura', 'Jogos focados em exploração, descobertas e desafios.', 1),
(3, 'RPG', 'Jogos com evolução de personagens, histórias e exploração.', 1),
(4, 'Terror', 'Jogos que apresentam situações assustadoras e de suspense.', 1),
(5, 'Estratégia', 'Jogos que exigem planejamento e tomada de decisões.', 1),
(6, 'Esportes', 'Jogos baseados em diferentes modalidades esportivas.', 1),
(7, 'Indie', 'Jogos desenvolvidos principalmente por estúdios independentes.', 1),
(8, 'Simulação', 'Jogos que simulam atividades, profissões ou situações do cotidiano.', 1),
(9, 'Luta', 'Jogos baseados em combates entre personagens.', 1),
(10, 'Corrida', 'Jogos focados em corridas e competições com veículos.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_item_pedido` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_carrinho`
--

CREATE TABLE `itens_carrinho` (
  `id_item_carrinho` int(11) NOT NULL,
  `id_carrinho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  `data_adicionado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `STATUS` enum('aguardando_pagamento','pago','cancelado') NOT NULL DEFAULT 'aguardando_pagamento',
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Minecraft: Java & Bedrock Edition', 'Explore mundos infinitos onde sua única limitação é a imaginação. Construa seu próprio lar, enfrente criaturas perigosas, descubra cavernas e transforme simples blocos em verdadeiras aventuras.', 99.00, NULL, 'pendente', '2026-09-25 23:41:47', 1, NULL, 0),
(2, 'Sally Face', 'Entre em uma cidade cheia de mistérios ao lado de Sal Fisher, um garoto de rosto azul e passado enigmático. Investigue acontecimentos estranhos, descubra segredos sombrios e desvende uma história onde nada é exatamente o que parece.', 48.98, NULL, 'pendente', '2026-09-26 00:17:52', 1, NULL, 0),
(3, 'Terraria', 'Um mundo inteiro espera para ser explorado, construído e enfrentado. Cave profundamente, encontre tesouros, crie equipamentos poderosos e enfrente criaturas cada vez mais perigosas em uma aventura onde cada jornada é diferente.', 32.99, NULL, 'pendente', '2026-09-26 00:19:00', 1, NULL, 0),
(4, 'GTA V', 'Bem-vindo a Los Santos, uma cidade onde dinheiro, velocidade e perigo andam lado a lado. Alterne entre três criminosos com histórias diferentes, participe de grandes golpes e explore um mundo aberto onde o caos nunca está muito longe.', 149.99, NULL, 'pendente', '2026-09-26 00:20:42', 1, NULL, 0),
(5, 'The Sims 4', 'Crie personagens, construa a casa dos seus sonhos e controle cada capítulo da vida dos seus Sims. Faça amizades, construa carreiras, forme famílias ou simplesmente veja até onde suas escolhas podem levar.', 7.50, NULL, 'pendente', '2026-09-26 00:22:13', 1, NULL, 0),
(6, 'Hollow Knight', 'Desça às profundezas de Hallownest, um reino esquecido tomado por criaturas misteriosas e perigosas. Domine sua lâmina, descubra caminhos secretos e enfrente inimigos em uma jornada silenciosa repleta de desafios e descobertas.', 46.99, NULL, 'pendente', '2026-09-26 00:23:54', 1, NULL, 0),
(7, 'Stardew Valley', 'Deixe a vida agitada para trás e comece uma nova história em Stardew Valley. Cultive sua fazenda, pesque, explore cavernas, faça amizades e descubra os segredos de uma pequena comunidade cheia de histórias.', 24.99, NULL, 'pendente', '2026-09-26 00:25:30', 1, NULL, 0),
(8, 'Fortnite', 'Entre na batalha, encontre equipamentos e lute para ser o último jogador de pé. Construa estruturas, enfrente adversários e adapte sua estratégia a cada partida em um campo de batalha que está sempre mudando.', 10.00, NULL, 'pendente', '2026-09-26 00:30:00', 1, NULL, 0),
(9, 'Resident Evil Village', 'Em uma vila isolada cercada por mistérios, Ethan Winters embarca em uma busca desesperada por sua filha e acaba descobrindo um pesadelo muito maior do que imaginava. Enfrente criaturas aterrorizantes, explore locais sombrios e desvende os segredos de uma vila dominada por figuras tão perigosas quanto misteriosas.', 169.00, NULL, 'pendente', '2026-09-30 13:39:35', 1, NULL, 0),
(10, 'Mortal Kombat 11', 'Entre em uma nova batalha pelo destino dos reinos em Mortal Kombat 11. Escolha entre uma seleção de lutadores lendários, domine golpes especiais e enfrente adversários em combates intensos, enquanto uma história envolvendo passado, presente e futuro coloca heróis e vilões frente a frente.', 229.00, NULL, 'pendente', '2026-09-30 14:02:09', 1, NULL, 0),
(11, 'Cyberpunk 2077', 'Mergulhe em Night City, uma metrópole futurista dominada por megacorporações, tecnologia e ambição. Assuma o papel de V, um mercenário em busca de um implante capaz de garantir a imortalidade. Faça escolhas, enfrente inimigos e descubra uma cidade onde cada oportunidade pode esconder um novo perigo.', 199.00, NULL, 'pendente', '2026-09-30 14:08:13', 1, NULL, 0),
(12, 'League of Legends', 'Escolha seu campeão, forme sua equipe e entre em uma batalha estratégica pela vitória. Domine habilidades únicas, enfrente adversários em diferentes rotas e trabalhe em equipe para destruir a base inimiga. Em Summoner\'s Rift, cada decisão pode mudar o rumo da partida!', 90.00, NULL, 'pendente', '2026-09-30 14:12:17', 1, NULL, 0),
(13, 'The Last of Us Part I', 'Em um mundo devastado por uma pandemia, Joel recebe a missão de atravessar os Estados Unidos ao lado de Ellie, uma jovem que pode carregar a chave para um futuro diferente. Enfrente perigos, explore cidades abandonadas e descubra uma jornada marcada por sobrevivência, escolhas difíceis e uma relação que muda tudo.', 249.00, NULL, 'pendente', '2026-09-30 14:19:06', 1, NULL, 0),
(14, 'The Last of Us Part 2', 'Anos após os acontecimentos de sua primeira jornada, Ellie vive em um mundo ainda marcado pela violência e pela sobrevivência. Quando um acontecimento inesperado muda sua vida, ela parte em uma busca por respostas e justiça. Explore cidades devastadas, enfrente diferentes grupos e descubra uma história sobre escolhas, perdas e as consequências de cada caminho.', 200.00, NULL, 'pendente', '2026-09-30 14:26:00', 1, NULL, 0),
(15, 'Hogwarts Legacy', 'Descubra a magia de Hogwarts em uma aventura ambientada no mundo bruxo do século XIX. Crie seu próprio estudante, aprenda feitiços, prepare poções, explore o castelo e seus arredores e desvende um antigo segredo que pode mudar o destino do mundo mágico.', 249.00, NULL, 'pendente', '2026-09-30 14:32:38', 1, NULL, 0);

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
(2, 7),
(3, 2),
(3, 3),
(3, 7),
(4, 1),
(4, 2),
(4, 10),
(5, 5),
(5, 8),
(6, 1),
(6, 2),
(6, 3),
(6, 7),
(7, 3),
(7, 7),
(7, 8),
(8, 1),
(8, 5),
(9, 1),
(9, 4),
(10, 9),
(11, 1),
(11, 3),
(12, 1),
(12, 5),
(13, 1),
(13, 2),
(13, 4),
(14, 1),
(14, 2),
(14, 4),
(15, 1),
(15, 2),
(15, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD UNIQUE KEY `id_cliente` (`id_cliente`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD UNIQUE KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`),
  ADD UNIQUE KEY `cpf` (`cpf`);

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
  ADD KEY `id_carrinho` (`id_carrinho`),
  ADD KEY `id_produto` (`id_produto`);

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
  ADD KEY `id_cliente` (`id_cliente`);

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
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  MODIFY `id_item_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;

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
