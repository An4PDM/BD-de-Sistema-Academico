-- sistema academico
CREATE DATABASE Sistema_Academico;
USE Sistema_Academico;

CREATE TABLE aluno (
	rgm INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    telefone CHAR(11),
    email VARCHAR(45)
);
drop table aluno;

CREATE TABLE turma (
	cod_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    turno ENUM('matutino','diurno','noturno') NOT NULL
);

CREATE TABLE historico(
	cod_hist INT AUTO_INCREMENT,
    idAluno INT,
    notas FLOAT,
    frequencia VARCHAR(4),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    PRIMARY KEY (cod_hist, idAluno),
    CONSTRAINT fk_historico_aluno FOREIGN KEY (idAluno) REFERENCES aluno(rgm) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE professor (
	cod_prof INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    telefone CHAR(11),
    CPF char(11),
    email VARCHAR(45),
    endereco TEXT
);

CREATE TABLE departamento (
	cod_depto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE curso (
	cod_curso INT PRIMARY KEY AUTO_INCREMENT,
	idDepto INT,
    nome VARCHAR(45),
    duracao VARCHAR(45)
);

CREATE TABLE disciplina (
	cod_disc INT PRIMARY KEY,
    nome VARCHAR(45),
    carga_horaria INT
);

-- obs: sem data por enquanto
CREATE TABLE aluno_disciplina (
	rgmC INT,
    cod_discC INT,
    PRIMARY KEY (rgmC,cod_discC),
    CONSTRAINT fk_aluno_cursa FOREIGN KEY (rgmC) REFERENCES aluno(rgm),
    CONSTRAINT fk_disciplina_cursa FOREIGN KEY (cod_discC) REFERENCES disciplina(cod_disc)
);
SHOW TABLES;