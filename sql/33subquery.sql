USE w3schools;

SELECT Price FROM products
WHERE ProductName = 'ipoh coffee';
SELECT productname, Price from products
where Price > 46;

SELECT ProductName, Price FROM products
WHERE Price > (SELECT Price FROM products
               WHERE ProductName = 'ipoh coffee');

-- query 안에 query가 들어오는걸 subquery 라고 한다
-- ( ) 안에 있는걸 내부커리 , ()를 포함하는 커리는 외부커리 라고 부른다

SELECT LastName, FirstName, BirthDate
FROM employees
WHERE BirthDate <
    (SELECT BirthDate FROM employees WHERE LastName = 'Leverling')
ORDER BY BirthDate;

-- subquery
-- 행 1개, 열 1개
SELECT  BirthDate FROM employees
WHERE LastName = 'Leverling';

-- 행(row, record) 여러개 , 열(column) 1개
SELECT ShipperID FROM orders WHERE OrderDate = '1996-07-08';

SELECT CustomerName FROM customers WHERE Country = 'mexico';

-- 행 여러개, 열 여러개
SELECT CustomerID, CustomerName FROM customers WHERE Country = 'mexico';

-- 행 1개, 열 1개 예제
-- 'tofu' 상품을 공급하는 공급자 명
SELECT SupplierID FROM products WHERE ProductName = 'tofu';
SELECT SupplierID, SupplierName FROM suppliers
WHERE SupplierID = 6;

SELECT SupplierID, SupplierName FROM suppliers
WHERE SupplierID = (SELECT SupplierID FROM products WHERE ProductName = 'tofu');

SELECT p.SupplierID, p.ProductName FROM suppliers s JOIN products p
ON  s.SupplierID = p.SupplierID
WHERE p.ProductName = 'tofu';

-- 여러행 1개열
-- 멕시코 고객이 주문한 일자들 조회
-- 값이 여러개 일땐 부등호가 안 먹힌다
SELECT OrderDate FROM orders
WHERE CustomerID IN (SELECT  CustomerID FROM customers WHERE Country = 'mexico');

-- 예1) 1번 카테고리에 있는 상품이 주문된 주문번호
SELECT ProductID FROM products WHERE CategoryID = 1;

SELECT OrderID FROM orderdetails
WHERE ProductID IN (SELECT ProductID FROM products Where CategoryID = '1');

-- 예2) 1번 카테고리에 있는 상품이 주문된 날짜
SELECT OrderID, OrderDate FROM orders
WHERE OrderID IN (SELECT OrderID FROM orderdetails
                  WHERE ProductID IN (SELECT ProductID FROM products Where CategoryID = '1'))
ORDER BY CustomerID DESC ;
-- row 354

SELECT  o.OrderID, o.OrderDate
FROM  orders o
    JOIN orderdetails od
        ON o.OrderID = od.OrderID
    JOIN products p
        ON od.ProductID = p.ProductID
WHERE p.CategoryID = 1
ORDER BY CustomerID DESC ;
-- row 404 -> order id가 굉장히 많이 겹침
-- 이유 : 카테시안 곱으로 시작하다 보니
-- orders 에도 order id가 있고,  orderdetails에도 orderid가 있어서
-- 둘이 결합하여 중복되는 바람에 row값이 증가했다
-- 해결 방안 : DISTINCT 쓰면 중복 제거 되어 값이 똑같이 나온다

-- 예) 주문한 적 없는 고객들
SELECT CustomerID FROM orders;
# 부정형이라 NOT IN , 주문한 적 있는 고객이라면 IN 쓰면 된다
SELECT * FROM customers WHERE CustomerID NOT IN(SELECT CustomerID FROM orders);

-- 행 여러개, 열 여러개
SELECT * FROM customers;

SELECT SupplierName, Address, Country FROM suppliers;

INSERT INTO customers(CustomerName, Address, Country)
VALUE ('name1','address1','country1');

INSERT INTO customers(CustomerName, Address, Country)
(SELECT SupplierName, Address, Country FROM suppliers);

INSERT INTO customers (CustomerName, Address, Country)
(SELECT ContactName, City, Phone FROM suppliers);
-- 외부 커리에서 선택한 컬럼수와 내부 커리에서 선택한 컬럼수가 일치해야 한다

SELECT * FROM customers
WHERE (City, Country)
IN  (SELECT City, Country FROM suppliers);

CREATE TABLE table_C
SELECT CustomerName, City, Country FROM customers;

SELECT * FROM  table_C;
DESC table_C;
-- 필드명이랑 파일만 가져오고 제약 사항은 들고 오지 않는다

-- 예) 1번 카테고리에 있는 상품들로 새 테이블을 만드는데
--     새로운 테이블은 productName, categoryName, price

CREATE TABLE table_d
SELECT p.ProductName, c.CategoryName, p.Price
FROM products p JOIN categories c
ON p.CategoryID = c.CategoryID
WHERE p.CategoryID = 1;

SELECT * FROM table_d;

