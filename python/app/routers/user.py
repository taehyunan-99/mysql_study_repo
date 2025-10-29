from fastapi import APIRouter
from app.db import get_connection

# 라우터 객체 생성
router = APIRouter()

# users 정보 조회
@router.get("/users")
def get_users():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users")
    result = cursor.fetchall()
    conn.close()
    return result