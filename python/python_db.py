# MySQL 라이브러리 불러오기
import mysql.connector
from mysql.connector import Error

# MySQL 연결정보로 연결
conn = mysql.connector.connect(
    host="localhost",
    user="user", # 지정한 유저 이름
    password="1234", # 지정한 비밀번호
    database="codingon_db" # 지정한 데이터베이스
)

# SQL 실행을 위한 cursor 객체 생성
cursor = conn.cursor()

# 쿼리 실행
cursor.execute("SELECT * FROM users")

# fetchall() = 결과 전체를 리스트로 반환
# fetchone() = 결과에서 1개 행만 반환

# 결과 출력
for row in cursor.fetchall():
    print(row)

# 연결 종료
conn.close()

# 예외 처리 적용
try:
    # 실행 코드
    conn = mysql.connector.connect(
        host="localhost",
        user="user", # 지정한 유저 이름
        password="1234", # 지정한 비밀번호
        database="codingon_db" # 지정한 데이터베이스
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users")
    for row in cursor.fetchall():
        print(row)
# 에러 처리
except Error as e:
    print("DB 연결 중 에러 발생 :", e)
finally:
    if conn.is_connected():
        # 연결 종료
        cursor.close()
        conn.close()
        print("MySQL Connection is Closed!")