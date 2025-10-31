from pydantic import BaseModel

class UserCreate(BaseModel):
    username: str
    password: str
    name: str
    email: str

class UserUpdate(BaseModel):
    name: str
    email: str