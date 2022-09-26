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

--populando as tabelas
insert into aluno values 
( 1	, 1	, 1	, '34523233322'  , 'Cleberson FIgueiroa',	 '20/01/2000'	, 'M' ,	22 ) ,
( 2	, 2	, 1	, '23112344466'  , 'Gustavo Ribeiro'	,    '30/09/1994'	, 'M' ,	27 ) ,
( 3	, 1	, 1	, '23455678999'  , 'Wanderson Limas'	,    '25/12/2009'	, 'M' ,	12 ) ,
( 4	, 1	, 2	, '22345578988'  , 'Elena Tomas'	    ,    '21/04/1976'	, 'F' ,	46 ) ,
( 5	, 2	, 2	, '33344556799'  , 'Renato Vieria'	    ,    '17/12/1964'	, 'M' ,	57 ) ,
( 6	, 2	, 3	, '22244123456'  , 'Angelia Dunas'	    ,    '05/10/1998'	, 'F' ,	23 ) ,
( 7	, 1	, 4	, '54245255355'  , 'Bianca Gusmão'	    ,    '09/06/1987'	, 'F' ,	35 ) ,
( 8	, 2	, 4	, '33344567789'  , 'Paula Andrade'	    ,    '09/11/1990'	, 'F' ,	31 ) ,
( 9	, 1	, 5	, '33344567721'  , 'Bento Silveira'	,    '10/05/2000'	, 'M' ,	22 ) ;

insert into curso values
( 1 ,	'Desenv. full stack') ,
( 2 ,	'Análise da dados') ;

insert into facilitadores values
( 1 ,	'Fabiano Souza	   ',  '35436577222') ,
( 2 ,	'Guilherme Bicalho	', '87609877771') ,
( 3 ,	'Joana Silveira	   ',  '65487645399') ,
( 4 ,	'Gabriella Bianco	', '71687644212') ,
( 5 ,	'Julio Gusmão	   ',  '87665423487') ,
( 6 ,	'Felipe Sierra	   ',  '16536587699') ;


insert into turma values
( 1	, 1 , 2	, 'TURMA1' , 'EM ANDAMENTO') ,
( 2	, 1 , 2	, 'TURMA2' , 'EM ANDAMENTO') ,
( 3	, 2 , 1	, 'TURMA3' , 'CONCLUÌDO   ') ,
( 4	, 3 , 1	, 'TURMA4' , 'EM ANDAMENTO') ,
( 5	, 4 , 2	, 'TURMA5' , 'CONCLUÌDO   ') ;

--Queries
--Selecionar a quantidade total de estudantes cadastrados no banco;
select count(id_aluno) as qtd_alunos from aluno;
--**************************************************************
-- Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
select nome_aluno,nome_curso from curso
	inner join aluno
		on curso.id_curso = aluno.id_curso
		order by curso;

--**************************************************************
--Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
select facilitadores.nome_facilitador, count(turma.id_facilitador) 
as staus from turma
    inner join facilitadores
        on turma.id_facilitador = facilitadores.id_facilitador
where status = 'EM ANDAMENTO' 
group by facilitadores.nome_facilitador
    having count(turma.id_facilitador) > 1
order by count(turma.id_facilitador) desc
;
--*****************************************************************
--Selects escolhidos 
--Selecionar quantos facilitadores tem na base de dados
select count(id_facilitador) from facilitadores;
--*****************************************************************
---Selecionar as alunas genero feminino tem na base de dados
SELECT nome_aluno, genero  
FROM  aluno 
WHERE genero='F';
--*****************************************************************
---Selecionar alunos com mais de 30
SELECT nome_aluno, idade  
FROM  aluno 
WHERE idade > 30;
