-- exibir todas as database;
show databases;

-- Apagar database (base de dados) caso ela exista
drop database if exists pizzaria;

-- criar database (base de dados) caso ela não exista
create database if not exists pizzaria;

-- utilizar databese (base de dados)
use pizzaria;

-- tabela cliente
create table if not exists clientes(
id int not null auto_increment primary key,
telefone varchar(10),
nome varchar(30),
logradouro varchar(30),
numero decimal(5.0),
complemento varchar(30),
bairro varchar(30),
referencia varchar(30)
);

-- tabela pizza 

create table pizza (
id int not null auto_increment primary key,
nome varchar(30),
descricao varchar(30),
valor decimal(15,2)
);

-- tabelas pedidos

create table pedidos(
id int not null auto_increment primary key,
cliente_id int,
data datetime,
valor decimal(15,2)
);

-- adicionar chave estrangeira
-- adicionando foreign key

alter table pedidos add foreign key(cliente_id) references clientes (id);

-- tabela itens_pedidos
create table itens_pedidos(
pedido_id int,
pizza_id int,
quantidade int,
valor decimal(15,2),
foreign key(pizza_id) references pizza (id),
foreign key(pedido_id) references pedidos (id),
primary key (pedido_id,pizza_id)
);





