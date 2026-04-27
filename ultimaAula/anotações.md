<img width="829" height="567" alt="image" src="https://github.com/user-attachments/assets/f093582b-4f63-4dc7-b523-946ebf7a52fe" />

--Quais os alunos matriculados em Estrutura de Dados em 2026?--
  Select Aluno.nome, Curso.descricao
  from disciplina,turma,matricula
  where disciplina.nome =="Estrutura de Dados" And
  disciplina.id_disciplina == matricula.id_turma And
  turma.id_turma == matricula.id_turma And
  matricula.id_aluno == aluno.id_aluno And
  aluno.id_curso == curso.id_curso

--PARTE PRATICA DO Mysql--

-- mostra os esquemas de dados de MySQL
show databases;

-- para ativar um esquema ou um banco 
use mysql;

-- mostra as tabelas de um esquema ou
show tables;

-- mostra todas as colunas/atributos e todas as linhas da tabela componentes
select *
from component;

-- criar e usa um esquema de banco de dados
create schema ufn_db;
use  ufn_db;
show tables;

-- cria a tabela curso(id_curso,descricao)
create table curso(
	id_curso int primary key not null,
    descricao varchar(50) not null
);

select *
from curso;

-- criar a tabela aluno(id_aluno,nome,id_curso)
create table aluno(
	id_aluno int primary key not null,
	nome varchar(50) not null,
	id_curso int,
    constraint fk_curso foreign key(id_curso) references curso(id_curso)
);

select *
from aluno;




