create database diversus;
use diversus;

create table especialista(
id int auto_increment,
nome varchar(100) not null,
email varchar(50) not null,
senha varchar(50) not null,
dataNasc date not null,
genero varchar(10) not null,
especialista boolean,
especialidade varchar(30) not null,
formacao varchar(100),
biografia varchar(200),
certificado LONGBLOB,
nomeCertificado varchar(100),
caminhoImg varchar(100),
cidade varchar(255),
primary key(id, email)
);

select * from post;
select * from comentario;
select * from especialista;
select * from admin;
select * from experienciaProjeto;
select * from assinante;


create table post(
id int auto_increment,
titulo varchar(100) not null,
subtitulo varchar(100) not null,
conteudo varchar(1000) not null,
iduser int not null,
datapub timestamp default current_timestamp,
temaPredominante varchar(20),
img longblob,
primary key(id),
foreign key(iduser) references especialista(id)
);

create table inclusao(
	id int auto_increment,
    idPost int,
    primary key(id),
    foreign key(idPost) references post(id) ON DELETE CASCADE
);
create table acessibilidade(
	id int auto_increment,
    idPost int,
    primary key(id),
    foreign key(idPost) references post(id) ON DELETE CASCADE
);
create table deficiencia(
	id int auto_increment,
    idPost int,
    primary key(id),
    foreign key(idPost) references post(id) ON DELETE CASCADE
);
create table autismo(
	id int auto_increment,
    idPost int,
    primary key(id),
    foreign key(idPost) references post(id) ON DELETE CASCADE
);

create table comentario(
	id int auto_increment,
    conteudo varchar(500),
    idpost int,
    idUser int,
    primary key(id),
    foreign key(idpost) references post(id) ON DELETE CASCADE,
    foreign key(idUser) references especialista(id)
);

create table admin(
	id int auto_increment,
    nome varchar(100) not null,
	email varchar(50) not null,
	senha varchar(50) not null,
	dataNasc date not null,
	genero varchar(10) not null,
    primary key(id, email)
);

insert into admin (nome, email, senha, dataNasc, genero) values ("Andson", "admin2024@gmail.com", "an789123", '2004-03-10', "masculino");

create table experienciaProjeto(
	id int not null auto_increment,
	ano int not null,
    conteudo varchar(100),
    cidade varchar(20),
    userId int,
    primary key (id),
    foreign key (userId) references especialista(id)
);

Create table Formacao(
	id int not null auto_increment,
	ano int not null,
    conteudo varchar(100),
    cidade varchar(20),
    userId int,
    primary key (id),
    foreign key (userId) references especialista(id)
);


Create table assinante(
	email varchar(100) primary key
);

SELECT p.titulo, p.subtitulo, DATEDIFF(current_date, p.datapub) AS diasDesdePostagem, e.nome FROM post p JOIN especialista e ON p.iduser = e.id WHERE DATEDIFF(current_date, p.datapub) <= 5 LIMIT 3;