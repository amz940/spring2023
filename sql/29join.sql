USE w3schools;

SELECT *
FROM products p JOIN suppliers s
ON p.SupplierID = s.SupplierID;

SELECT *
FROM products p JOIN suppliers s
USING (SupplierID);

SELECT *
FROM products p NATURAL  JOIN suppliers s;

-- 3가지 다 같은 결과를 나타낸다