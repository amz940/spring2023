USE w3schools;

-- 같은 테이블끼리 조인해서 검색
-- 객체값을 따로 부여해야 한다
SELECT *
FROM employees e1 JOIN  employees e2;

SELECT e1.LastName , e1.BirthDate
FROM employees e1 JOIN  employees e2
WHERE e1.BirthDate < e2.BirthDate
AND e2.LastName = 'Leverling';

-- 예) ipoh coffee 보다 비싼 상품명 조회
SELECT p1.ProductID ,p1.ProductName, p1.Price
FROM products p1 JOIN products p2
WHERE p1.Price > p2.Price
AND p2.ProductName = 'Ipoh Coffee'
ORDER BY 1;

