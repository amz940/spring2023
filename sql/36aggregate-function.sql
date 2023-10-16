USE w3schools;

-- 집합함수, 집계함수 라고도 쓰인다
-- MAX, MIN, COUNT, AVG, SUM ...

SELECT * FROM products;

-- MAX 최대값
SELECT MAX(Price) FROM products;

SELECT ProductName, Price FROM products
WHERE Price = (SELECT MAX(Price) FROM products);
-- 집합함수를 사용할때 원하는 컬럼값을 뽑을려면 서브쿼리를 이용해야 한다

SELECT MIN(Price) FROM products;

SELECT ProductName, Price FROM products
WHERE Price = (SELECT MIN(Price) FROM products);

-- 예) 가장 어린 직원 명 조회
SELECT LastName, FirstName , BirthDate FROM employees
WHERE BirthDate = (SELECT MAX(BirthDate) FROM employees);
-- 예) 가장 나이 많은 직원 명 조회
SELECT LastName, FirstName , BirthDate FROM employees
WHERE BirthDate = (SELECT MIN(BirthDate) FROM employees);

-- COUNT : 갯수
SELECT * FROM employees;

INSERT INTO employees (LastName)
VALUE ('흥민');

SELECT COUNT(EmployeeID) FROM employees;
SELECT COUNT(LastName) FROM employees; -- rows 11
SELECT COUNT(FirstName) FROM employees;
-- rows 10,
-- (MAX, MIN, COUNT, AVG, SUM.. 같은)집합함수는 NULL을 포함하지 않는다
-- 포함하는 집합함수 명령어가 있을수도 있다

INSERT INTO products (ProductName)
VALUE ('커피');

SELECT * FROM products ORDER BY 1 DESC ;
SELECT MIN(Price) FROM products;
SELECT MIN(IFNULL(Price, 0)) FROM products;
-- NULL값을 허용하지 않는 집합함수에 억지로라도 허용하고 싶을때 사용
-- IFNULL = NULL값이 있으면 디폴트값을 지정해주는것
SELECT * FROM products
WHERE IFNULL(Price, 0) = (SELECT MIN(IFNULL(Price, 0)) FROM products);
-- 서브쿼리 사용시 한쪽에서 IFNULL을 사용했으면 반드시 IFNULL를 같이 사용해줘야 한다

-- SUM : 합계
SELECT * FROM products;
SELECT SUM(Price) FROM products;

SELECT SUM(od.Quantity)
FROM orders o JOIN orderdetails od
ON o.OrderID = od.OrderID
WHERE o.OrderDate = '1996-07-04';

-- 예) 96년 7월 4일 매출액(그날 수량 * 가격) 구하기
SELECT SUM(od.Quantity * p.Price) AS 매출액
FROM orderdetails od
    JOIN products p
        ON p.ProductID = od.ProductID
    JOIN orders o
        ON od.OrderID = o.OrderID
WHERE o.OrderDate = '1996-07-04';

-- AVG : 평균
SELECT SUM(Price) FROM products; -- 2222.71
SELECT AVG(Price) FROM products; -- 28.866 , NULL을 뺀 77개로 나눠서 그렇다

SELECT COUNT(ProductID) FROM products; -- 78
SELECT COUNT(Price) FROM products; -- 77 , NULL 미포함