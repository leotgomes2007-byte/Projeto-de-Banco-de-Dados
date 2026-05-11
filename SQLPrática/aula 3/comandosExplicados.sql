############################################################################
# Seleção de todos os campos (ou colunas) da tabela de Departamentos.
############################################################################
#
SELECT  *  FROM  Departamento;
#
# where
#
# Operadores lógicos
#
# operador significado
# =  igual a
# >  maior que
# >= maior que ou igual a
# <  menor que
# <= menor que ou igual a
#
SELECT  Empregado.nome, Empregado.funcao			-- procurando pelos empregados que tem iddepartamento(Função) maior que 3
FROM  Empregado
WHERE  Empregado.Departamento_idDepartamento > 3;
#
SELECT  Empregado.nome, Empregado.funcao	-- procura pelos funcionarios que tem a função como "Gerente"
FROM  Empregado
WHERE Empregado.funcao = 'GERENTE';
#
############################################################################
# Selecione todos os departamentos cujo orçamento mensal
#seja maior que 10000. Apresente o Nome de tal departamento
#e seu orçamento anual, que será obtido multiplicando-se o
#orçamento mensal por 12.
############################################################################
#
select Departamento.nome, Departamento.orcamento * 12		-- procura pelos orcamentos anuais maior que 10 mil
from Departamento
where Departamento.orcamento >= 10000;
#
############################################################################
# Apresente a instrução anterior porém ao invés dos
#"feios" DepNome e DepOrca, os Títulos Departamento e Orçamento.
############################################################################
#
SELECT  Departamento.nome "DEPARTAMENTO", Departamento.orcamento * 12 "ORCAMENTO ANUAL"	 -- procura pelos orçamentos maior que 5 mil
FROM  Departamento
WHERE Departamento.orcamento > 5000;
#
############################################################################
# Apresente todos os cargos existentes na empresa,
# porém omita eventuais duplicidades.
############################################################################
#
select distinct Empregado.funcao	-- pegar todas as funções que tem alguem cadastrado nelas
from Empregado;
#
############################################################################
# Apresente os nomes e funções da cada funcionário contidos
#na tabela empresa, porém classificados alfabeticamente (A..Z)
#e depois alfabeticamente invertido (Z..A).
############################################################################
#
select Empregado.nome "Nome do Empregado", Empregado.funcao "Cargo"		-- puxando o nome e a função e ordenando em ordem alfabetica pelo nome(cressente)
from Empregado
order by  Empregado.nome;
#
select Empregado.nome "Nome do Empregado", Empregado.funcao "Cargo"		-- puxando o nome e a função e ordenando em ordem alfabetica pelo nome(decressente)
from Empregado
order by  Empregado.nome desc;
#
# Demais Operadores
#
#Operador                  significado
#between  ...  and ...     entre dois valores ( inclusive )
#in ( .... )               lista de valores
#like                      com um padrao de caracteres
#is null                   é um valor nulo
#
SELECT  Empregado.nome, Empregado.salario			-- se empregado ganha entre 20 e 30
FROM  Empregado
WHERE  Empregado.salario BETWEEN  20  AND  30;
#
SELECT  Empregado.nome,  Empregado.Departamento_idDepartamento	-- puxa o nome e o departamento se o funcionario trabalha no departamento 3 ou 5
FROM  Empregado
WHERE  Empregado.Departamento_idDepartamento  IN  (3,5);
#
SELECT  Empregado.nome, Empregado.funcao	-- puxa o nome e o cargo de funcionarios que começam com a letra 'L'
FROM  Empregado
WHERE   Empregado.nome  LIKE  'L%';
#
SELECT Empregado.nome, Empregado.funcao	-- puxa o nome e o cargo se o funcionario não ganha comissao
FROM  Empregado
WHERE  Empregado.comissao  IS  NULL;
#
# Operadores Negativos
#
#operador               descrição
#<>                     diferente
#not nome_coluna =      diferente da coluna
#not nome_coluna >      não maior que
#not between            não entre dois valores informados
#not in                 não existente numa dada lista de valores
#not like               diferente do padrao de caracteres informado
#is not null            não é um valor nulo
#
############################################################################
# Selecione os Empregados cujos salários sejam
#menores que 1000 ou maiores que 3500.
############################################################################
#
SELECT Empregado.nome,  Empregado.salario		-- puxa o nome e o salario dos funcionarios não esteje entre 1000 e 3500
FROM  Empregado
WHERE  Empregado.salario  NOT  BETWEEN  1000  AND  3500;
#
############################################################################
# Apresente todos os funcionários com salários
#entre 3400 e 4000 e que sejam balconistas.
############################################################################
#
# Operadores  "AND" (E) e  "OR" (OU).
#
SELECT Empregado.nome, Empregado.salario, Empregado.funcao	-- puxa o nome e salario se o salario for entre 3400 e 5000 e tem que ser balconista
FROM  Empregado
WHERE  Empregado.salario  BETWEEN  3400 AND 5000
AND  Empregado.funcao =  'balconista';
#
############################################################################
# Apresente todos os funcionários com salários
#entre 3400 e 4000 ou que sejam balconistas.
############################################################################
#
SELECT Empregado.nome, Empregado.salario, Empregado.funcao
FROM  Empregado
WHERE Empregado.salario  BETWEEN  3400 AND 5000 -- puxa o nome e salario se o salario for entre 3400 e 5000  ou tem que ser balconista
OR  Empregado.funcao =  'balconista';
#
#
############################################################################
# Apresente o nome de todos os empregados em letras minúsculas.
############################################################################
#
# Funções de Caracteres
#Lower - 		força caracteres maiúsculos aparecerem em minúsculos.
#Upper - 		força caracteres minúsculos aparecerem em maiúsculos.
#Concat(x,y)- 		concatena a string "x" com a string "y".
#Substring(x,y,str)- 	extrai um substring da string "str", começando em "x", e termina em "y".
#To_Char(num)- 		converte um valor numérico para  uma string de caracteres.
#To_Date(char,fmt)- 	converte uma string caracter em uma data.
#
SELECT LOWER( Empregado.nome )	-- deixa todos os nome minusculos
FROM Empregado;
#
############################################################################
# Apresente o nome de todos os empregados (somente as 5 primeiras letras).
############################################################################
#
SELECT SUBSTRING(Empregado.nome,1,5) FROM Empregado;	-- pua os dados mas só mostra até o cracter 5(LEONARDO => LEON)
#
############################################################################
# Apresente a Média, o Maior, o Menor e também a Somatória
#dos Salários pagos aos empregados.
############################################################################
#
# Funções Agregadas (ou de Agrupamento)
#
#função        retorno
#avg(n)        média do valor n, ignorando nulos
#count(expr)   vezes que o número da expr avalia para algo nao nulo
#max(expr)     maior valor da expr
#min(expr)     menor valor da expr
#sum(n)	       soma dos valores de n, ignorando nulos
#
SELECT  AVG(Empregado.comissao)  FROM  Empregado;	-- media de comissão
#
SELECT  MIN(Empregado.comissao)  FROM  Empregado;	-- menor comissão
#
SELECT  MAX(Empregado.comissao)  FROM Empregado;	-- menor comissão
#
SELECT  SUM(Empregado.comissao) FROM  Empregado;	-- soma das comissões
#
############################################################################
# Apresente a média de comissão pagos por departamento.
############################################################################
#
SELECT Empregado.Departamento_idDepartamento, AVG(Empregado.comissao)	-- fazendo a media da comissão pordepartamento
FROM Empregado
GROUP BY Empregado.Departamento_idDepartamento;
#
############################################################################
#  Retome o problema anterior, porém apresente resposta
#apenas para departamentos com mais de 2 empregados.
############################################################################
#
SELECT  Empregado.Departamento_idDepartamento, AVG(Empregado.comissao)	-- media de comissão de departamento sendo maior de 2
FROM  Empregado
GROUP BY Empregado.Departamento_idDepartamento
HAVING COUNT(*) > 2;
#
############################################################################
# Listar Nomes de Empregados, Cargos e
#Nome do Departamento onde o empregado trabalha.
############################################################################

