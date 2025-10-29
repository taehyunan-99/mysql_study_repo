# Python가 함께 사용하기

# Python 환경 테스트 테이블 생성
CREATE TABLE IF NOT EXISTS users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

# 사용자 확인
SELECT * FROM mysql.user;

# 새로운 user 생성
CREATE USER "user"@"localhost" IDENTIFIED BY "1234";

# 권한 확인
SHOW GRANTS;
SHOW GRANTS FOR "user"@"localhost";

# 일부 권한 부여
GRANT SELECT ON codingon_db.* TO "user"@"localhost";

# 모든 권한 부여
GRANT ALL PRIVILEGES ON codingon_db.* TO "user"@"localhost";

# 테스트 데이터 추가
INSERT INTO users (username, password, name, email) VALUES
('kimminsu', 'pass1234', '김민수', 'kim.minsu@example.com'),
('leeyuna', 'pw9876', '이유나', 'lee.yuna@example.com'),
('parkjunho', 'secure11', '박준호', 'park.junho@example.com'),
('choijiae', 'mypw2025', '최지애', 'choi.jiae@example.com'),
('jungtaehyun', 'abcd1234', '정태현', 'jung.taehyun@example.com'),
('kangsoyeon', 'test5678', '강소연', 'kang.soyeon@example.com'),
('yoonhyukjin', 'pw1122', '윤혁진', 'yoon.hyukjin@example.com'),
('hanseojin', 'hello88', '한서진', 'han.seojin@example.com'),
('songyujin', 'pw9090', '송유진', 'song.yujin@example.com'),
('limdaewon', 'qwerty55', '임대원', 'lim.daewon@example.com');

# 테이블 확인
SELECT * FROM users;

# ==============================================================================================================================

# CRUD 실습
CREATE TABLE IF NOT EXISTS posts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(50),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM posts;