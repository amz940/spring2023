-- SELECT : 데이터 조회( 읽기, 검색, 가져오기 )
-- SELECT의 schema들
SELECT * FROM w3schools.customers;
SELECT * FROM w3schools.employees;
SELECT * FROM w3schools.products;

SELECT * FROM categories;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM shippers;
SELECT * FROM suppliers;

--
SELECT customerID-- column 명 나열 , column = 테이블안에 있는 그룹 이름
FROM customers -- table 명 나열
;

SELECT CustomerID, CustomerName
FROM customers;
SELECT  CustomerID, CustomerName, Country
FROM customers;
-- column을 나열한 순서대로 출력된다
SELECT Country, CustomerID, CustomerName
FROM customers;

SELECT * -- 전체 컬럼 선택
FROM customers;

-- 예1) 직원(employees)의 lastName, firstName, birthDate 조회
-- 예2) 상품(products)의 이름(productName), 단위(unit), 가격(price) 조회
-- 예3) 공급자(suppliers)의 이름(supplierName), 주소(address), 국가(country) 조회
# 예1)
SELECT LastName, FirstName, BirthDate
FROM employees;
# 예2)
SELECT ProductName, Unit, Price
FROM products;
# 예3)
SELECT SupplierName, Address, Country
FROM suppliers;

-- 고객테이블의 국가 컬럼 조회
SELECT Country FROM customers; -- 91개 row(record)

-- DISTINCT : 중복 제거
SELECT DISTINCT Country FROM customers; -- 21개 row(record)

SELECT City, Country FROM customers; -- 91개 row
SELECT DISTINCT City, Country FROM customers; -- 69개 row

-- COUNT : row(행, record)의 수
SELECT COUNT(Country) FROM customers; -- 91개 row
SELECT COUNT(DISTINCT Country) FROM customers; -- 21개 row

-- 전체 행의 수
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM employees;

-- 예1) 공급자들이 있는 나라 수
-- 예2) 주문(Orders) 건 수
-- 예3) 몇 개의 카테고리가 있는 지 조회
-- 예4) 고객이 있는 도시의 수 (중복 없이)
#1
SELECT COUNT(Country) FROM suppliers;
#2
SELECT COUNT(*) FROM orders;
#3
SELECT COUNT(*) FROM categories;
#4
SELECT COUNT(DISTINCT City) FROM customers;
