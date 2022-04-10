create database gamabuster;

use gamabuster;

create table filmes(
	id int primary key auto_increment not null,
    nome varchar(45),
    ano_lancamento int,
    duracao int,
    quantidade int
);
create table generos(
	id int primary key auto_increment not null,
    nome varchar(45)
);
create table filmes_generos(
	id int primary key auto_increment not null,
    filme_id int not null,
    genero_id int not null,
    constraint filme_generos foreign key (filme_id) references filmes(id),
	constraint genero_filmes foreign key (genero_id) references generos(id)
);
create table clientes(
	id int primary key auto_increment not null,
    nome varchar(45),
    sobrenome varchar(45),
    cpf char(11),
    email varchar(45),
    telefone varchar(45),
    data_nascimento date
);
create table enderecos(
	id int primary key auto_increment not null,
    rua varchar(45),
    numero varchar(45),
    complemento varchar(45),
    bairro varchar(45),
    cep varchar(8),
    uf char(2),
    cidade varchar(45),
    cliente_id int not null,
    constraint endereco_cliente foreign key (cliente_id) references clientes(id)
);
create table reservas(
	id int primary key auto_increment not null,
    data_reserva date,
    data_devolucao date,
    valor_reserva double,
    cliente_id int not null,
    constraint reserva_cliente foreign key (cliente_id) references clientes(id)
);
create table reserva_filmes(
	id int primary key auto_increment not null,
    quantidade int,
    filme_id int not null,
    reserva_id int not null,
    constraint reservas_filme foreign key (filme_id) references filmes(id),
    constraint reservas_cliente foreign key (reserva_id) references reservas(id)
);