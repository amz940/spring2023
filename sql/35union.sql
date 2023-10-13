-- union 합집합

USE w3schools;

SELECT Country FROM customers;
SELECT Country FROM suppliers;

SELECT Country FROM customers
UNION -- 55rows // 중복 제거
SELECT Country FROM suppliers;

SELECT Country FROM customers
UNION ALL -- 237 rows  // 중복 포함
SELECT Country FROM suppliers;

SELECT CustomerName, Country, City FROM customers
UNION
SELECT SupplierName, Country, Address FROM suppliers;
--   컬럼의 수만 서로 일치 하면 된다. 컬럼 명이랑은 상관없음!

-- 예) 직원의 lastName과 firstName을 name 이라는 하나의 컬럼의 조회
SELECT LastName name  FROM employees
UNION
SELECT FirstName FROM employees;

-- FULL OUTER JOIN  = Union
USE mydb1;


-- LEFT OUTER JOIN
SELECT * FROM my_table44_a a LEFT JOIN my_table45_b b
ON a.col1 = b.col1;
-- RIGHT OUTER JOIN
SELECT * FROM my_table44_a a RIGHT JOIN  my_table45_b b
ON a.col1 = b.col1;
-- LEFT OUTER JOIN  + RIGHT OUTER JOIN = FULL OUTER JOIN
SELECT * FROM my_table44_a a LEFT JOIN my_table45_b b
ON a.col1 = b.col1
UNION
SELECT * FROM my_table44_a a RIGHT JOIN my_table45_b b
ON a.col1 = b.col1;
