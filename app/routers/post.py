from fastapi import APIRouter, HTTPException
from app.db import get_connection
from app.schemas.post import PostCreate, PostUpdate

# 라우터 객체 생성
router = APIRouter()

# 최신순으로 불러오기
@router.get("/posts")
def get_posts():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM posts ORDER BY created_at DESC")
    result = cursor.fetchall()
    conn.close()
    return result

# 특정 ID로 불러오기
@router.get("/posts/{post_id}")
def get_post(post_id: int):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM posts WHERE id = %s", (post_id,))
    result = cursor.fetchone()
    conn.close()
    return result

# 새 글 작성
@router.post("/posts")
def create_post(post: PostCreate):
    try:
        conn = get_connection()
        cursor = conn.cursor()
        sql = "INSERT INTO posts (author, content) VALUES (%s, %s)"
        cursor.execute(sql, (post.author, post.content))
        new_post_id = cursor.lastrowid # 방금 생성된 ID 가져오기
        conn.commit()

        # 방금 생성된 데이터 조회해서 반환
        cursor.execute("SELECT * FROM posts WHERE id = %s", (new_post_id,))
        new_post = cursor.fetchone()
        return new_post
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

# 기존 글 수정
@router.put("/posts/{post_id}")
def update_post(post_id: int, post:PostUpdate):
    try:
        conn = get_connection()
        cursor = conn.cursor()
        sql = "UPDATE posts SET content = %s WHERE id = %s"
        cursor.execute(sql, (post.content, post_id))

        if cursor.rowcount == 0:
            raise HTTPException(status_code=400, detail="해당 글이 없습니다.")
        
        # 수정사항 확인
        cursor.execute("SELECT * FROM posts WHERE id = %s", (post_id,))
        updated_post = cursor.fetchone()
        return updated_post
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

# 기존 글 삭제
@router.delete("/posts/{post_id}")
def delete_post(post_id: int):
    try:
        conn = get_connection()
        cursor = conn.cursor()
        sql = "DELETE FROM posts WHERE id = %s"
        cursor.execute(sql, (post_id,))
        conn.commit()

        if cursor.rowcount == 0:
            raise HTTPException(status_code=400, detail="해당 글이 없습니다.")
        
        return {"message": "글 삭제 완료"}
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()