create database modelofortes;
use modelofortes;

create table if not exists usuario(
id_usuario varchar(15) primary key,
nome varchar (50) not null,
cargo varchar (15) not null,
senha varchar (15) not null
);

create table if not exists cadastro(
id_cadastro int(15) primary key,
_data date not null,
dados tinytext not null
);

create table if not exists administrador(
id_administrador INT(15) primary key
);

create table if not exists relatórios(
id_relatorio int(15)
);

create table if not exists login(
id_login INT(15) primary key,
senha varchar(15),
id_usuarios VARCHAR(15) primary key,
constraint foreign key (id_usuarios) references usuario
);

create table if not exists dashboard(
seus_projetos INT(15) primary key,
investimentos VARCHAR(20) not null,
investimentos_gerais VARCHAR (45) not null,
projetos_gerais VARCHAR (45) not null
);

create table if not exists relatorios(
id_relatorios int primary key
);

create table if not exists desempenho(
id_desempenho int(15) primary key,
id_relatorios int(15) primary key,
constraint foreign key (id_relatorios) references relatorios
);