from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.model.post import Post
from app.schemas.post import PostCreate, PostUpdate
from sqlalchemy import select

# 라우터 객체 생성
router = APIRouter()

# 최신순으로 불러오기
@router.get("/posts")
def get_posts(db: Session = Depends(get_db)):
    # select 사용
    stmt = select(Post).order_by(Post.created_at.desc())
    posts = db.scalars(stmt).all()
    return posts

# 특정 ID로 조회
@router.get("/posts/{post_id}")
def get_post(post_id: int, db: Session = Depends(get_db)):
    # PK 값으로 조회하는 빠른 방법
    db_post = db.get(Post, post_id)
    if db_post is None:
        raise HTTPException(status_code=404, detail="Post를 찾을 수 없습니다.")
    return db_post

# 새 글 작성
@router.post("/posts")
def create_post(post: PostCreate, db: Session = Depends(get_db)):
    try:
        new_post = Post(author=post.author, content=post.content)

        db.add(new_post)
        db.commit()
        # DB에서 최신 데이터 가져오기
        db.refresh(new_post)
        return new_post
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

# 기존 글 수정
@router.put("/posts/{post_id}")
def update_post(post_id: int, post:PostUpdate, db: Session = Depends(get_db)):
    try:
        db_post = db.query(Post).filter(Post.id == post_id).first()
        if not db_post:
            raise HTTPException(status_code=404, detail="해당 Post가 없습니다.")
        
        db_post.content = post.content
        db.commit()
        db.refresh(db_post)
        return db_post
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

# 기존 글 삭제
@router.delete("/posts/{post_id}")
def delete_post(post_id: int, db: Session = Depends(get_db)):
    try:
        db_post = db.query(Post).filter(Post.id == post_id).first()
        if not db_post:
            raise HTTPException(status_code=404, detail="해당 Post가 없습니다.")
        
        db.delete(db_post)
        db.commit()
        return {"message": "Post 삭제 완료"}
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))
