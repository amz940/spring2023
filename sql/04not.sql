SELECT * FROM customers;
SELECT CustomerName, Country FROM customers WHERE Country = 'Germany';

-- NOT 연산자 ( 제외하다 =! )
SELECT CustomerName, Country FROM customers WHERE NOT  Country = 'germany';

-- 예1) 1번 카테고리에 속하지 않는 상품들 조회
SELECT * FROM products WHERE NOT CategoryID = 1;
-- 예2) japan에 있지 않는 공급자들 조회
SELECT SupplierName, Country FROM suppliers WHERE NOT Country = 'japan';