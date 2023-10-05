-- < 작다
-- > 크다
-- >= 크거나 같다,  <= 작거나 같다

SELECT * FROM  products
WHERE price >= 10.00;

SELECT * FROM  products
WHERE price <= 10.00;

SELECT * FROM  products
WHERE price = 10.00;

SELECT * FROM  products
WHERE NOT price >= 10.00; -- 같지 않다

SELECT * FROM  products
WHERE price != 10.00; -- 같지 않다

SELECT * FROM  products
WHERE price <> 10.00; -- 같지 않다

SELECT * FROM customers
WHERE customers.CustomerID < 3;

SELECT * FROM customers
WHERE NOT customers.CustomerID < 3;

SELECT * FROM customers
WHERE CustomerName = 'Around the Horn';
SELECT * FROM customers
WHERE CustomerName < 'D';
SELECT * FROM customers
WHERE CustomerName >= 'R';

SELECT * FROM employees
WHERE BirthDate > '1960-01-01';
