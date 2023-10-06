SELECT * FROM employees;

SELECT *
FROM employees
ORDER BY BirthDate;

SELECT *
FROM employees
ORDER BY 4;
SELECT EmployeeID, LastName, BirthDate
FROM employees
ORDER BY 1;

SELECT * FROM products
ORDER BY CategoryID, Price ASC; -- 오름차순(생략가능)
SELECT * FROM products
ORDER BY CategoryID, Price DESC; -- 내림차순(생략불가)
SELECT * FROM products
ORDER BY CategoryID DESC , Price;
SELECT * FROM products
ORDER BY CategoryID DESC , Price DESC ;

-- 예) 고객을 국가명 오름차순으로 조회
SELECT * FROM customers
ORDER BY Country;
-- 예) 가격이 비싼 상품이 먼저 조회되도록 코드 작성
SELECT ProductID, ProductName, Price FROM products
ORDER BY Price DESC ;
-- 예) 가장 어린 직원이 먼저 조회되도록 코드 작성
SELECT EmployeeID, LastName, BirthDate FROM employees
ORDER BY BirthDate DESC ;

SELECT * FROM products
WHERE CategoryID = 1
ORDER BY Price DESC ;