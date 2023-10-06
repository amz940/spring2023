SELECT * FROM employees;
SELECT CONCAT(LastName,', ', FirstName) FROM employees;
-- AS: 컬럼명(테이블 명) 변경
SELECT CONCAT(LastName,', ', FirstName) AS Name
FROM employees;

SELECT  EmployeeID,
        CONCAT(FirstName, ' ', LastName) AS FullName
FROM employees;
-- AS 생략 가능
-- ``(물결표시)로 키워드나 특수문자 사용 가능
SELECT  EmployeeID,
        CONCAT(FirstName, ' ', LastName) `Full Name`
FROM employees;

-- 예) 공급자의 이름(supplierName), 주소(address, city, country)
--     전화번호(phone number)
-- column명은 supplierName, address , phone number일껏
SELECT SupplierName,
       CONCAT(Address,' ', City, ' ', Country) Address,
       Phone `phone number`
FROM suppliers;

SELECT * FROM categories;

SELECT p.ProductName,
       c.CategoryName
    FROM products AS p
    JOIN w3schools.categories AS c
    on p.CategoryID = c.CategoryID;