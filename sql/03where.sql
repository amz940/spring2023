SELECT CustomerName, Address, City, Country FROM customers;

-- WHERE : 레코드 선택(솎아내기)
SELECT * FROM customers WHERE CustomerID = 1;
SELECT * FROM customers WHERE CustomerID = 2;
SELECT * FROM customers WHERE Country = 'USA';
SELECT * FROM customers WHERE Country = 'Mexico';
SELECT * FROM customers WHERE Country = 'mexico'; -- 대소문자 구분 안함
SELECT * FROM customers WHERE Country = 'France'; -- 문자열은 ''을 사용해서 작성

SELECT *
FROM customers
WHERE Country = 'Mexico';

-- 예) 영국(UK)에 사는 고객들 조회
SELECT * FROM customers WHERE Country = 'UK';
-- 예) 1번 카테고리에 속한 상품(Products)들 조회
SELECT * FROM products WHERE CategoryID = 1;
-- 예) Osaka에 있는 공급자들 조회
SELECT * FROM suppliers WHERE City = 'Osaka';

-- 미국에 사는 고객의 이름들 조회
SELECT CustomerName
FROM customers
WHERE Country = 'USA';
-- 영국에 사는 고객의 이름과 고객번호 조회
SELECT CustomerName, CustomerID
FROM customers
WHERE Country = 'UK';

-- 예) 2번 카테고리에 있는 상품명과 가격 조회
SELECT ProductName, Price
FROM products
WHERE CategoryID = 2;
-- 예) 일본에 있는 공급자의 이름(SupplierName)과 전화번호 조회
SELECT SupplierName, Phone
FROM suppliers
WHERE Country = 'Japan';
-- 예) 2번 카테고리의 이름(categoryName) 조회
SELECT CategoryName
FROM categories
WHERE CategoryID = 2;

--
SELECT *
FROM shippers;

SELECT CustomerID, CustomerName, City, Country
FROM customers;
