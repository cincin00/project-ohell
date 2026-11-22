-- 프로젝트용 테이블 저장 공간과 DB 계정 만들기 (Oracle 11g, 관리자 계정으로 실행)
-- 경로, 계정 이름, 비밀번호는 각자 환경에 맞게 바꿔서 사용하세요.

CREATE TABLESPACE KH_PROJECT
DATAFILE 'C:\TABLESPACE\project.dbf' SIZE 50M;

CREATE USER olle
IDENTIFIED BY YOUR_DB_PASSWORD
DEFAULT TABLESPACE KH_PROJECT
TEMPORARY TABLESPACE TEMP;

-- 당시에는 dba 권한까지 줬지만, 실행에는 connect, resource면 충분합니다.
GRANT connect, resource TO olle;
