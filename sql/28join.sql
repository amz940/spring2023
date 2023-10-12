USE w3schools;

SELECT * FROM products;

SELECT * FROM categories;

-- chais 상품의 카테고리명은?
SELECT CategoryID FROM products
WHERE ProductName = 'chais';

SELECT CategoryName FROM categories
WHERE CategoryID = 1;

-- JOIN : 2개 이상의 테이블을 합쳐서 검색한다
SELECT *
FROM categories JOIN products;

SELECT COUNT(*)
FROM categories Join products;

SELECT COUNT(*)
FROM categories; -- 8
SELECT COUNT(*)
FROM products; -- 77

CREATE TABLE table_a(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20),
    category_id INT
);
CREATE TABLE table_b (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(20)
);
INSERT INTO table_b (category_name)
VALUE ('음료수'), ('반찬');
INSERT INTO table_a (product_name, category_id)
VALUE ('콜라',1),
        ('사이다',1),
        ('제육',2),
        ('돈까스',2),
        ('두부',2);

SELECT * FROM table_a JOIN table_b;
-- 두 테이블을 결합하면 조회된 레코드 수는
-- A 테이블 recode의 갯수 * B 테이블 recode의 갯수 // 10개
-- 컬럼 수는 A테이블 열의 갯수 + B테이블 열의 갯수 // 4개
-- 카테시안 곱 방식으로 연산

SELECT * FROM table_a JOIN table_b
WHERE table_a.product_name = '콜라'
-- 컬럼명이 하나의 테이블에만 있을 때 테이블명 생략가능
AND table_a.category_id = table_b.category_id;
-- 같은 컬럼명이 여러테이블에 있다면 테이블 명 작성

SELECT * FROM table_a JOIN table_b
ON table_a.category_id = table_b.category_id -- join 조건
WHERE product_name = '콜라';

SELECT CategoryName, ProductName, ProductID
FROM products AS p JOIN categories c
ON p.CategoryID = c.CategoryID
WHERE ProductName = 'chais';

-- 예) chais 상품의 공급자명, 전화번호
SELECT SupplierName, Phone
FROM suppliers JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE ProductName = 'chais';
-- 예) 1996년 7월 4일에 주문한 고객명 (customers, orders)
SELECT *
FROM customers c JOIN orders o
ON c.CustomerID = o.CustomerID
# ON c.OrderID = o.OrderID;
WHERE OrderDate = '1996-07-04';

SELECT *
FROM customers c JOIN orders o;
SELECT * FROM orders;
-- 예) 1996년 7월 4일에 주문을 담당한 직원명 (employees, orders)
SELECT FirstName, LastName
FROM orders o JOIN employees e
ON e.EmployeeID = o.EmployeeID
WHERE OrderDate = '1996-07-04';

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM suppliers;
SELECT COUNT(*) FROM categories;
-- 3개 테이블 조회
SELECT COUNT(*)
FROM products, suppliers, categories; -- 17864

SELECT *
FROM products p
    JOIN suppliers s
            ON p.SupplierID = s.SupplierID
#     ON p.ProductID = s.
    JOIN categories c
            ON p.CategoryID = c.CategoryID
WHERE p.ProductName = 'chais';

-- 예) 'chang' 상품의 공급자명, 카테고리명 조회
SELECT SupplierName, CategoryName, ProductName
FROM suppliers s
    JOIN categories cate
        ON s.SupplierID = cate.CategoryID
    JOIN products p
        ON s.SupplierID = p.SupplierID
WHERE p.ProductName = 'chang';
-- 예) 1996년 7월 9일에 주문한 고객명과 처리한 직원명
SELECT OrderDate, CustomerName, LastName, FirstName
FROM orders o
    JOIN customers c
        ON o.CustomerID = c.CustomerID
    JOIN employees e
        ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate = '1996-07-09';

-- 예) 1996년 7월 9일에 주문한 상품명 (orders, orderDetails, products)
SELECT *
FROM orderdetails od
    JOIN products p
        ON  od.ProductID = p.ProductID
    JOIN orders o
        ON  od.OrderID = o.OrderID
WHERE OrderDate = '1996-07-09';

-- 예) 'chang' 상품이 주문된 날짜들
SELECT OrderDate, ProductName, CustomerName,
       CONCAT(FirstName,' ',LastName) 'Full Name'
FROM products p
    JOIN orderdetails od
        ON p.ProductID = od.ProductID
    JOIN orders o
        ON od.OrderID = o.OrderID
    JOIN customers c
        ON o.CustomerID = c.CustomerID
    JOIN employees e
        ON o.CustomerID = c.CustomerID
WHERE ProductName = 'chang';