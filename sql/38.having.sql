-- HAVING : 그룹함수 연산결과를 조건으로 줄 수 있는 키워드
SELECT * FROM
 (SELECT c.CustomerName, SUM(p.Price * od.Quantity) `주문 금액`
    FROM customers c
         JOIN orders o  ON o.CustomerID = c.CustomerID
         JOIN orderdetails od ON od.OrderID = o.OrderID
         JOIN products p ON p.ProductID = od.ProductID
GROUP BY c.CustomerID) t1
WHERE t1.`주문 금액` >= 100000;

-- HAVING
SELECT c.CustomerName, SUM(p.Price * od.Quantity) `주문 금액`
    FROM customers c
         JOIN orders o
              ON o.CustomerID = c.CustomerID
         JOIN orderdetails od
              ON od.OrderID = o.OrderID
         JOIN products p
              ON p.ProductID = od.ProductID
GROUP BY c.CustomerID
HAVING `주문 금액` >= 100000;

-- 예) 총 처리 금액 10만 달러 미만인 직원 조회
SELECT e.LastName, e.FirstName, SUM(p.Price * od.Quantity) `주문 금액`
FROM employees e
    JOIN orders o ON o.EmployeeID = e.EmployeeID
    JOIN orderdetails od ON o.OrderID = od.OrderID
    JOIN products p ON  p.ProductID = od.ProductID
GROUP BY e.EmployeeID
HAVING  `주문 금액` < 100000;