#neste caso, o uso de ALIAS é desnecessário
SELECT A.nome, A.funcao, B.nome			 -- não funcionou |-__-|, mas em tese é para juntar 2 tabelas
FROM Empregado A, Departamento B
WHERE A.idDepartamento = B.Departamento_idDepartamento;

#
############################################################################
# Liste os Códigos de Cada Funcionário, seus Nomes, seus Cargos
#e o nome do Gerente ao qual este se relaciona.
############################################################################

# neste caso, o uso de ALIAS é fundamental
SELECT  A.idEmpregado, A.nome, A.funcao, B.nome "CHEFE"	-- está juntando as tabelas empregado A e B e mostrando id,nome,função e o chefe
FROM  Empregado A, Empregado B
WHERE  A.idGerente  = B.idEmpregado;

#
############################################################################
# INSERT
############################################################################
#
INSERT INTO Departamento (DEPNUME,DEPNOME,DEPLOCA) VALUES (70,"PRODUCAO","RIO DE JANEIRO");
#
############################################################################
# UPDATE
############################################################################
#
UPDATE EMP SET Empregado.salario = Empregado.salario* 1.2 WHERE Empregado.salario< 1000;
#
############################################################################
# DELETE
############################################################################
#
DELETE FROM Empregado WHERE Empregado.salario > 5000;
#
############################################################################
# FIM DO SUPORTE DO MYSQL
############################################################################
# Relacione todos os nomes de funcionários e seus respectivos
#cargos, desde que o orçamento do departamento seja igual a 10000.
############################################################################
#
SELECT  A.nome, A.funcao	-- mostrar os empregados onde o departamento tem 10.000 de orçamento cravado
FROM Empregado A
WHERE  10000 IN (SELECT Departamento.orcamento
                  FROM Departamento
                  WHERE Departamento.idDepartamento = A.Departamento_idDepartamento);
#
############################################################################
# Relacione todos os departamentos que possuem
#empregados com remuneração maior que 3000.
############################################################################
#
SELECT A.nome	-- departamento aonde tem empregados com salario superior a 10.000
FROM Departamento A
WHERE EXISTS (SELECT * FROM Empregado
              WHERE Empregado.salario > 3000 AND Empregado.Departamento_idDepartamento = A.idDepartamento);
#
############################################################################
# TRANSACOES
############################################################################
#
begin transaction;
  delete from empregado where salario > 500;
  if SQL_RECORDCOUNT > 20 THEN;
     ROLLBACK TRASACTION;
  else
     COMMIT;
  endif;
end transaction;
#
############################################################################
# VISOES
############################################################################
#
CREATE VIEW EMP_DEP		-- cria uma view usando empregado e departamento
AS SELECT E.nome Empregado, D.nome Departamento
FROM Empregado E, Departamento D
WHERE E.Departamento_idDepartamento = D.idDepartamento
#
# FIM SQL
#
