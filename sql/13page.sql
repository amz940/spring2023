-- page
SELECT * FROM suppliers;

SELECT COUNT(*) FROM suppliers; -- 29rows

-- 1페이지에 10개 rows
-- suppliers 목록은 3페이지가 마지막 페이지

-- COUNT(*) : record의 수 : 마지막 페이지
-- 1 ~ 10 개면            : 1 페이지
-- 11 ~ 20               : 2 페이지
-- 21 ~ 30               : 3 페이지

-- record의 수  n개이고 페이지당 10개씩 보여줄때 마지막 페이지 번호는?
-- ((n-1) / 10) + 1
