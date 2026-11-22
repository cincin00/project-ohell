# Ohell (Olle Plan)

제주 '올레'에서 이름을 딴 **제주 여행 일정 웹 서비스**입니다.
KH정보교육원 교육 과정 중 진행한 세미 프로젝트입니다.

| 항목 | 내용 |
|---|---|
| 기간 | 2016.04.14 ~ 2016.05.03 (약 3주) |
| 팀 | 5명 |
| 내 역할 | 회원가입, 아이디 중복 확인, 우편번호 찾기 |
| 기술 | Java, JSP, Servlet, MyBatis, Apache Tiles, JSTL, JavaScript, HTML5 |
| DB / 서버 | Oracle 11g, Tomcat 8.0 |
| 도구 | Eclipse, eXERD, SVN |
| 외부 API | TMAP API (장소 검색·경로), Google Maps API |

## 주요 기능

- 장소 정보(위치, 이름, 전화번호)를 보면서 나만의 여행 일정 만들기
- 만든 일정을 게시판에 공유하고 좋아요·댓글 달기
- 계절별 제주 축제 정보 보기 (관리자가 등록·수정)
- 지도에서 여행 경로 확인하기
- 회원 기능: 가입, 로그인/로그아웃, 정보 수정, 탈퇴, 아이디·비밀번호 찾기

## 구조

스프링 없이 서블릿 하나가 모든 `*.do` 요청을 받아 기능별 클래스로 넘기는 **MVC 모델2** 구조입니다.

```
요청(*.do)
 → ControllerURI (서블릿)
 → commandHandlerURI.properties 에서 주소에 맞는 클래스 찾기
 → CommandAction.requestPro() 실행 (예: InsertClientPro)
 → MyBatis 매퍼(xml)로 DB 처리
 → JSP 화면으로 이동
```

## 내가 맡은 부분

| 기능 | 파일 |
|---|---|
| 회원가입 화면과 입력값 확인 | `WebContent/client/inputForm.jsp`, `inputForm.js` |
| 회원가입 처리 | `src/action/join/InsertClientPro.java` |
| 아이디 중복 확인 (팝업) | `src/action/join/IdCheckPro.java`, `WebContent/client/confirmId.jsp` |
| 우편번호 찾기 (팝업) | `src/action/join/ZipCheck.java`, `WebContent/client/zipCheck.jsp`, `zipcheck.js`, `src/zipcodeMapper.xml` |

- 화면에서 입력값 확인: 아이디 한글 막기, 이름은 한글만, 전화번호 숫자 4자리, 비밀번호 일치 여부, 중복 확인 여부, 비밀번호 찾기 질문 선택 여부
- 이메일은 주소 목록에서 고르거나 직접 입력, 전화번호는 세 칸으로 받아 하나로 합쳐 저장
- 아이디 중복 확인·우편번호 찾기는 팝업 창에서 결과를 고르면 원래 가입 화면에 값이 자동으로 채워지도록 구현

## 폴더 구조

```
├── src/          자바 소스, MyBatis 설정과 매퍼(xml)
├── WebContent/   JSP, JS, CSS, WEB-INF(web.xml, Tiles 설정, 라이브러리)
├── sql/          DB 계정·테이블 만들기, 테스트 데이터
├── example.project / example.classpath / example.gitignore   이클립스 설정 참고용
```

## 실행 방법

1. Oracle에서 `sql/` 폴더의 SQL을 순서대로 실행합니다.
2. `src/db.properties`, `src/pool.jocl`에 DB 접속 정보를 넣습니다.
3. `WebContent/places/place.jsp`, `tmap_poi.jsp`의 `YOUR_..._KEY`를 발급받은 API 키로 바꿉니다.
4. Eclipse에서 Dynamic Web Project로 가져와 Tomcat 8.0에서 실행합니다.

## 참고

- 2016.04.28 개발 중 상태의 소스입니다. 마감 전이라 일부 기능(우편번호 찾기 주소 등록 등)과 테이블 정의가 서로 맞지 않는 부분이 있습니다.
- DB 접속 정보와 API 키는 지우고 올렸습니다.
- 한글이 깨지지 않도록 일부 파일의 인코딩을 EUC-KR에서 UTF-8로 바꿨습니다. 코드 내용은 그대로입니다.

## 돌아보며

지금 다시 만든다면 이렇게 바꾸고 싶습니다.

- 입력값 확인을 화면뿐 아니라 **서버에서도** 하기
- 비밀번호를 그대로 저장하지 않고 **해시(bcrypt 등)로 저장**하기
- 오류를 조용히 넘기지 않고 사용자에게 알리고 기록 남기기
- 요청마다 만들던 MyBatis `SqlSessionFactory`를 **한 번만 만들어 함께 쓰기**
- "아이디+일차"를 이어 붙인 문자열 키 대신 번호 키 쓰기
