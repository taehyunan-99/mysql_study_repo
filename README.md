# 📚 MySQL Study Repository

MySQL 학습을 위한 레포지토리입니다.

## 📂 폴더 구조
```
mysql_study_repo/
├── SQL/
│   ├── 01_DDL.sql      # DDL (Data Definition Language)
│   ├── 02_DML.sql      # DML - 기본 조회 및 조건 검색
│   ├── 03_DML2.sql     # DML - UPDATE, DELETE, 변수
│   ├── 04_DCL.sql      # DCL (Data Control Language)
│   ├── 05_JOIN.sql     # JOIN - 테이블 생성 및 데이터 추가
│   ├── 06_JOIN2.sql    # JOIN - 다양한 JOIN 실습
│   ├── 07_FUNCTION.sql # 함수 - 문자열, 수학, 날짜, 조건, 형변환
│   └── 08_PYTHON.sql   # Python 연동 테스트용 테이블 생성
├── python/
│   ├── python_db.py         # MySQL 기본 연결 및 SELECT
│   ├── crud.py              # 기본 CRUD 작업 예제
│   ├── practice_crud.py     # CRUD 함수화 실습
│   └── app/                 # FastAPI 애플리케이션
│       ├── main.py          # FastAPI 앱 진입점
│       ├── db.py            # DB 연결 함수
│       └── routers/
│           └── user.py      # 사용자 관련 라우터
└── README.md
```

## 📂 학습 내용

### 🗄️ DDL (Data Definition Language)
- **데이터베이스 & 테이블 관리**: `CREATE DATABASE/TABLE`, `DROP`, `ALTER TABLE`로 구조 생성 및 수정
- **제약 조건**: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `AUTO_INCREMENT`, `DEFAULT` 등 데이터 무결성 보장
- **외래 키 옵션**: `ON DELETE/UPDATE CASCADE`, `SET NULL` 등으로 참조 무결성 제어

<br/>

### 📝 DML (Data Manipulation Language)
#### 데이터 추가 및 조회
- **INSERT**: 단일/다중 데이터 추가, 필드명 생략 가능, `AUTO_INCREMENT` 자동 처리
- **SELECT**: 데이터 조회, `WHERE`로 조건 필터링, `BETWEEN`, `IN`, `LIKE`, `IS NULL` 등 다양한 조건 사용
- **정렬/제한**: `ORDER BY`로 정렬, `LIMIT`으로 개수 제한, `DISTINCT`로 중복 제거

<br/>

#### 집계 및 그룹화
- **GROUP BY**: 데이터 그룹화로 카테고리별 통계 생성
- **HAVING**: 그룹화된 결과에 조건 적용
- **집계 함수**: `COUNT()`, `AVG()`, `SUM()`, `MIN()`, `MAX()` 등으로 데이터 요약

<br/>

#### 데이터 수정 및 삭제
- **UPDATE**: 데이터 수정, `WHERE` 조건으로 대상 지정
- **DELETE**: 데이터 삭제, `AUTO_INCREMENT`는 초기화되지 않음
- **변수**: `SET @변수명 = 값` 또는 `SELECT @변수명 := 값`으로 선언, 문자열은 `COLLATE` 지정 필요

<br/>

### 🔐 DCL (Data Control Language)
- **계정 관리**: `CREATE USER`, `DROP USER`로 사용자 생성/삭제
- **권한 부여**: `GRANT 권한 ON DB.테이블 TO 'user'@'host'`로 권한 부여
- **권한 회수**: `REVOKE 권한 ON DB.테이블 FROM 'user'@'host'`로 권한 제거
- **권한 확인**: `SHOW GRANTS`로 현재/특정 사용자 권한 조회

<br/>

### 🔗 JOIN
- **INNER JOIN**: 두 테이블의 교집합, 매칭되는 데이터만 조회
- **LEFT/RIGHT JOIN**: 왼쪽/오른쪽 테이블 기준, 매칭 없으면 NULL 반환
- **FULL OUTER JOIN**: `LEFT JOIN UNION RIGHT JOIN`으로 구현
- **CROSS JOIN**: 두 테이블의 모든 조합 (카테시안 곱)
- **SELF JOIN**: 같은 테이블을 자기 자신과 조인 (계층 구조 표현)
- **다중 JOIN**: 여러 테이블을 연결하여 복합 데이터 조회

<br/>

### ⚡ 함수 (Functions)
#### 문자열 함수
- **문자열 결합**: `CONCAT()`, `CONCAT_WS()`로 문자열 연결
- **문자열 추출**: `LEFT()`, `SUBSTRING()`으로 일부 추출, `SUBSTRING_INDEX()`로 구분자 기준 분리
- **문자열 변환**: `UPPER()`로 대문자 변환, `REPLACE()`로 일부 문자열 변경

<br/>

#### 수학 함수
- **반올림/올림/내림**: `ROUND()`, `CEIL()`, `FLOOR()`로 소수점 처리
- **연산**: `MOD()`로 나머지, `ABS()`로 절댓값
- **난수 생성**: `RAND()`로 0~1 사이의 난수 생성

<br/>

#### 날짜 함수
- **현재 날짜/시간**: `NOW()`, `CURDATE()`, `CURTIME()`으로 현재 정보 조회
- **날짜 연산**: `DATEDIFF()`로 날짜 차이 계산, `DATE_ADD()`로 날짜 더하기
- **날짜 추출**: `YEAR()`, `MONTH()`, `DAY()`로 날짜 구성 요소 추출

<br/>

#### 조건 함수
- **IF()**: 단순 조건 분기 처리
- **IFNULL()**: NULL 값 처리 및 대체
- **CASE WHEN**: 복잡한 다중 조건 분기 (순차적 평가)

<br/>

#### 형변환
- **CAST()**: `CAST(값 AS 타입)` 형식으로 데이터 타입 변환
- **CONVERT()**: `CONVERT(값, 타입)` 형식으로 데이터 타입 변환

<br/>

### 🐍 Python과 MySQL, FastAPI 연동
#### 기본 연결
- **mysql.connector**: MySQL 연결 및 쿼리 실행
- **cursor 객체**: SQL 실행 및 결과 조회
- **예외 처리**: `try-except-finally`로 안전한 DB 연결 관리

<br/>

#### CRUD 작업
- **INSERT**: 데이터 추가, `%s` 플레이스홀더로 SQL 인젝션 방지
- **SELECT**: 데이터 조회, `fetchall()`/`fetchone()`으로 결과 반환
- **UPDATE**: 데이터 수정, `cursor.rowcount`로 영향받은 행 수 확인
- **DELETE**: 데이터 삭제, 조건 필터링으로 특정 데이터 제거

<br/>

#### FastAPI 연동
- **FastAPI 앱**: MySQL과 FastAPI 연동으로 RESTful API 구현
- **라우터 구조**: `APIRouter`로 엔드포인트 모듈화
- **DB 연결 함수**: `get_connection()`으로 DB 연결 재사용

<br/>

---
*마지막 업데이트: 2025-10-29*
