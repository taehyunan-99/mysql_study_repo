from app.db.session import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import Integer, String, DateTime, Text
from datetime import datetime, UTC

class Post(Base):
    # 테이블 이름
    __tablename__ = "posts"

    # 테이블 구조 맵핑
    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    author: Mapped[str] = mapped_column(String(50))
    content: Mapped[str] = mapped_column(Text)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(UTC))