drop database if exists SocialConnect;

create database socialConnect;

use SocialConnect;

create table usuarios(
id int not null auto_increment primary key,
nome varchar(100) not null,
email varchar(100) not null unique,
data_criacao datetime,
idade int
);

create table postagens(
id int not null auto_increment primary key,
texto text not null,
data_publicacao datetime,
imagem varchar(255),
curtidas int,
id_usuario int,
foreign key (id_usuario) references usuarios(id) 
);

create table curtidas(
id_usuario int not null,
id_postagem int not null,
data_curtida datetime,
primary key(id_usuario, id_postagem),
foreign key (id_usuario) references usuarios(id) ,
foreign key (id_postagem) references postagens(id) 
);

create table comentarios(
id int not null auto_increment ,
texto text not null,
data_criacao datetime null,
id_usuario int not null,
id_postagem int not null,
primary key(id),
foreign key (id_usuario) references usuarios(id) ,
foreign key (id_postagem) references postagens(id) 
);


alter table usuarios modify column data_criacao datetime default current_timestamp;
alter table postagens modify column data_publicacao datetime default current_timestamp;
alter table curtidas modify column data_curtida datetime default current_timestamp;
alter table comentarios modify column data_criacao datetime default current_timestamp;
describe usuarios;
-- select Current_timestamp, now();

-- Inserir usuários
INSERT INTO usuarios (nome, email, idade) VALUES 
('João Silva', 'joao.silva@gmail.com', 25),
('Maria Oliveira', 'maria.oliveira@yahoo.com', 28),
('Carlos Souza', 'carlos.souza@outlook.com', 30),
('Fernanda Lima', 'fernanda.lima@hotmail.com', 24),
('Rafael Costa', 'rafael.costa@gmail.com', 32);

-- Inserir postagens para cada usuário
INSERT INTO postagens (texto, id_usuario) VALUES 
('Postagem do João 1', 1),
('Postagem do João 2', 1),
('Postagem do João 3', 1),
('Postagem da Maria 1', 2),
('Postagem da Maria 2', 2),
('Postagem da Maria 3', 2),
('Postagem do Carlos 1', 3),
('Postagem do Carlos 2', 3),
('Postagem do Carlos 3', 3),
('Postagem da Fernanda 1', 4),
('Postagem da Fernanda 2', 4),
('Postagem da Fernanda 3', 4),
('Postagem do Rafael 1', 5),
('Postagem do Rafael 2', 5),
('Postagem do Rafael 3', 5);

-- Inserir comentários para as postagens
INSERT INTO comentarios (texto, id_postagem, id_usuario) VALUES 
('Comentário 1 do João', 1, 2),
('Comentário 2 do João', 1, 3),
('Comentário 1 da Maria', 4, 1),
('Comentário 2 da Maria', 4, 5),
('Comentário 1 do Carlos', 7, 4);

-- Inserir curtidas nas postagens
INSERT INTO curtidas (id_usuario, id_postagem, data_curtida) VALUES 
(2, 1, NOW()),
(3, 1, NOW()),
(4, 2, NOW()),
(5, 3, NOW()),
(1, 4, NOW()),
(2, 5, NOW()),
(3, 6, NOW());

-- atualiza o nome do usuario
update usuarios set nome = 'joão Pedro Silva' where id = 1;

-- atualiza a imagem de uma postagem 
update postagens set imagem = 'nova_imagem.jpg' where id = 2;

-- atualize o nome para adimimn do usuario id = 1
update usuarios set nome = 'adimin' where id = 1;

-- delete uma curtida
delete from curtidas where id_usuario = 3 and id_postagem = 1;

-- delete um comentario
delete from comentarios where id_postagem =1;

-- delete todos os comentarios e curtidas do usuario com id = 1 
delete from comentarios where id_usuario =1;
delete from curtidas where id_usuario =1;

-- listar todos os usuarios
select * from usuarios;

-- listar todos os campos das postagens e onome do usuario que fez a postagem
select postagens.*, usuarios.nome from postagens
inner join usuarios on postagens.id_usuario = usuarios.id;

-- Listar o texto de todas as postagens, data da postagem, os comentários das postagens e o nome do usuário que postou o comentário
select postagens.texto as postagem, postagens.data_publicacao, comentarios.texto,
	usuario_comentario.nome as comentou, usuario_postagem.nome as postou
	from postagens
inner join comentarios on comentarios.id_postagem = postagens.id
inner join usuarios as usuario_comentario on comentarios.id_usuario = usuario_comentario.id
inner join usuarios as usuario_postagem on postagens.id_usuario = usuario_postagem.id;
-- o Listar o texto de todas as postagens, data da postagem, nome do usuário da postagem e todas as curtidas da postagem (data da curtida, e nome de quem curtiu a postagem).

-- Campos Status

-- o Adicionar campo de status da conta (ativo ou inativo)
alter table usuarios add column status_conta enum('ativo','inativo', 'bloqueado');
-- o Alterar todos os status para ativo.
update usuarios set status_conta = 'ativo';
update usuarios set status_conta = 'ativo' where status_conta = null;
-- o Deletar todas as contas de usuário com status inativo.
delete from usuarios where status_conta = 'inativo';

/*select * from usuarios;
select * from postagens;
select * from comentarios;
select * from curtidas;*/








