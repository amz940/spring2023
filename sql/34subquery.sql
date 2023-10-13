-- 비상관쿼리 : 외부 쿼리 컬럼이 내부쿼리 컬럼에 사용되지 않을 때
# 여태까지 사용했던 쿼리들이 전부 비상관쿼리

-- 상관쿼리 : 외부 쿼리의 컬럼이 내부쿼리에 사용될 때
-- 검색 결과가 많아질 수 있기 때문에 성능에 주의

-- 각 공급자가 있는 나라의 고객 수는?
USE w3schools;

SELECT * FROM suppliers;

SELECT COUNT(*) FROM customers
WHERE Country = (SELECT Country FROM suppliers WHERE  SupplierID = 1);
SELECT COUNT(*) FROM customers
WHERE Country = (SELECT Country FROM suppliers WHERE  SupplierID = 2);
SELECT COUNT(*) FROM customers
WHERE Country = (SELECT Country FROM suppliers WHERE  SupplierID = 3);

SELECT COUNT(*) FROM suppliers;
SELECT
    s.supplierID,
(SELECT COUNT(*) FROM customers
                 WHERE customers.Country = s.Country )
    AS 'Number Of Customers'
FROM suppliers s;
-- 외부 테이블의 레코드가 내부 테이블의 레코드로 들어가서 한번씩 다 실행한다
-- supliers 레코드가 29개니 29번 실행 --> 결과도 29개

-- 예) 각 직원보다 나이가 많은 직원의 수 (lastName, numberofemp
SELECT COUNT(*) FROM employees;
SELECT
    e.lastName,
(SELECT COUNT(*) FROM employees
                 WHERE employees.BirthDate < e.BirthDate)
AS 'Number of Emp'
FROM employees e
ORDER BY `Number of Emp`;
