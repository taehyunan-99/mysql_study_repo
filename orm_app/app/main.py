from fastapi import FastAPI
# 라우터 폴더의 모듈 불러오기
from app.routers import user, post

# app 객체 생성
app = FastAPI()

# 기본 경로 조회
@app.get("/")
def root():
    return {"message": "FastAPI with MySQL"}

# 라우터 등록
app.include_router(user.router)
app.include_router(post.router)