from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# DB 연결 정보
# user이름:비밀번호@호스트/DB이름
DATABASE_URL = "mysql+mysqlconnector://user:1234@localhost/codingon_db"

# 엔진 생성
engine = create_engine(DATABASE_URL)

# 세션 생성
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False)

# 모든 ORM 모델 클래스의 부모(기반) 클래스
Base = declarative_base()