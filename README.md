# NexGames — Loja Virtual de Jogos Digitais

Projeto de TCC: uma loja virtual especializada em jogos digitais, desenvolvida como sistema web (site + PHP + banco de dados + modelagem UML/DER/MER).

A proposta não é vender jogos reais nem processar pagamentos verdadeiros. O objetivo é simular o funcionamento completo de uma loja digital, para fins acadêmicos. A Nex Games é uma loja fictícia que não possui canal de vendas próprio e precisa de mais controle sobre catálogo, clientes e pedidos.

## Sobre o projeto

O cliente navega pelos jogos organizados por categorias, pesquisa e filtra o catálogo (inclusive jogos em oferta), visualiza os detalhes de cada produto, adiciona jogos ao carrinho, finaliza uma compra simulada, realiza um pagamento simulado, consulta seu histórico de pedidos, avalia os jogos adquiridos e acessa a opção "Baixar Jogo" (download demonstrativo que abre uma imagem PNG representando o jogo).

O sistema possui dois perfis de usuário, modelados como uma especialização de usuario:

- Cliente: cadastra-se, navega, compra, avalia e baixa jogos.
- Administrador: gerencia produtos, categorias, ofertas, usuários e clientes, e consulta os pedidos.

## Tecnologias

- Banco de dados: MySQL / MariaDB (gerenciado via HeidiSQL)
- Backend: PHP
- Frontend: CSS (as páginas são geradas pelo PHP; não será usado JavaScript)
- Modelagem: DER, MER e UML (Diagrama de Casos de Uso)

## Estrutura do banco de dados

O banco é composto por 12 tabelas:

| Tabela | Responsabilidade |
|---|---|
| usuario | Dados gerais de acesso (nome, e-mail, senha) |
| cliente | Especialização de usuário: CPF, telefone |
| administrador | Especialização de usuário: nível de acesso (geral, produto, pedido) |
| categoria | Categorias dos jogos |
| produto | Jogos da loja (preço, descrição, imagem, arquivo de download, oferta) |
| produto_categoria | Associação N:N entre produto e categoria |
| carrinho | Carrinho de compras do cliente |
| itens_carrinho | Jogos dentro de cada carrinho |
| pedido | Compra realizada pelo cliente |
| item_pedido | Jogos pertencentes a cada pedido |
| pagamento | Pagamento simulado de um pedido |
| avaliacao | Avaliação (nota + comentário) de um jogo pelo cliente |

### Relações principais

- Usuario 1:0..1 Cliente e Usuario 1:0..1 Administrador (herança/especialização)
- Cliente 1:1 Carrinho
- Carrinho 1:N Itens_Carrinho e Produto 1:N Itens_Carrinho
- Categoria N:N Produto (via produto_categoria)
- Cliente 1:N Pedido
- Pedido 1:N Item_Pedido e Produto 1:N Item_Pedido
- Pedido 1:0..1 Pagamento
- Cliente 1:N Avaliacao e Produto 1:N Avaliacao

### Exclusão e atualização em cascata

- CASCADE: o registro filho é apagado/atualizado junto com o pai, pois só existe por causa dele (ex.: o carrinho de um cliente, os itens de um carrinho, as avaliações).
- RESTRICT: bloqueia a exclusão do pai enquanto houver filhos vinculados, para preservar o histórico (ex.: um produto já vendido em algum pedido não pode ser apagado).

### Ofertas

A tabela produto possui as colunas em_oferta e preco_promocional. Quando em_oferta = 1, o preço promocional é exibido em destaque em relação ao preco original, que não é alterado. Quando em_oferta = 0, apenas o preço normal é exibido.

## Regras de negócio relevantes

- Um cliente não pode avaliar o mesmo jogo duas vezes. Garantido pelo banco via UNIQUE (id_cliente, id_produto) em avaliacao.
- A nota da avaliação deve ficar entre 1 e 5. Garantido pelo banco via CHECK (nota BETWEEN 1 AND 5). O CHECK só é aplicado a partir do MySQL 8.0.16 / MariaDB 10.2.1; em versões anteriores ele é aceito mas ignorado, então a nota também deve ser validada no PHP.
- Um cliente não pode comprar novamente um jogo já adquirido. Validado em PHP (o banco não possui restrição para isso).
- Só é possível avaliar um jogo após a compra confirmada. Validado em PHP.
- O pagamento é simulado: o status do pedido evolui de aguardando_pagamento para pago (ou cancelado), sem integração com serviços financeiros reais.
- O "download" é simulado: após a confirmação do pagamento, o campo arquivo_download disponibiliza uma imagem PNG representando o jogo.
- Um jogo pode pertencer a mais de uma categoria ao mesmo tempo.

### Sincronização entre pedido e pagamento

pedido.status (aguardando_pagamento, pago, cancelado) e pagamento.status (aprovado, pendente, cancelado) são colunas independentes: o banco não garante que elas estejam coerentes entre si. Por isso, o PHP deve atualizá-las juntas, na mesma operação (de preferência dentro de uma transação), seguindo a correspondência:

| pagamento.status | pedido.status |
|---|---|
| pendente | aguardando_pagamento |
| aprovado | pago |
| cancelado | cancelado |

O botão "Baixar Jogo" só deve ser liberado quando o pedido estiver pago.

### Segurança das senhas

A coluna senha é VARCHAR(255) para armazenar o hash da senha (password_hash() no PHP), nunca a senha em texto puro. A verificação no login deve usar password_verify().

## O que foi retirado do escopo

Por se tratar de produtos digitais, o projeto não trabalha com: estoque físico, fornecedores, entrega física, endereço de entrega, códigos de ativação, arquivos de jogos reais ou pagamento real.

## Status do projeto

Projeto em desenvolvimento em dupla (Ana Clara e Jessica), como requisito de TCC escolar, com intenção de publicação no servidor da instituição de ensino.

Etapa atual (Parte 1): levantamento de requisitos, modelagem (DER, MER e UML) e banco de dados. O código PHP/CSS ainda não foi desenvolvido.
