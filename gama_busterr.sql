create database gama_buster;
use gama_buster;

CREATE TABLE cliente(
	id_cliente INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL, 
	sobrenome VARCHAR(45) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE, 
	telefone VARCHAR(45) NOT NULL,
	email VARCHAR(70) NOT NULL UNIQUE, 
	nascimento DATE NOT NULL
);
CREATE TABLE genero(
	id_genero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gen_filme VARCHAR(30) NOT NULL
);
CREATE TABLE endereco(
	num_seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(5) NOT NULL,
	logradouro VARCHAR(50) NOT NULL, 
	numero INTEGER, 
	compl VARCHAR(20), 
	bairro VARCHAR(30), 
	cep VARCHAR(10),
	cidade VARCHAR(50), 
	estado VARCHAR(2), 
	id_cliente INTEGER NOT NULL,
	CONSTRAINT endereco_cliente FOREIGN KEY 
	(id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE reserva(
	numero_pedido INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	data_reserva DATE,
	data_devolucao DATE,
	valor_reserva DOUBLE,
	id_cliente INTEGER NOT NULL,
	CONSTRAINT reserva_cliente FOREIGN KEY 
	(id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE filme(
	codigo_filme INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estoque INTEGER NOT NULL, 
	nome_filme VARCHAR(70), 
	ano_lancamento INTEGER, 
	duração INTEGER
);
CREATE TABLE reserva_filme(
	seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantidade INTEGER,
    codigo_filme INTEGER NOT NULL,
    numero_pedido INTEGER NOT NULL,
	CONSTRAINT codigo_filme FOREIGN KEY
	(codigo_filme) REFERENCES filme(codigo_filme),
	CONSTRAINT numero_pedido FOREIGN KEY
	(numero_pedido) REFERENCES reserva(numero_pedido)
);
CREATE TABLE filmes_generos(
	seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo_film INTEGER NOT NULL,
	id_genero INTEGER NOT NULL,
	CONSTRAINT codigo_film FOREIGN KEY
	(codigo_film) REFERENCES filme(codigo_filme),
	CONSTRAINT id_genero FOREIGN KEY
	(id_genero) REFERENCES genero(id_genero)
);