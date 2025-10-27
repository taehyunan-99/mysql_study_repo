# 내장 함수

# 테스트 데이터 생성
CREATE DATABASE practice_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE practice_db;

# 사용자 테이블 생성
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    birth_date DATE
);

# 상품 테이블 생성
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

# 주문 테이블 생성
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_status VARCHAR(20),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# users 데이터 삽입
INSERT INTO users (name, email, birth_date) VALUES
('홍길동', 'hong@example.com', '1990-05-10'),
('김영희', 'kim@example.com', '1985-11-20'),
('이철수', 'lee@example.com', '2000-03-15'),
('박민수', 'park@example.com', '1995-07-30'),
('정은지', 'jeong@example.com', '1993-01-01'),
('한지민', 'han@example.com', '1988-09-14'),
('장동건', 'jang@example.com', '1978-06-25'),
('신세경', 'shin@example.com', '1999-12-05'),
('유재석', 'yoo@example.com', '1972-08-14'),
('강호동', 'kang@example.com', '1970-06-11');

# products 데이터 삽입 (상품명에 카테고리 포함)
INSERT INTO products (product_name, price) VALUES
('갤럭시북 노트북', 1299000),
('맥북 에어 노트북', 1890000),
('로지텍 무선 마우스', 29900),
('앱코 유선 마우스', 19900),
('한성 기계식 키보드', 89000),
('로지텍 블루투스 키보드', 99000),
('삼성 27인치 모니터', 279000),
('LG 게이밍 모니터', 259000),
('삼성 외장 SSD', 139000),
('샌디스크 휴대용 SSD', 119000);

# orders 데이터 삽입
INSERT INTO orders (user_id, product_id, order_status, created_at) VALUES
(1, 1, '배송완료', '2025-03-20 10:00:00'),
(2, 2, '주문취소', '2025-03-21 15:30:00'),
(3, 3, '배송중', '2025-03-22 09:00:00'),
(4, 4, '배송완료', '2025-03-25 14:20:00'),
(5, 5, '결제완료', '2025-03-24 11:45:00'),
(6, 6, '배송완료', '2025-03-23 08:15:00'),
(7, 7, '결제완료', '2025-03-21 13:00:00'),
(8, 8, '배송중', '2025-03-22 10:30:00'),
(9, 9, '배송완료', '2025-03-20 17:45:00'),
(10, 10, '주문취소', '2025-03-19 19:25:00');

# ==============================================================================================================================

# 문자열 함수 (원본을 수정하지는 않음)
# CONCAT() = 문자열 결합 함수
SELECT name, birth_date, CONCAT(name, "(", birth_date, ")") name_with_birth
FROM users;
# CONCAT_WS() = 구분자 사용해서 연결
SELECT name, birth_date, CONCAT_WS("-", name, birth_date) name_with_birth
FROM users;

# LEFT() = 일부 문자열 추출(왼쪽부터)
SELECT product_name, LEFT(product_name, 2) FROM products;

# SUBSTRING() = 지정한 위치에서 문자열 추출
SELECT name, SUBSTRING(name, 2, 2) first_name FROM users;

# UPPER() = 대문자로 변환
SELECT name, email, UPPER(email) upper_email FROM users;

# REPLACE() = 일부 문자열을 변경
SELECT name, REPLACE(name, "이", "LEE") replaced_name FROM users;

# ==============================================================================================================================

SELECT * FROM products;

# 실습1. 문자열 함수(1)
# 1.
SELECT name, email, CONCAT(name, "(", email, ")") formatted_contact FROM users;

# 2.
SELECT email, SUBSTRING_INDEX(email, "@", -1) email_domain FROM users;

# 3.
SELECT product_name, SUBSTRING_INDEX(product_name, " ", -1) category_keyword FROM products;

# ==============================================================================================================================

# 수학 함수
# ROUND() = 반올림
SELECT ROUND(3.56); # 4
SELECT ROUND(1234.5678, 2); # 1234.57

# CEIL() = 올림
SELECT CEIL(3.26); # 4

# FLOOR = 내림
SELECT FLOOR(3.26); # 3

# MOD() = 나머지
SELECT MOD(10, 3); # 1

