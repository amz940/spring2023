SELECT * FROM products WHERE ProductID = 1;
SELECT Price + 1 FROM products WHERE ProductID = 1;
SELECT Price - 10.5 FROM products WHERE ProductID = 1;
SELECT Price * 3 FROM products WHERE ProductID = 1;

SELECT ProductName, Price / 2
FROM products;

SELECT ProductName + 1 , Price
FROM products;  -- 문자열 연결연산은 안된다

SELECT CONCAT(ProductName, 1), Price FROM products; -- 문자열 연결은 concat 사용

-- 1968-12-08 문자열
SELECT LastName, BirthDate FROM employees WHERE EmployeeID = 1;
-- 19681209 숫자로 바뀜
SELECT LastName, BirthDate + 1 FROM employees WHERE EmployeeID = 1;
-- 날짜 변경 함수를 사용
-- 1968-12-09
SELECT LastName, ADDDATE(BirthDate, INTERVAL 1 DAY )
FROM employees WHERE EmployeeID = 1;

SELECT  EmployeeID, LastName, FirstName FROM employees;
-- 문자열 연결
SELECT  EmployeeID, CONCAT(LastName, FirstName) FROM employees;
-- 문자열 연결 후 한칸 뛰우기
SELECT  EmployeeID, CONCAT(LastName,' ', FirstName) FROM employees;
-- 날짜 1년 추가해서 변경
SELECT  EmployeeID,
        CONCAT(LastName,' ', FirstName),
        ADDDATE(BirthDate, INTERVAL 1 YEAR ),
        -- 날짜를 빼고 싶을땐 - 를 붙인다
        ADDDATE(BirthDate, INTERVAL -1 MONTH )
FROM employees;

-- 예) 주문 수량(quantity) * 2 결과 조회( orderDetails 테이블)
SELECT Quantity * 2 FROM orderdetails;
-- 예) "city, country" 고객 테이블 조회
SELECT CustomerName ,CONCAT(City, ', ', Country) FROM customers;