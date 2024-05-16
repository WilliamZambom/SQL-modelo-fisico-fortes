CREATE DATABASE IF NOT EXISTS MODELO_FORTES;
USE MODELO_FORTES;

CREATE TABLE USUARIO(
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL
);

CREATE TABLE CADASTRO(
    id_cadastro INT PRIMARY KEY,
    data_cadastro DATE,
    id_usuario INT,
    CONSTRAINT fk_usuario_cadastro FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE RELATORIOS(
    id_relatorios INT PRIMARY KEY,
    id_usuario INT,
    CONSTRAINT fk_usuario_relatorios FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE LOGIN(
    id_login INT PRIMARY KEY AUTO_INCREMENT,
    senha VARCHAR(45) NOT NULL,
    id_usuario INT,
    CONSTRAINT fk_usuario_login FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE ONGS(
    CNPJ INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE DESEMPENHO (
    id_desempenho INT PRIMARY KEY,
    id_relatorios INT,
    CONSTRAINT fk_relatorios_desempenho FOREIGN KEY (id_relatorios) REFERENCES RELATORIOS(id_relatorios)
);

CREATE TABLE DASHBOARD (
    seus_projetos INT PRIMARY KEY,
    investimentos VARCHAR(45),
    projetos_gerais VARCHAR(45),
    id_usuario INT,
    CONSTRAINT fk_usuario_dashboard FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE FUNCIONARIOS (
    id_funcionarios INT PRIMARY KEY,
    cargo VARCHAR(45) NOT NULL,
    projeto VARCHAR(45) NOT NULL,
    nome VARCHAR(45),
    id_ong INT,
    CONSTRAINT fk_ong_funcionarios FOREIGN KEY (id_ong) REFERENCES ONGS(CNPJ)
);

CREATE TABLE PROJETOS (
    id_projetos INT PRIMARY KEY,
    status VARCHAR(45) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    id_ong INT,
    CONSTRAINT fk_ong_projetos FOREIGN KEY (id_ong) REFERENCES ONGS(CNPJ)
);

CREATE TABLE ADMINISTRADOR (
    id_administrador INT PRIMARY KEY,
    id_usuario INT,
    CONSTRAINT fk_usuario_administrador FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE EVENTOS (
    id_eventos INT PRIMARY KEY,
    datas DATE NOT NULL,
    qtd_funcionarios VARCHAR(45),
    id_projeto INT,
    CONSTRAINT fk_projeto_eventos FOREIGN KEY (id_projeto) REFERENCES PROJETOS(id_projetos)
);
