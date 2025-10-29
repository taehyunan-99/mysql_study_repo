# MySQL 라이브러리 불러오기
import mysql.connector
from mysql.connector import Error

# CRUD 사용하기
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="user",
        password="1234",
        database="codingon_db"
    )
    cursor = conn.cursor()

    # # INSERT문 사용하기
    # # 사용자 정보 입력 받기
    # username = input("사용자 ID를 입력하세요 : ")
    # passwoed = input("비밀번호를 입력하세요 : ")
    # name = input("이름을 입력하세요 : ")
    # email = input("이메일을 입력하세요 : ")

    # sql = "INSERT INTO users (username, password, name, email) VALUES (%s, %s, %s, %s)"
    # user_data = (username, passwoed, name, email)

    # # SQL 실행
    # cursor.execute(sql, user_data)

    # # 실제 DB에 반영
    # conn.commit()
    # print("사용자 등록이 완료되었습니다!")

    # # 쿼리 실행
    # cursor.execute("SELECT * FROM users")

    # # 결과 출력
    # for row in cursor.fetchall():
    #     print(row)

    # # SELECT문 사용하기
    # # 사용자 입력 받기
    # username = input("ID : ")
    # passwoed = input("PW : ")

    # sql = "SELECT * FROM users WHERE username = %s AND password = %s"
    # user_data = (username, passwoed)

    # cursor.execute(sql, user_data)
    # user = cursor.fetchone()

    # if user:
    #     print(f"로그인 성공! 환영합니다, {user[3]}님")
    #     print("사용자 정보 :", user)
    # else:
    #     print("로그인 실패")

    # # UPDATE문 사용하기
    # user_id = input("수정할 사용자 ID : ")
    # new_name = input("새 이름 : ")
    # new_email = input("새 이메일 : ")

    # # SQL문
    # sql = "UPDATE users SET name = %s, email = %s WHERE user_id = %s"
    # new_data = (new_name, new_email, user_id)

    # # SQL 실행
    # cursor.execute(sql, new_data)

    # # DB 저장
    # conn.commit()
    # print("사용자 정보가 수정되었습니다!")

    # DELETE문 사용하기
    user_id = input("삭제할 사용자 ID : ")

    # SQL문
    sql = "DELETE FROM users WHERE user_id = %s"

    # SQL 실행
    cursor.execute(sql, (user_id,))

    # DB 저장
    conn.commit()
    print("사용자가 삭제되었습니다!")

except Error as e:
    print("DB 연결 중 에러 발생 :", e)
finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("MySQL Connection is Closed!")