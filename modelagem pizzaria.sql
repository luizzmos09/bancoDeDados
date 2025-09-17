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
-- update auxiliar set tel = 99999;

select * from auxiliar;

/* sintaxe do DELETE
delete from nome_da_tabela
where condição;
*/

-- excluir o registro com o nome leo 
delete from auxiliar where nome = 'leo';


-- excluir o registro com id5
delete from auxiliar where id = 5;

-- excluir todos com idades = 20
delete from auxiliar where idades= 20;

-- excluir todos os registros da tabela
delete from auxiliar;
-- sempre use WHERE no DELETE, senão todas as linhas da tabela serão apagadas

-- exibir todas as tabelas 
show tables;

-- exibe a definição das colunas de uma tabela
-- mostrando informações como nome da coluna
-- tipo de dados , se aceita valores nulos, chaves
-- valor padrão e outra caracteristica
describe auxiliar;

-- apagar uma coluna de uma tabela
alter table auxiliar drop obs;

-- adicionar uma nova coluna a tabela
alter table auxiliar add data_nascimento date;

-- modificando o tipo de uma coluna em uma tabela
alter table auxiliar modify tel varchar(10);
-- alterar o nome e o tipo de coluna em uma tabela
alter table auxiliar change tel telefone varchar(14);
alter table auxiliar change idades idade integer;
-- apagar uma tabela
drop table auxiliar;

select * from auxiliar;

insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(11) 11111-1111', 'Alexandre Santos', 'Rua das Palmeiras',111, NULL,
'Bela Vista' , 'Em frente a escola');
insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(22) 22222-2222', 'Bruna Dantas', 'Rua das Rosas',222, 'Cantareira',
null );
insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(33) 33333-3333', 'Bruna Vieira', 'Rua das Avencas',333,null, 'Bela Vista',
null );
insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(44) 44444-4444', 'Giulia Silva', 'Rua dos Cravos',444,'Cantareira', 
'esquina do mercado');
insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(55) 55555-5555', 'Jose Silva', 'Rua das Acácias',555,'Bela Vista', 
'ap 301');
insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia)
values ('(66) 66666-6666', 'Laura Madureira', 'Rua das Gardências',666,'Bloco 3', 
'Cantareira');


