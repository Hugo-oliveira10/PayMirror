create database banco;
use banco;

Create table usuarios(
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
email Varchar (30),
senha Varchar (40),
cpf varchar (11),
nome varchar (50)
);

create table requisicoes(
assunto varchar(20) primary key,
conteudo varchar(90),
data_envio date,
data_limite date
);

create table valores(
salario_bruto int (10),
salario_liquido int (10)
);

create table descontos(
INSS int(10),
FGTS int(10),
IR int(10),
vale_transporte int(10),
plano_saude int(10),
faltas_atrasos int(10)
);

create table funcionários(
chapa int(5),
email Varchar (30),
senha Varchar (40),
cpf varchar (11) primary key,
nome varchar (50)
);

create table controle_pontos(
pontos varchar (4),
horas int(50),
faltas varchar(30),
feriados varchar(10),
atestados varchar(10)
);

insert into usuarios(id_usuario,email,senha,cpf,nome)
values
(1,'carlos@gmail.com','123','1','carlos'),
(2,'hugo@gmail.com','123','2','hugo'),
(3,'tavora@gmail.com','123','3','tavora');

