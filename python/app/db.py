import mysql.connector

# DB 연결 함수
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="user",
        password="1234",
        database="codingon_db"
    )