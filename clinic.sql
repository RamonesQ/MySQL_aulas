create database clinica;
USE clinica;
select *from clinica;
CREATE TABLE calendar_test (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `start_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL
);

CREATE TABLE evento (
  `idevento` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `titulo` varchar(300) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `hora_fim` time DEFAULT NULL
);

CREATE TABLE horarios_medico (
  `medico_idmedico` int(11) NOT NULL,
  `dia` varchar(10) NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`medico_idmedico`,`dia`,`hora`)
);
CREATE TABLE `horariosatendimento` (
  `idhorariosatendimento` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `horario` time DEFAULT NULL
);

CREATE TABLE `medico` (
  `idmedico` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` varchar(60) DEFAULT NULL,
  `dia1` varchar(10) DEFAULT NULL,
  `dia2` varchar(10) DEFAULT NULL,
  `dia3` varchar(10) DEFAULT NULL,
  `dia4` varchar(10) DEFAULT NULL,
  `dia5` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `parent` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `perfil` int(11) DEFAULT NULL
);
