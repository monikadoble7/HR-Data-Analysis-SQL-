CREATE DATABASE hrdata;
USE hrdata;
SELECT*FROM EMPLOYEES;
-- TOTAL EMPLOYEES
SELECT COUNT(*) AS Total_Employees FROM Employees;
-- TOTAL OLD EMPLOYEES
SELECT COUNT(*) AS Total_Employees FROM Employees where dateoftermination !='';
-- TOTAL CURRENT EMPLOYEES
SELECT COUNT(*) AS Total_Employees FROM Employees where dateoftermination ='';
-- AVERAVGE SALARY
SELECT AVG(Salary) AS Avg_Salary FROM employees;
-- AVERAVGE AGE
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB,'%d- %m- %Y'),CURDATE())) AS Avg_Age FROM employees;
-- AVERAVGE YEAR IN COMPANY
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DateofHire,'%d- %m- %Y'),CURDATE())) AS Avg_Year_in_company FROM employees;
-- ADDING NEW COLUMN FOR EMPLOYEE CURRENT STATUSS
ALTER TABLE employees ADD EmployeeCureentStatus INT;
-- UPDATING VALUES FOR NEW COLUMN 
SET SQL_SAFE_UPDATES=0;
UPDATE employees SET EmployeeCureentStatus=CASE WHEN DateofTermination=''THEN 1 ELSE 0 END;
-- CALCULATION VALUES
SELECT (CAST(COUNT(CASE WHEN EmployeeCureentStatus=0 THEN 1 END) as FLOAT)/COUNT(*))* 100 AS Attrition_Rate FROM employees;
-- GET COLUMN NAMES AND DATA TYPES( describe employees)
SHOW COLUMNS FROM employees;
-- PRINT 1ST 5 ROWS
SELECT*FROM employees LIMIT 5;
-- PRINT LAST 5 ROWS
SELECT*FROM employees order by EmpID DESC LIMIT 5;
-- CHANGING DATA TYPE OF SALARY 
ALTER TABLE employees modify column salary decimal(10,2);
-- CONVERT ALL DATE COLUMNS IN PROPER DATES
UPDATE employees
SET DOB=STR_TO_DATE(DOB, '%d-%m-%Y');
UPDATE employees
SET DateofHire=STR_TO_DATE(Dateofhire, '%d-%m-%Y');
UPDATE employees
SET LastPerformanceReview_Date=STR_TO_DATE(LastPerformanceReview_Date, '%d-%m-%Y');
-- ALTER TABLE
ALTER TABLE employees
modify column DOB DATE,
modify column Dateofhire DATE,
modify column LastPerformanceReview_Date DATE;
DESCRIBE employees;
-- (SELECT DOB, Dateofhire, Dateoftermination, LastPerformanceReview_Date FROM employees;)
UPDATE employees SET Dateoftermination='CurrentlyWorking' WHERE Dateoftermination IS NULL OR Dateoftermination='';
-- COUNT OF EMPLOYEES MARITAL STAUTS WISE 
SELECT Maritaldesc, COUNT(*) AS Count FROM Employees group by MaritalDesc order by Count desc;
-- COUNT OF EMPLOYEES DEPARTMENT
SELECT department, COUNT(*) AS Count FROM Employees group by Department order by Count desc;
-- COUNT OF EMPLOYEES POSITION
SELECT position, COUNT(*) AS Count FROM Employees group by position order by Count desc;
-- SALARY DISTRIBUTION BY EMPLOYEES
SELECT CASE 
WHEN SALARY <30000 THEN '<30K'
WHEN SALARY BETWEEN 30000 AND 49999 THEN '30K - 49K'
WHEN SALARY BETWEEN 50000 AND 69999 THEN '50K - 69K'
WHEN SALARY BETWEEN 70000 AND 89999 THEN '70K - 89K'
WHEN SALARY >= 90000 THEN '90K and ABOVE'
END AS salary_Range,
COUNT(*)AS Frequency 
FROM employees GROUP BY salary_Range ORDER BY salary_Range;
-- AVERAGE SALARY BY DEPARTMENT
SELECT Department,
AVG(salary) AS AverageSalary FROM employees GROUP BY Department ORDER BY Department;
-- COUNT TERMINATION BT CAUSE 
SELECT TermReason, COUNT(*) AS Count FROM employees WHERE TermReason IS NOT NULL GROUP BY TermReason ORDER BY count DESC;
-- COUNT TERMINATION BT STATE 
SELECT State, COUNT(*) AS Count FROM employees GROUP BY State ORDER BY count DESC;
-- GENDER DISTRIBUTION
SELECT Sex, COUNT(*) AS Count FROM employees GROUP BY Sex ORDER BY count DESC;
-- GETTING AGE DISTRIBUTION (AAD A NEW COLUMN AGE)
ALTER TABLE employees ADD COLUMN AGE INT;
-- UPDATE THE AGE COLUMN WITH CALCULATED AGE 
set sql_safe_updates=0;
UPDATE Employees SET Age = TIMESTAMPDIFF(YEAR,DOB,CURDATE());
-- AGE DISTRIBUTION 
SELECT CASE 
WHEN AGE <20 THEN '<20'
WHEN AGE BETWEEN 20 AND 29 THEN '20K - 29K'
WHEN AGE BETWEEN 30 AND 39 THEN '30K - 39K'
WHEN AGE BETWEEN 40 AND 49 THEN '40K - 49K'
WHEN AGE BETWEEN 50 AND 59 THEN '50K - 59K'
WHEN AGE >= 60 THEN '60 and ABOVE'
END AS AGE_Range, COUNT(*) AS count FROM employees GROUP BY AGE_Range;
-- ABSENCES BY DEPARTMENT 
SELECT Department, SUM(Absences) AS TotalAbsences FROM employees GROUP BY Department ORDER BY TotalAbsences DESC;
-- Totalsalary BY DEPARTMENT 
SELECT Department, SUM(Salary) AS Totalsalary FROM employees GROUP BY Department ORDER BY Totalsalary DESC;
-- COUNT OF EMPLOYEES TERMINATED AS PER MARTIAL STATUS 
SELECT MaritalDesc, COUNT(*) AS TerminatedCount FROM employees WHERE termd=1 GROUP BY MaritalDesc ORDER BY TerminatedCount DESC;
-- AVERAGE Performance SCORE
SELECT PerformanceScore,AVG(Absences) AS AverageAbsences FROM employees GROUP BY PerformanceScore ORDER BY PerformanceScore;
-- EMPLOYEE COUNT BY RECRUITMENT SCORE
SELECT RecruitmentSource, COUNT(*) AS EmployeeCount FROM employees GROUP BY RecruitmentSource ORDER BY EmployeeCount DESC;
