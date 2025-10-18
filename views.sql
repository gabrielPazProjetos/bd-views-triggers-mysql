-- Views solicitadas no desafio

CREATE VIEW vw_empregados_por_depto_local AS
SELECT d.Dname, dl.Dlocation, COUNT(e.Ssn) AS total_empregados
FROM Department d
JOIN Dept_Locations dl ON d.Dnumber = dl.Dnumber
JOIN Employee e ON d.Dnumber = e.Dno
GROUP BY d.Dname, dl.Dlocation;

CREATE VIEW vw_departamentos_gerentes AS
SELECT d.Dname, d.Dnumber, e.Fname AS gerente_nome, e.Lname AS gerente_sobrenome
FROM Department d
JOIN Employee e ON d.Mgr_ssn = e.Ssn;

CREATE VIEW vw_projetos_mais_empregados AS
SELECT p.Pname, COUNT(w.Essn) AS total_empregados
FROM Project p
JOIN Works_On w ON p.Pnumber = w.Pno
GROUP BY p.Pname
ORDER BY total_empregados DESC;

CREATE VIEW vw_projetos_departamentos_gerentes AS
SELECT p.Pname, d.Dname, e.Fname AS gerente_nome
FROM Project p
JOIN Department d ON p.Dnum = d.Dnumber
JOIN Employee e ON d.Mgr_ssn = e.Ssn;

CREATE VIEW vw_empregados_dependentes_gerentes AS
SELECT DISTINCT e.Fname, e.Lname,
       CASE WHEN e.Ssn IN (SELECT Mgr_ssn FROM Department) THEN 'Sim' ELSE 'Não' END AS e_gerente
FROM Employee e
JOIN Dependent d ON e.Ssn = d.Essn;
