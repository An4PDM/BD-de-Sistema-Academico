-- Inserção de dados
SELECT * FROM aluno;

INSERT INTO disciplina VALUES (1,'Software',150),(2,'Banco de Dados',150),(3,'Segurança',150),(4,'Gestão',150);
SELECT * FROM disciplina;

INSERT INTO aluno_disciplina VALUES (1,1),(1,2),(2,3),(2,4),(3,1),(3,4),(4,1),(4,3),(5,4);
SELECT * FROM aluno_disciplina;

DELIMITER /
CREATE PROCEDURE insere_turma(n VARCHAR(45), t VARCHAR(45))
BEGIN
	INSERT INTO turma (nome, turno) VALUES
    (n,t);
    SELECT * FROM turma;
END /
DELIMITER ;

CALL insere_turma('2A','noturno');
CALL insere_turma('3A','matutino');
CALL insere_turma('4A','diurno');
CALL insere_turma('5A','noturno');

DELIMITER /
CREATE PROCEDURE deleta_turma(t VARCHAR(45))
BEGIN
	DELETE FROM turma 
    WHERE nome=t;
	SELECT * FROM turma;
END /
DELIMITER ;

SET SQL_SAFE_UPDATES=0;
CALL deleta_turma('5A');
