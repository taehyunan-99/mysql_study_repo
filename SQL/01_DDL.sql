# DDL

# 데이터베이스 생성
CREATE DATABASE test_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# DB 실행 
USE test_db;

# 테이블 생성
CREATE TABLE user (
	user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(10) NOT NULL,
    address VARCHAR(45),
    join_date DATE
);

# 테이블 확인
SHOW TABLES;
# 테이블 내용 확인
DESC user;

# 테이블 지우기
DROP TABLE user;
# DB 삭제
DROP DATABASE test_db;

# 실습1. DDL 연습하기
# 데이터베이스 생성
CREATE DATABASE my_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# DB 실행
USE my_shop;

# customer 테이블 생성
CREATE TABLE customer (
	cust_id CHAR(10) NOT NULL PRIMARY KEY,
    cust_name VARCHAR(10) NOT NULL,
    address CHAR(10) NOT NULL,
    phone CHAR(11),
    birth DATE
);

# 테이블 확인
DESC customer;

# 외래 키 설정 FOREIGN KEYcustomercustomer
CREATE TABLE orders (
	order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cust_id CHAR(10) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customer (cust_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

# 제약 조건 확인 방법
SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_NAME = "orders";

# 실습2. DDL 실습
# 데이터베이스 생성
CREATE DATABASE university_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 테이블 생성
CREATE TABLE students (
	student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    major VARCHAR(30),
    advisor_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE professors (
	professor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(30),
    mentee_id INT,
    joined_at DATE
);

# 참조 설정
ALTER TABLE students
ADD CONSTRAINT fk_students_advisor_id
FOREIGN KEY (advisor_id) REFERENCES professors (professor_id)
ON DELETE SET NULL;

ALTER TABLE professors
ADD CONSTRAINT fk_professors_mentee_id
FOREIGN KEY (mentee_id) REFERENCES students (student_id)
ON DELETE SET NULL;

# 테이블 확인
DESC students;
DESC professors;


