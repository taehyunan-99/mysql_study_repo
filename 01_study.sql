-- 데이터베이스 생성
CREATE DATABASE test_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DB 실행 
USE test_db;

-- 테이블 생성
CREATE TABLE user (
	user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(10) NOT NULL,
    address VARCHAR(45),
    join_date DATE
);

-- 테이블 확인
SHOW TABLES;
-- 테이블 내용 확인
DESC user;

-- 테이블 지우기
DROP TABLE user;
-- DB 삭제
DROP DATABASE test_db;

-- 실습1. DDL 연습하기
-- 데이터베이스 생성
CREATE DATABASE my_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DB 실행
USE my_shop;

-- customer 테이블 생성
CREATE TABLE customer (
	cust_id CHAR(10) NOT NULL PRIMARY KEY,
    cust_name VARCHAR(10) NOT NULL,
    address CHAR(10) NOT NULL,
    phone CHAR(11),
    birth DATE
);

-- 테이블 확인
DESC customer;