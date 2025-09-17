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

create table auxiliar(
id integer not null auto_increment primary key,
nome varchar(3),
idades varchar(3),
tel int,
obs varchar(150)
);

insert into auxiliar (nome , idades , tel ,obs)
values ('ana', '20', 1111, 'sem observações');
insert into auxiliar (nome , idades , tel ,obs)
values ('leo', '21', 2222, 'contato urgente');
insert into auxiliar (nome , idades , tel ,obs)
values ('bia', '19', 3333, 'ligação não atendida');
insert into auxiliar (nome , idades , tel ,obs)
values ('tom', '23', 4444, 'revisar cadastro');
insert into auxiliar (nome , idades , tel ,obs)
values ('eva', '22', 5555, 'sem telefone alternativo');

select*from auxiliar;

insert into auxiliar (nome , idades , tel ,obs)
values ('teste', '22', 5555, 'sem telefone alternativo');


/* Sintaxe do UPDATE
update nome_da_tabel
set coluna = valor1, ciluna2 = valor2 .... colunaN =valorN
where condição 
*/

-- atualizar o telefone da ana
update auxiliar set tel = 7777 where nome = 'ana';

-- corrigir a idade de Tom para 20 anos
update auxiliar set idades = 20 where nome = 'tom';

-- alterar obs da eva
update auxiliar set obs = 'prferencia por email' where nome = 'eva';

-- alterar nome e telefone do id3
update auxiliar set nome = 'tia', tel=8888 where id = 3;

-- evitar update sem where pois ira alterar todos os registros
update auxiliar set tel = 99999;

select * from auxiliar


