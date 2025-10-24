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
│   └── 06_JOIN2.sql    # JOIN - 다양한 JOIN 실습
└── README.md
```

## 📂 학습 내용

### 🗄️ DDL (Data Definition Language)
- **데이터베이스 & 테이블 관리**: `CREATE DATABASE/TABLE`, `DROP`, `ALTER TABLE`로 구조 생성 및 수정
- **제약 조건**: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `AUTO_INCREMENT`, `DEFAULT` 등 데이터 무결성 보장
- **외래 키 옵션**: `ON DELETE/UPDATE CASCADE`, `SET NULL` 등으로 참조 무결성 제어

<br/>

### 📝 DML (Data Manipulation Language)
- **INSERT**: 단일/다중 데이터 추가, 필드명 생략 가능, `AUTO_INCREMENT` 자동 처리
- **SELECT**: 데이터 조회, `WHERE`로 조건 필터링, `BETWEEN`, `IN`, `LIKE`, `IS NULL` 등 다양한 조건 사용
- **정렬/제한**: `ORDER BY`로 정렬, `LIMIT`으로 개수 제한, `DISTINCT`로 중복 제거
- **집계**: `GROUP BY`로 그룹화, `HAVING`으로 그룹 조건, `COUNT()`, `AVG()`, `MIN()`, `MAX()` 등 집계 함수
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

---
*마지막 업데이트: 2025-10-24*
