SELECT CustomerName, City, Country
FROM customers
WHERE Country = 'spain';

SELECT CustomerName, City, Country
FROM customers
WHERE City = 'Madrid';

SELECT CustomerName, City, Country
FROM customers
WHERE City != 'Madrid' AND Country = 'spain';

SELECT CustomerName, City, Country
FROM customers
WHERE NOT (City = 'Madrid' AND Country = 'spain');

SELECT CustomerName, City, Country FROM customers
WHERE City != 'Madrid' OR Country != 'spain';

SELECT CustomerName, City, Country FROM customers
WHERE Country = 'spain' OR Country = 'UK';

SELECT * FROM products
WHERE Price >= 10.00 AND Price <= 20.00;
SELECT * FROM customers
WHERE CustomerName >= 'c' AND CustomerName < 'd';
SELECT * FROM employees
WHERE BirthDate >= '1958-01-01' AND BirthDate < '1959-01-01';

-- 예) 스웨덴이나 이탈리아에 있는 공급자들 조회
SELECT * FROM suppliers
WHERE Country = 'sweden' or Country = 'italy';
-- 예) 1963년 8월 생 직원 조회
SELECT * FROM employees
WHERE BirthDate >= '1963-08-01' AND BirthDate < '1963-09-01';
-- 예) 가격이 100.00~200.00 사이인 상품 조회
SELECT ProductName, Price FROM products
WHERE Price >= 100.00 AND Price <= 200.00;
-- 예) 1997년 주문한 주문 조회
SELECT * FROM orders
WHERE OrderDate >= '1997-01=01' AND OrderDate < '1998-01-01';

-- 여러 연산자 조합시 ( ) 사용해서 우선순위 결정해줄 것
-- 예) 10달러 미만, 100 달러 이상
SELECT * FROM products
WHERE (Price <10.00 OR Price >= 100.00) AND  CategoryID = 1;

