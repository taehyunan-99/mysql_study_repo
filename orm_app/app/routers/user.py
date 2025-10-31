from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.model.user import User
from app.schemas.user import UserCreate, UserUpdate

# 라우터 객체 생성
router = APIRouter()

# users 정보 조회
@router.get("/users")
def get_users(db: Session = Depends(get_db)):
    return db.query(User).all()

@router.post("/users")
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    try:
        new_user = User(username=user.username, password=user.password, name=user.name, email=user.email)

        db.add(new_user)
        db.commit()
        return {"message": "사용자 등록 완료"}
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/users/{user_id}")
def update_user(user_id: int, user: UserUpdate, db: Session = Depends(get_db)):
    try:
        db_user = db.query(User).filter(User.user_id == user_id).first()
        if not db_user:
            raise HTTPException(status_code=404, detail="해당 사용자가 없습니다.")
        
        db_user.name = user.name
        db_user.email = user.email
        db.commit()
        return {"message": "사용자 정보 수정 완료"}
        
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/users/{user_id}")
def delete_user(user_id: int, db: Session = Depends(get_db)):
    try:
        db_user = db.query(User).filter(User.user_id == user_id).first()
        if not db_user:
            raise HTTPException(status_code=404, detail="해당 사용자가 없습니다.")

        db.delete(db_user)
        db.commit()
        return {"message": "사용자 삭제 완료"}
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))
