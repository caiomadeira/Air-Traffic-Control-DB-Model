select matricula from alunos where matricula > 21103839 order by matricula;
select sysdate from dual;
select matricula, idade from alunos order by idade;
select nome, sexo from alunos where curso = '98AJ ' and idade + 1 = 24;
select avg(idade) from alunos;
select count(*), avg(nota) from historico where situacao != 'Ativo';
select nome from alunos order by nome DESC;