# ABS() = 절댓값
SELECT ABS(-100); # 100

# RAND() = 0~1 사이의 난수 생성
SELECT RAND(); # 0.10608202042624543

# ==============================================================================================================================

# 날짜 함수
# NOW(), CURDATE(), CURTIME() = 현재 날짜, 시간
SELECT NOW(); # 2025-10-27 10:30:41
SELECT CURDATE(); # 2025-10-27
SELECT CURTIME(); # 10:31:13

# DATEDIFF() = 날짜의 차이 계산
SELECT DATEDIFF(CURDATE(), "2025-10-26"); # 1

# DATE_ADD() = 날짜에 더하기
SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY); # 2025-10-30

# YEAR(), MONTH(), DAY()
SELECT YEAR(NOW()); # 2025
SELECT MONTH(NOW()); # 10
SELECT DAY(NOW()); # 27

# ==============================================================================================================================

SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM users;

# 실습2. 수학 함수, 날짜 함수(1)
# 1.
SELECT ROUND(AVG(price), 1) avg_price_rounded FROM products;
# 2.
SELECT order_id, created_at, DATEDIFF(CURDATE(), DATE(created_at)) days_ago FROM orders
WHERE DATEDIFF(CURDATE(), DATE(created_at)) <= 250;
# 3.
SELECT user_id, name, email FROM users 
WHERE (MOD(user_id, 2) = 1) AND (name LIKE "%김%" OR name LIKE "%이%");
# 4.
SELECT order_id, order_status, created_at, DATEDIFF(CURDATE(), DATE(created_at)) days_since_order
FROM orders
WHERE order_status = "배송완료" HAVING days_since_order >= 7;

# ==============================================================================================================================

# 조건 함수
# IF()
SELECT name, gender, IF(gender = "남", "Male", "Female") gender_eng FROM student;
SELECT name, price, IF(price >= 10000, "비쌈", "저렴") price_level FROM products;

# IFNULL()
SELECT name, IFNULL(phone, "전화번호 없음") FROM customers;
SELECT name, IFNULL(membership_level, "Iron") FROM customers;
SELECT order_id, order_status, IFNULL(order_status, "주문취소") order_status_edit FROM orders;

# NULLIF()
SELECT order_id, order_status, NULLIF(order_status, "처리중" OR "배송중") order_status_edit FROM orders;

# CASE
SELECT order_id, order_status,
CASE order_status
	WHEN "완료" THEN "결제가 완료됐어요"
	WHEN "배송" THEN "배송중이에요"
    WHEN "처리중" THEN "주문이 처리되고 있어요"
    ELSE "상태를 알 수 없어요"
END AS statuse_label
FROM orders;

# ==============================================================================================================================

# 실습3. 조건 함수(1)
USE practice_db;
# 1.
SELECT product_name, price, IF(price > (SELECT AVG(price) FROM products), "고가", "저가") price_grade FROM products;

SET @avg_price = (SELECT AVG(price) FROM products);
SELECT product_name, price, IF(price > (SELECT @avg_price), "고가", "저가") price_grade FROM products;
# 2.
SELECT user_id, name, IFNULL(email, "이메일 미입력") checked_email FROM users;
# 3.
SELECT order_id, order_status, created_at, 
CASE
	WHEN order_status != "배송완료" THEN "대상 아님"
	WHEN DATEDIFF(NOW(), created_at) >= 220 THEN "후기 요청"
    ELSE "배송 확인"
END AS followup_status
FROM orders;

# ==============================================================================================================================

# 형변환
# 암시적 형변환 = 자동으로 변환
SELECT "100" + 200; # 300
SELECT "100" + "200"; # 300

# 명시적 형변환 = 사용자가 지정
# CAST()
SELECT CAST("123" AS SIGNED); # 123
SELECT CAST(3.14 AS CHAR); # 3.14
SELECT CAST("20250403" AS DATE); # 2025-04-03

# CONVERT()
SELECT CONVERT("123", SIGNED); # 123
SELECT CONVERT(3.14, CHAR); # 3.14
SELECT CONVERT("20250403", DATE); # 2025-04-03
SELECT CONVERT("한글" USING utf8mb4);
