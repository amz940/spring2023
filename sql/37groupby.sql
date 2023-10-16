USE w3schools;
-- GROUP BY : 그룹함수 사용 시 그룹함수의 범위 지정
--  (특정 그룹별로 집계함수)소계를 사용하고 싶을때 쓰인다
-- 명심하자 별칭 묶을땐 ' ' 가 아닌 ` ` 물결이다!

SELECT MAX(Price) FROM products;
-- 카테코리 id 별로 가장 비싼 가격 구하기
-- 집계함수에선 컬럼을 지정하는게 의미가 없었지만
-- 그룹함수에선 사용할 수 있다
SELECT CategoryID, MAX(Price) FROM products
GROUP BY CategoryID;

SELECT CategoryID, MIN(Price) min , MAX(Price) max
FROM products
GROUP BY CategoryID
ORDER BY max DESC ;

-- 일별 매출액 구하는 식
SELECT o.OrderDate, SUM(od.Quantity * p.Price) 매출액
FROM orderdetails od
    JOIN products p
        ON od.ProductID = p.ProductID
    JOIN orders o
        ON od.OrderID = o.OrderID
GROUP BY o.OrderDate;

-- 직원별 총 주문 처리액 조회
SELECT e.LastName, SUM(od.Quantity * p.Price)  매출액
FROM orderdetails od
    JOIN orders o
        ON od.OrderID = o.OrderID
     JOIN employees e
         ON o.EmployeeID =e.EmployeeID
    JOIN products p
        ON od.ProductID = p.ProductID
WHERE o.OrderDate > '1996-08-01' AND  o.OrderDate < '1996-09-01'
GROUP BY e.EmployeeID
ORDER BY 2 DESC ;

-- 고객별 총 주문 금액 조회
SELECT CustomerName, SUM(p.Price * od.Quantity) '주문 금액'
FROM customers c
    JOIN orders o
        ON o.CustomerID = c.CustomerID
    JOIN orderdetails od
        ON od.OrderID = o.OrderID
    JOIN products p
        ON p.ProductID = od.ProductID
GROUP BY c.CustomerID
ORDER BY `주문 금액` DESC ;
# ORDER BY '주문 금액' DESC ;
-- 왜 2지? 설마 컬럼 위치?

-- 10만 달러 이상 조회한 고객 조회
SELECT * FROM
 (SELECT CustomerName, SUM(p.Price * od.Quantity) `주문 금액`
    FROM customers c
         JOIN orders o
              ON o.CustomerID = c.CustomerID
         JOIN orderdetails od
              ON od.OrderID = o.OrderID
         JOIN products p
              ON p.ProductID = od.ProductID
GROUP BY c.CustomerID) t1
WHERE t1.`주문 금액` >= 100000;



