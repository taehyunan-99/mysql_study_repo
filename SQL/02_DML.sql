# DML

# 사용 데이터베이스 선택
USE my_shop;

# 테이블 확인
DESC customer;

# INSERT 문으로 데이터 추가
INSERT INTO customer (cust_id, cust_name, address, phone, birth) 
VALUES ("C001", "김민수", "서울시", "01012345678", "1990-05-14");

# 필드 제외 가능
INSERT INTO customer
VALUES ("C002", "이영희", "부산시", "01023456789", "1985-08-22");

# 여러 데이터 한번에 추가
INSERT INTO customer
VALUES 
("C003", "박철수", "대전시", "01034567890", "1992-11-02"),
("C004", "정유진", "광주시", "01045678901", "1998-01-19");

# 자동 증가는 비우기
INSERT INTO orders (cust_id, prod_name, price, amount) 
VALUES ("C001", "커피머신", 120000, 1);

# 값 조회 
SELECT * FROM customer;
SELECT * FROM orders;

# ==============================================================================================================================

# DDL 종합연습 및 INSERT
# DB 생성 및 지정
CREATE DATABASE codingon_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE codingon_db;

# 테이블 생성
CREATE TABLE class (
	class_id CHAR(5) NOT NULL PRIMARY KEY,
    class_name VARCHAR(30) NOT NULL,
    category VARCHAR(20),
    room CHAR(5) NOT NULL,
    start_date DATE
);

CREATE TABLE student (
	student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT,
    gender ENUM("남", "여"),
    class_id CHAR(5) NOT NULL,
    join_date DATE,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

# 데이터 추가
INSERT INTO class (class_id, class_name, category, room, start_date)
VALUES
("CLS01", "프론트엔드 12기", "프론트엔드", "B-101", "2024-01-08"),
("CLS02", "백엔드 8기", "백엔드", "B-102", "2024-02-05"),
("CLS03", "AI 엔지니어 3기", "AI", "C-201", "2024-03-01"),
("CLS04", "모바일 앱 개발 5기", "모바일", "A-301", "2024-04-10"),
("CLS05", "UI/UX 디자인 6기", "디자인", "D-401", "2024-05-15"),
("CLS06", "데이터 분석 2기", "데이터분석", "B-201", "2024-06-03"),
("CLS07", "클라우드 인프라 1기", "클라우드", "E-102", "2024-06-24"),
("CLS08", "게임 프로그래밍 4기", "게임개발", "G-301", "2024-07-15");

INSERT INTO student (name, age, gender, class_id, join_date)
VALUES
("정국", 25, "남", "CLS01", "2024-01-08"),
("장원영", 21, "여", "CLS01", "2024-01-09"),
("변우석", NULL, "남", "CLS02", "2024-02-05"),
("고윤정", 24, "여", "CLS02", "2024-02-06"),
("안유진", 23, "여", "CLS03", "2024-03-01"),
("이도현", 26, "남", "CLS03", "2024-03-02"),
("박채영", NULL, "여", "CLS04", "2024-04-10"),
("박보검", 29, "남", "CLS04", "2024-04-11"),
("이지은", NULL, "여", "CLS05", "2024-05-15"),
("오해원", 22, "여", "CLS05", "2024-05-16");

# 데이터 조회
SELECT * FROM class;
SELECT * FROM student;

# ==============================================================================================================================

# SELECT + WHERE 사용
# SELECT 컬럼명 FROM 테이블 WHERE 조건;
SELECT name, gender FROM student WHERE age >= 25;

# 논리 연산자 사용
SELECT name, age, class_id FROM student WHERE age >= 23 AND class_id = "CLS03";

# 범위, 집합, 패턴, NULL 
# 범위 (BETWEEN)
SELECT * FROM student WHERE age BETWEEN 20 AND 25;

# 집합 (IN (list))
SELECT * FROM class WHERE category IN ("백엔드", "프론트엔드", "디자인");

# 패턴 (LIKE)
SELECT * FROM student WHERE name LIKE "이%";
SELECT * FROM student WHERE name LIKE "%영";
SELECT * FROM student WHERE name LIKE "__영"; # 언더바 1개당 글자 1개
SELECT * FROM student WHERE name LIKE "_원%";

# IS NULL
SELECT * FROM student WHERE age IS NULL;

# ORDER BY(정렬), LIMIT(출력 개수 제한, OFFSET 설정 가능)
SELECT * FROM student WHERE age IS NULL ORDER BY class_id DESC LIMIT 1, 2;

# DISTINCT(중복 제거)
SELECT DISTINCT class_id FROM student; 

# ==============================================================================================================================

# 실습2. SELECT 연습하기
# 1.
SELECT name, gender FROM student WHERE age >= 25;
# 2.
SELECT DISTINCT class_id FROM student;
# 3.
SELECT name, age FROM student WHERE gender = "남" ORDER BY age;
# 4.
SELECT name, class_id FROM student WHERE name LIKE "이%";
# 5.
SELECT * FROM student WHERE age IS NULL;
# 6.
SELECT * FROM student WHERE join_date BETWEEN "2024-03-01" AND "2024-04-30";
SELECT * FROM student WHERE join_date LIKE "2024-03%" OR join_date LIKE "2024-04%";
# 7.
SELECT * FROM class ORDER BY start_date DESC LIMIT 3;
# 8.
SELECT name FROM student WHERE (class_id IN ("CLS01", "CLS02", "CLS03")) AND (name LIKE "%정%" OR name LIKE "%영%") ORDER BY name; 

# ==============================================================================================================================

# GROUP BY
SELECT class_id, COUNT(*) student_count FROM student GROUP BY class_id;

# ==============================================================================================================================

# 실습3. GROUP BY / HAVING
# 1. 
SELECT class_id, COUNT(*) student_count FROM student GROUP BY class_id;
# 2.
SELECT gender, AVG(age) avg_age FROM student GROUP BY gender;
# 3.
SELECT gender, AVG(age) avg_age FROM student GROUP BY gender HAVING AVG(age) >= 26;
# 4.
SELECT class_id, MIN(join_date) first_join FROM student GROUP BY class_id;
# 5.
SELECT class_id, MIN(age) min_age FROM student GROUP BY class_id HAVING MIN(age) >= 25;
# 6.
SELECT gender, (MAX(age) - MIN(age)) age_gap FROM student GROUP BY gender HAVING (MAX(age) - MIN(age)) >= 3;
# 7.
SELECT class_id, AVG(age) avg_age FROM student GROUP BY class_id HAVING AVG(age) >= 24 ORDER BY avg_age DESC;
