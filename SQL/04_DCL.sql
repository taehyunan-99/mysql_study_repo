# DCL
# 현재 사용자 확인
SELECT USER();

# 존재하는 계정 확인
SELECT * FROM mysql.user;

# 모든 데이터베이스 확인
SHOW DATABASES;

# 권한 확인 (현재 계정)
SHOW GRANTS;
# 권한 확인 (특정 계정)
SHOW GRANTS FOR root@localhost;

# 계정 생성
CREATE USER "유저이름"@"localhost" IDENTIFIED BY "비밀번호";

# 권한 삭제
REVOKE DELETE ON *.* FROM "유저이름"@"localhost";

# 계정 삭제
DROP USER "유저이름"@"localhost";
