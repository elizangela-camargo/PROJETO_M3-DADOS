--criando as tabelas
CREATE TABLE "aluno" (
  "id_aluno" int PRIMARY KEY,
  "id_curso" int,
  "id_turma" int,
  "cpf" varchar(11),
  "nome_aluno" varchar(100),
  "data_nascimento" date,
  "genero" varchar(2),
  "idade" int
 
);

CREATE TABLE "curso" (
  "id_curso" int PRIMARY KEY,
  "nome_curso" varchar(50)
);

CREATE TABLE "curso" (
  "id_curso" int PRIMARY KEY,
  "nome_curso" varchar(50)
);

CREATE TABLE "facilitadores" (
  "id_facilitador" int PRIMARY KEY,
  "nome_facilitador" varchar(50),
  "cpf" varchar(11)

);

CREATE TABLE "turma" (
  "id_turma" int PRIMARY KEY,
  "id_facilitador" int,
  "id_curso" int,
  "turma" varchar(11),
  "status" varchar(20)

);

--declarando as chaves estrangeiras
alter table aluno add foreign key (id_curso) references curso (id_curso);
alter table aluno add foreign key (id_turma) references turma (id_turma);
alter table turma add foreign key (id_facilitador) references facilitadores (id_facilitador);
alter table turma add foreign key (id_curso) references curso (id_curso);

--

