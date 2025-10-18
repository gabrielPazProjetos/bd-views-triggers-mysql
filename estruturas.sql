-- Criação das tabelas principais

CREATE TABLE Department (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(50),
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE
);

CREATE TABLE Employee (
    Ssn CHAR(9) PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Salary DECIMAL(10,2),
    Dno INT,
    FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
);

CREATE TABLE Dept_Locations (
    Dnumber INT,
    Dlocation VARCHAR(50),
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Project (
    Pnumber INT PRIMARY KEY,
    Pname VARCHAR(50),
    Plocation VARCHAR(50),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Department(Dnumber)
);

CREATE TABLE Works_On (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(5,2),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent (
    Essn CHAR(9),
    Dependent_name VARCHAR(50),
    Relationship VARCHAR(50),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);

-- Inserção de dados genéricos

INSERT INTO Department VALUES
(1, 'Tecnologia', '111111111', '2020-01-01'),
(2, 'Pessoal', '222222222', '2019-05-10');

INSERT INTO Employee VALUES
('111111111', 'Alex', 'Ferreira', 5000.00, 1),
('333333333', 'Bianca', 'Oliveira', 3000.00, 1),
('444444444', 'Carlos', 'Mendes', 3200.00, 2),
('222222222', 'Diana', 'Lopes', 5500.00, 2);

INSERT INTO Dept_Locations VALUES
(1, 'Unidade A'),
(2, 'Unidade B');

INSERT INTO Project VALUES
(10, 'Sistema Web', 'Unidade A', 1),
(20, 'Seleção Interna', 'Unidade B', 2);

INSERT INTO Works_On VALUES
('111111111', 10, 20),
('444444444', 20, 25),
('222222222', 20, 10);

INSERT INTO Dependent VALUES
('111111111', 'João', 'Filho'),
('444444444', 'Maria', 'Filha');
