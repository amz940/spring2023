-- LIMIt 조회 레코드(행 , row) 제한
SELECT * FROM customers;
SELECT * FROM customers
LIMIT 3;
SELECT * FROM employees
ORDER BY BirthDate
LIMIT 2;

SELECT * FROM products
ORDER BY Price DESC
LIMIT 4;

-- 예) 가장 어린 3명의 직원 조회
SELECT * FROM employees
ORDER BY BirthDate DESC
LIMIT 3;
-- 예) 2번 카테고리에서 가장 저렴한 상품 조회
SELECT * FROM products
WHERE CategoryID = 2
ORDER BY Price
LIMIT 1;

-- Limit n : n개
-- LIMIT n, m : n번 부터 m 개 추가(n은 0번 가능)
SELECT ProductName, Price FROM products
ORDER BY Price
LIMIT 3,3;

-- 페이지 나누기
SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID; -- 91 row

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID -- 1페이지 10개
LIMIT 0, 10;

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID -- 2페이지 10개
LIMIT 10, 10; -- index는 0부터 시작하기 때문 10번이 11번째다

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID -- 3페이지 10개
LIMIT 20, 10;

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID -- 마지막 페이지 10개
LIMIT 90, 10;

-- 예) 공급자(suppliers)를 한 페이지에 공급자번호 순으로 5개씩 보여줄 때
--     3번째 페이지 조회 코드 작성
SELECT SupplierID, SupplierName FROM suppliers
ORDER BY SupplierID
LIMIT 10, 5;

-- 한페이지가 n개의 row(레코드)로 보여주면
-- m번재 페이지 조회는
-- LIMIT (m-1)*n , n
-- 단 LIMIT에는 연산자를 사용할 수 없다보니 ?에 작성할때 ` `를 사용해서 넣어준다
