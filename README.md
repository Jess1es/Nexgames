# NEX Games — Loja Virtual de Jogos Digitais

NEX — Onde sua próxima aventura começa.

Projeto de Trabalho de Conclusão de Curso (TCC), desenvolvido por Ana Clara Santos e Jessica Lacerda, em 2026. A NexGames é uma loja virtual fictícia de jogos digitais, criada para demonstrar o funcionamento de um sistema web de comércio eletrônico, com catálogo, carrinho, pedidos, pagamentos simulados, gerenciamento de fornecedores, entradas de licenças digitais e administração.

## Sumário

1. [Sobre o projeto](#1-sobre-o-projeto)
2. [Funcionalidades](#2-funcionalidades)
3. [Tecnologias e arquitetura](#3-tecnologias-e-arquitetura)
4. [Requisitos e instalação local](#4-requisitos-e-instalação-local)
5. [Estrutura do projeto](#5-estrutura-do-projeto)
6. [Banco de dados](#6-banco-de-dados)
7. [Regras de negócio](#7-regras-de-negócio)
8. [Fluxo de compra](#8-fluxo-de-compra)
9. [Acesso e rotas](#9-acesso-e-rotas)
10. [Segurança](#10-segurança)
11. [Limitações e escopo](#11-limitações-e-escopo)
12. [Status e autoria](#12-status-e-autoria)

## 1. Sobre o projeto

A NexGames simula uma plataforma própria para organizar o catálogo de jogos, os clientes, os fornecedores e os pedidos de uma loja digital fictícia.

A página inicial é uma vitrine pública, permitindo que visitantes consultem os jogos, pesquisem produtos, visualizem categorias e ofertas e adicionem jogos ao carrinho sem a necessidade de autenticação. O acesso à conta é necessário para operações como finalizar compras, realizar avaliações, consultar pedidos e acessar os jogos adquiridos.

O sistema também possui uma área administrativa destinada ao gerenciamento dos jogos, categorias, usuários, clientes, fornecedores, entradas de licenças digitais, vendas, notas fiscais fictícias e relatórios.

O projeto contempla levantamento de requisitos, minimundo, regras de negócio, requisitos funcionais e não funcionais, modelagem MER/DER e UML, banco de dados relacional, prototipação das interfaces, implementação web e hospedagem online.

## 2. Funcionalidades

### Cliente

- Consultar a vitrine de jogos e seus detalhes.
- Pesquisar jogos e navegar por categorias e ofertas.
- Cadastrar-se e entrar na conta.
- Consultar e atualizar informações pessoais.
- Alterar a senha da conta.
- Adicionar e remover jogos do carrinho.
- Consultar os valores dos jogos selecionados.
- Finalizar pedidos e realizar **pagamentos simulados**.
- Selecionar Pix ou cartão como forma de pagamento.
- Utilizar métodos de pagamento previamente cadastrados.
- Consultar o histórico de pedidos e seus respectivos status.
- Consultar as notas fiscais fictícias das compras realizadas.
- Acessar os jogos adquiridos após a confirmação do pagamento.
- Utilizar a opção **Baixar Jogo**, que disponibiliza um arquivo PNG demonstrativo.
- Avaliar jogos adquiridos com nota de 1 a 5 e comentário opcional.

### Administrador

- Acessar a área administrativa por autenticação.
- Consultar o Dashboard administrativo.
- Cadastrar, consultar, editar, ativar e inativar jogos.
- Cadastrar, consultar, editar, ativar e inativar categorias.
- Excluir categorias quando não existirem vínculos que impeçam a operação.
- Associar um jogo a várias categorias.
- Definir ofertas e preços promocionais.
- Consultar e gerenciar informações de usuários e clientes, conforme as funcionalidades disponíveis.
- Cadastrar e gerenciar fornecedores de jogos digitais.
- Registrar entradas de licenças digitais.
- Informar a quantidade de licenças e seus respectivos valores unitários.
- Consultar o histórico e os detalhes das entradas realizadas.
- Consultar vendas e pedidos registrados no sistema.
- Acompanhar os status dos pedidos e suas formas de pagamento.
- Emitir e visualizar notas fiscais fictícias.
- Consultar relatórios e indicadores administrativos.

O acesso administrativo é restrito aos usuários autenticados com perfil de administrador. Os clientes utilizam a área pública da loja e as funcionalidades relacionadas às suas próprias contas.

## 3. Tecnologias e arquitetura

| Tecnologia | Utilização |
| --- | --- |
| PHP | Lógica do servidor, autenticação e processamento das operações |
| MySQL / MariaDB | Persistência e gerenciamento dos dados do sistema |
| HTML5 | Estruturação das páginas |
| CSS3 | Estilização, organização visual e responsividade das interfaces |
| JavaScript | Interações, cálculos dinâmicos, confirmações e validações nas interfaces |
| PDO | Comunicação do PHP com o banco de dados |
| MVC | Organização do código em Models, Views e Controllers |
| XAMPP | Ambiente de desenvolvimento local, utilizando Apache e MySQL |
| HeidiSQL | Administração e gerenciamento do banco de dados |
| phpMyAdmin | Administração do banco de dados local e online |
| Figma | Planejamento e prototipação das interfaces |
| VS Code | Desenvolvimento e edição do código-fonte |
| InfinityFree | Hospedagem online da aplicação |

A organização é baseada em MVC (Model–View–Controller): o controller recebe a solicitação e coordena as operações, o model realiza o acesso e a manipulação dos dados, e a view apresenta as informações ao usuário.

Essa arquitetura permite separar as responsabilidades do sistema, facilitando a organização, a manutenção e a evolução do código.

## 4. Requisitos e instalação local

### Requisitos

- PHP com suporte a `PDO` e `pdo_mysql`.
- Servidor web compatível com PHP, como o Apache do XAMPP.
- MySQL ou MariaDB.
- Navegador atualizado com suporte a HTML, CSS e JavaScript.
- Arquivo SQL
