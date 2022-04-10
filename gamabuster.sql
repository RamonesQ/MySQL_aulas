CREATE TABLE cliente(
	id_cliente INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_completo VARCHAR(100) NOT NULL, 
	cpf VARCHAR(15) NOT NULL UNIQUE, 
	telefone INTEGER NOT NULL,
	email VARCHAR(70) NOT NULL UNIQUE, 
	nascimento INTEGER NOT NULL
);
CREATE TABLE genero(
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
	(id_cliente) REFERENCES cliente(id)
);
CREATE TABLE reserva(
	numero_pedido INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	data_reserva DATE, 
	status VARCHAR(1) NOT NULL, 
	id_cliente INTEGER NOT NULL,
	CONSTRAINT reserva_cliente FOREIGN KEY 
	(id_cliente) REFERENCES cliente(id)
);
CREATE TABLE filme (
	codigo_filme INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estoque INTEGER NOT NULL, 
	nome_filme VARCHAR(70), 
	ano_lancamento INTEGER, 
	duração INTEGER, 
	filme_genero INTEGER NOT NULL,
	CONSTRAINT genero_filme FOREIGN KEY 
	(filme_genero) REFERENCES genero(gen_filme)
);
CREATE TABLE Item_pedido(
	seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantidade INTEGER,
	valor_unitario DOUBLE, 
	desconto DOUBLE, 
	valor_total DOUBLE, 
	codigo_filme INTEGER NOT NULL, 
	numero_pedido INTEGER NOT NULL,
	CONSTRAINT item_filme FOREIGN KEY
	(codigo_filme) REFERENCES filme(codigo_filme)
	CONSTRAINT item_reserva REFERENCES reserva(numero_pedido)
);
