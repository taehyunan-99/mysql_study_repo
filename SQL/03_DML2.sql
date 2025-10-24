# UPDATE
# PRIMARY KEY가 아닌 필드로 WHERE 접근 시 에러 발생
# 설정에서 해제 가능
UPDATE student SET name = "정국1" WHERE student_id = 1;
# 해제 시 다른 필드로 접근 가능
UPDATE student SET name = "정국" WHERE name = "정국1";

SELECT * FROM student;

# DELETE
DELETE FROM student WHERE student_id = 10;

# 삭제 이후 추가해도 기존 숫자 이후부터 기록됨
INSERT INTO student (name, age, gender, class_id, join_date)
VALUES ("오해원", 22, "여", "CLS05", "2024-05-16");

# ==============================================================================================================================

# 실습4. UPDATE와 DELETE
USE codingon_db;
# 1.
UPDATE student SET age = 26 WHERE name = "정국";
# 2.
UPDATE student SET age = age + 1 WHERE (class_id = "CLS01") AND (age < 25);
# 3.
DELETE FROM class WHERE room LIKE "G%";
# 4.
DELETE FROM student WHERE join_date < "2024-03-01";

SELECT * FROM student;
SELECT * FROM class;

# ==============================================================================================================================

# 변수
# 방법 1
SET @age_limit = 24;
SELECT name, age FROM student WHERE age < @age_limit;

# 방법 2
SELECT @gender_type := "남" COLLATE utf8mb4_unicode_ci;
SELECT name, gender FROM student WHERE gender = @gender_type;
