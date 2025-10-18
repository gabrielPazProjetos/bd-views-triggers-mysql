-- Tabelas auxiliares para simulação de triggers

CREATE TABLE Deleted_Employee (
    Ssn CHAR(9),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Removal_Date DATETIME
);

CREATE TABLE Historico_Salario (
    Ssn CHAR(9),
    Salario_Antigo DECIMAL(10,2),
    Salario_Novo DECIMAL(10,2),
    Data_Alteracao DATETIME
);

-- Simulação de exclusão de empregado (substituindo trigger)

DELETE FROM Works_On WHERE Essn = '333333333';
DELETE FROM Dependent WHERE Essn = '333333333';
INSERT INTO Deleted_Employee VALUES ('333333333', 'Bianca', 'Oliveira', NOW());
DELETE FROM Employee WHERE Ssn = '333333333';

-- Simulação de atualização de salário

INSERT INTO Historico_Salario VALUES ('444444444', 3200.00, 3500.00, NOW());
UPDATE Employee SET Salary = 3500.00 WHERE Ssn = '444444444';
