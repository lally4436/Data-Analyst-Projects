ALTER TABLE hr_2csv
ADD CONSTRAINT FK_EmployeeID
FOREIGN KEY (EmployeeNumber) REFERENCES hr_1cvs(EmployeeID);
/*
ALTER TABLE hr_2 ADD COLUMN Employee_ID int;
SET SQL_SAFE_UPDATES = 0;

UPDATE hr_2 SET Employee_ID = `Employee ID`;
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE hr_2 DROP COLUMN `Employee ID`;*/

/*Q1 .Average Attrition rate for all Departments*/
SELECT Department,
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AverageAttritionRate
FROM  hr_1
GROUP BY Department;
/*Q2 .Average Hourly rate of Male Research Scientist*/
SELECT JobRole,Gender,
       AVG(HourlyRate) AS AverageHourlyRate
FROM hr_1 where JobRole='Research Scientist' and Gender='Male';
/*Q3.Attrition rate Vs Monthly income stats*/
SELECT T1.Attrition,
       T2.MonthlyIncome
FROM hr_1 T1
JOIN hr_2 T2 ON T1.EmployeeNumber = T2.Employee_ID;
/*Q4.Average working years for each Department*/
SELECT T1.Department,
       AVG(T2.YearsAtCompany) AS AverageWorkingYears
FROM hr_1 T1
JOIN hr_2 T2 ON T1.EmployeeNumber = T2.Employee_ID
GROUP BY T1.Department;
/*Q5.Job Role Vs Work life balance*/
SELECT T1.JobRole, T2.WorkLifeBalance
FROM hr_1 T1
JOIN hr_2 T2 ON T1.EmployeeNumber = T2.Employee_ID;
/*Q6.Attrition rate Vs Year since last promotion relation*/
SELECT T1.Attrition, T2.YearsSinceLastPromotion
FROM hr_1 T1
JOIN hr_2 T2 ON T1.EmployeeNumber = T2.Employee_ID;











