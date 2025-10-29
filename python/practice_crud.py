import mysql.connector
from mysql.connector import Error

# DB 연결 함수
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="user",
        password="1234",
        database="codingon_db"
    )

# 쿼리 실행 및 예외 처리 함수
def execute_query(sql, params=None, fetch=False):
    # fetch=False : INSERT/UPDATE/DELETE (commit 필요)
    # fetch=True : SELECT (결과 반환)
    try:
        conn = get_connection()
        cursor = conn.cursor()
        # SQL 실행
        cursor.execute(sql, params)
        # 결과 반환
        if fetch:
            results = cursor.fetchall()
            return results
        else:
            conn.commit()
            return cursor.rowcount
    # 예외 처리
    except Error as e:
        print("DB 연결 중 에러 발생 :", e)
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()
            print("MySQL Connection is Closed!")

# INSERT 함수
def posts_table_insert():
    # 사용자 정보 입력 받기
    author = input("작성자 이름을 입력하세요 : ")
    content = input("글 내용을 입력하세요 : ")
    # SQL문
    sql = "INSERT INTO posts (author, content) VALUES (%s, %s)"
    rowcount = execute_query(sql, (author, content))
    # 결과 확인
    if rowcount:
        print(f"Post {rowcount}개 등록 완료!")
        results = execute_query("SELECT * FROM posts", fetch=True)
        for row in results:
            print(row)

# SELECT 함수
def posts_table_select(author=None):
    if author:
        # 해당 author의 글만 확인
        sql = "SELECT * FROM posts WHERE author = %s ORDER BY created_at DESC"
        results = execute_query(sql, (author,), fetch=True)
    else:
        sql = "SELECT * FROM posts ORDER BY created_at DESC"
        results = execute_query(sql, fetch=True)
    # 결과 확인
    if results:
        for row in results:
            print(row)
    else:
        print("데이터가 없습니다.")

# UPDATE 함수
def posts_table_update():
    # 사용자 정보 입력 받기
    id = input("수정할 글의 ID를 입력하세요 : ")
    new_content = input("글 내용을 입력하세요 : ")
    # SQL문
    sql = "UPDATE posts SET content = %s WHERE id = %s"
    rowcount = execute_query(sql, (new_content, id))
    # 결과 출력
    if rowcount and rowcount > 0:
        print(f"Post {rowcount}개 수정 완료!")
        results = execute_query("SELECT * FROM posts", fetch=True)
        for row in results:
            print(row)
    else:
        print("해당 ID의 Post가 존재하지 않습니다.")

# DELETE 함수
def posts_table_delete():
    # 사용자 정보 입력 받기
    id = input("삭제할 글의 ID를 입력하세요 : ")
    # SQL문
    sql = "DELETE FROM posts WHERE id = %s"
    rowcount = execute_query(sql, (id,))
    # 결과 출력
    if rowcount and rowcount > 0:
        print(f"Post가 {rowcount}개 삭제되었습니다!")
    else:
        print("해당 ID의 Post가 존재하지 않습니다.")

# SQL 실행
# posts_table_insert()
# posts_table_select("name1") # 작성자명을 인자로 사용 시 해당 작성자의 글만 확인 
# posts_table_update() 
# posts_table_delete()