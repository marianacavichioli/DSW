create table Usuario
(
id integer not null generated always as identity (start with 1, increment by 1),
email varchar(50) not null,
senha varchar(100) not null,
ativo smallint not null,
CONSTRAINT Usuario_PK PRIMARY KEY (id)
);

create table Papel (
id integer not null generated always as identity (start with 1, increment by 1),
email varchar(50) not null,
nome varchar(50) not null,
constraint Papel_PK PRIMARY KEY (id)
);

create table Cliente (
id integer,
nome varchar(100) not null,
cpf varchar(14) not null,
telefone varchar(11),
data_nascimento date,
sexo varchar(50),
constraint Cliente_PK PRIMARY KEY (id),
constraint Cliente_FK FOREIGN KEY (id) REFERENCES Usuario(id)
);

create table Locadora (
id integer,
nome varchar(100) not null,
cnpj varchar(11) not null,
cidade varchar(50),
constraint Locadora_PK PRIMARY KEY (id),
constraint Locadora_FK FOREIGN KEY (id) REFERENCES Usuario(id)
);

create table Administrador (
id integer,
constraint Admin_PK PRIMARY KEY (id),
constraint Admin_FK FOREIGN KEY (id) REFERENCES Usuario(id)
);

create table Locacao (
id integer not null generated always as identity (start with 1, increment by 1),
id_cliente integer not null, 
id_locadora integer not null,
dia date,
hora time,
constraint Locacao_PK PRIMARY KEY (id),
constraint Locacao_FK1 FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
constraint Locacao_FK2 FOREIGN KEY (id_locadora) REFERENCES Locadora(id)
);


