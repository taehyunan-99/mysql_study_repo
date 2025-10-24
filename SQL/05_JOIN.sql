# JOIN

# 실습1. 새로운 DB 만들기
# DB 생성 후 지정
CREATE DATABASE codingon_store_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE codingon_store_db;

# DB 삭제
# DROP DATABASE codingon_store_db;

# 테이블 생성
CREATE TABLE customers (
	customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, # PK
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20),
    birth_date DATE,
    membership_level VARCHAR(20)
);
CREATE TABLE orders (
	order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, # PK
    customer_id INT NOT NULL, # FK
    order_date DATE,
	order_status VARCHAR(20),
    payment_method VARCHAR(30),
    delivery_fee INT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE products (
	product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, # PK
    name VARCHAR(100),
    price INT,
    stock_quantity INT,
    category VARCHAR(50),
    manufacturer VARCHAR(50)
);
CREATE TABLE order_items (
	order_item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, # PK
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price INT,
    discount_rate DECIMAL(5, 2),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
CREATE TABLE employees (
	employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, # PK
    name VARCHAR(50) NOT NULL,
    manager_id INT,
    hire_date DATE,
    department VARCHAR(50),
    position VARCHAR(50)
);

# 데이터 추가
INSERT INTO customers VALUES (1, '홍길동', 'hong@example.com', '서울', '010-1234-1111', '1990-05-10', 'Gold');
INSERT INTO customers VALUES (2, '김영희', NULL, '부산', '010-2222-3333', '1985-08-25', 'Silver');
INSERT INTO customers VALUES (3, '이철수', 'cslee@example.com', '대전', NULL, NULL, NULL);
INSERT INTO customers VALUES (4, '박민수', NULL, '광주', '010-6666-7777', '1992-07-17', NULL);
INSERT INTO customers VALUES (5, '최은정', 'ejchoi@example.com', '서울', '010-8888-9999', '1995-09-09', 'Gold');
INSERT INTO customers VALUES (6, '정다현', 'dhjung@example.com', '대구', NULL, NULL, 'Silver');
INSERT INTO customers VALUES (7, '한지훈', 'jhhan@example.com', NULL, '010-3030-4040', '1988-04-04', 'VIP');
INSERT INTO customers VALUES (8, '오유진', 'yjoh@example.com', NULL, '010-5050-6060', '1993-06-06', 'Gold');

INSERT INTO employees VALUES (1, '이부장', NULL, '2010-01-01', NULL, '부장');
INSERT INTO employees VALUES (2, '김차장', NULL, '2012-03-15', '경영지원', '차장');
INSERT INTO employees VALUES (3, '박과장', 2, '2014-06-30', '영업부', NULL);
INSERT INTO employees VALUES (4, '최대리', 3, '2016-09-20', NULL, '대리');
INSERT INTO employees VALUES (5, '정사원', 4, '2019-01-05', '영업부', NULL);
INSERT INTO employees VALUES (6, '한사원', NULL, '2020-07-10', '영업부', '사원');

INSERT INTO products VALUES (1, '무선 마우스', 25000, 120, '전자기기', '로지텍');
INSERT INTO products VALUES (2, '기계식 키보드', 85000, NULL, NULL, NULL);
INSERT INTO products VALUES (3, 'USB-C 케이블', 9000, NULL, '전자기기', '벨킨');
INSERT INTO products VALUES (4, '텀블러', 15000, 200, NULL, '스타벅스');
INSERT INTO products VALUES (5, '물티슈', 4000, 500, NULL, NULL);
INSERT INTO products VALUES (6, 'LED 스탠드', 32000, 60, '전자기기', NULL);
INSERT INTO products VALUES (7, '노트북 파우치', 18000, 150, '생활용품', '삼성전자');
INSERT INTO products VALUES (8, '블루투스 이어폰', 95000, NULL, '전자기기', '애플');
INSERT INTO products VALUES (9, '보조 배터리', 30000, 130, '전자기기', '샤오미');
INSERT INTO products VALUES (10, 'USB 허브', 21000, 110, '전자기기', '엘지');

INSERT INTO orders VALUES (1, 8, '2023-02-23', '완료', NULL, 2500);
INSERT INTO orders VALUES (2, 6, '2023-10-14', NULL, '카카오페이', 0);
INSERT INTO orders VALUES (3, 7, '2023-09-18', '완료', '신용카드', NULL);
INSERT INTO orders VALUES (4, 3, '2023-11-10', NULL, '신용카드', NULL);
INSERT INTO orders VALUES (5, 1, '2023-02-20', '배송중', '카카오페이', 2500);
INSERT INTO orders VALUES (6, 1, '2023-01-14', '처리중', '계좌이체', NULL);
INSERT INTO orders VALUES (7, 6, '2023-07-19', '처리중', '카카오페이', 0);
INSERT INTO orders VALUES (8, 3, '2023-05-15', NULL, '카카오페이', 0);
INSERT INTO orders VALUES (9, 7, '2023-03-27', '처리중', NULL, NULL);
INSERT INTO orders VALUES (10, 6, '2023-04-04', '완료', '카카오페이', 0);
INSERT INTO orders VALUES (11, 5, '2023-12-31', '처리중', '카카오페이', 3000);
INSERT INTO orders VALUES (12, 2, '2023-05-15', '배송중', NULL, 2500);
INSERT INTO orders VALUES (13, 3, '2023-06-28', '완료', '신용카드', 3000);
INSERT INTO orders VALUES (14, 1, '2023-09-06', '완료', NULL, 3000);
INSERT INTO orders VALUES (15, 2, '2023-01-19', NULL, '신용카드', 3000);

INSERT INTO order_items VALUES (2, 2, 8, 4, 95000, 5.0);
INSERT INTO order_items VALUES (3, 2, 3, 2, 9000, 10.0);
INSERT INTO order_items VALUES (4, 3, 7, 5, NULL, 0.0);
INSERT INTO order_items VALUES (5, 3, 5, 4, NULL, NULL);
INSERT INTO order_items VALUES (6, 4, 7, 3, 18000, 0.0);
INSERT INTO order_items VALUES (7, 4, 8, 4, 95000, NULL);
INSERT INTO order_items VALUES (8, 5, 3, 1, 9000, 5.0);
INSERT INTO order_items VALUES (9, 5, 4, 4, 15000, 10.0);
INSERT INTO order_items VALUES (10, 5, 6, 5, 32000, 10.0);
INSERT INTO order_items VALUES (11, 6, 7, 4, 18000, 0.0);
INSERT INTO order_items VALUES (12, 7, 1, 1, 25000, NULL);
INSERT INTO order_items VALUES (13, 7, 8, 2, NULL, NULL);
INSERT INTO order_items VALUES (14, 7, 5, 5, 4000, 10.0);
INSERT INTO order_items VALUES (15, 8, 8, 5, NULL, 5.0);
INSERT INTO order_items VALUES (16, 9, 7, 5, 18000, 0.0);
INSERT INTO order_items VALUES (17, 9, 3, 4, 9000, NULL);
INSERT INTO order_items VALUES (18, 10, 4, 5, NULL, 5.0);
INSERT INTO order_items VALUES (19, 10, 10, 4, 21000, 5.0);
INSERT INTO order_items VALUES (20, 11, 6, 1, 32000, 10.0);
