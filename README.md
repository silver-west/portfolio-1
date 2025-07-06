![header](https://capsule-render.vercel.app/api?type=waving&color=timeAuto&height=200&section=header&text=PointSquare&fontSize=50&fontAlign=20&animation=fadeIn)
# PointSquare
활동을 통해 포인트를 쌓는 구조로 커뮤니티와 포인트 상점을 즐길 수 있는 JSP 기반 웹사이트<br>
<a href="http://bli583.cafe24.com" target="_blank">PointSquare 이동</a>


## 개요
Java, JSP, JavaScript, Bootstrap을 활용하여 제작한 포트폴리오용 웹사이트입니다.<br>
회원가입 후 게시판 활동이나 미니게임(추가 예정)을 통해 포인트를 획득하고,<br>
그 포인트로 상점에서 아이템을 구매할 수 있는 구조 입니다.<br>

### 1. 동기
학원에서 기술을 배울 때 단순히 학습하기만 하면 이후에 자유롭게 응용하는 데에 한계가 있을 것이라 느꼈습니다.<br>
그래서 배운 내용을 확실하게 복습 하고, 이를 실전에 적용해보기 위해 하나의 웹사이트로 구현해보았습니다.

### 2. 기간
2025.06.23 ~ 진행중

✏️ 아직 학원 수료중이라 새롭게 배우는 내용이 있으면 업데이트 할 예정입니다!

<br>
<br>

## 📁 주요 기능

### 👤 회원 및 관리자 기능
#### 1. 회원
- 회원가입, 로그인, 로그아웃
- 회원정보 수정 및 탈퇴
- null, 아이디/닉네임 중복 등 유효성 검사
#### 2. 관리자
- 회원 정보 열람 및 추방 기능
- 게시판 관리 기능

### 📝 게시판 기능
- 게시글 작성, 수정, 삭제
- 게시글 목록 보기 및 상세 페이지
- 페이징
- 게시글 정렬 선택 (최신순/오래된 순)

### 🛒 포인트 기능
#### 1. 포인트
- 획득 (회원가입, 게시글 등록)
- 사용 (포인트 상점)
- 선물 기능
#### 2. 포인트 상점
- 상품 목록
- 장바구니 기능
- 포인트 결제 시스템

<br>
<br>

## ➕ 추가 예정 기능
- 반응형으로 수정 -> 모바일 화면
- 포인트 전송 시 문자열 검사
(현재: 입력값에 숫자가 아닌 문자가 들어가 있으면 오류남)
- 미니게임 (플레이 시 포인트 획득)
- 관리자 → 포인트 관리 기능(포인트 설정 및 선물)
- 관리자 → 포인트 상점 관리 기능(상품 추가 및 수정)
- 댓글 기능
- 리팩토링 (현재: 반복되는 CSS 및 JS 코드가 많음)

<br>
<br>

## 🛠 사용 기술

- **Frontend**
  - HTML5, CSS3
  - JavaScript (jQuery)
  - Bootstrap

- **Backend**
  - Java (Servlet, JSP)
  - JDBC
  - JSTL

- **Database**
  - MySQL

- **Tools**
  - Eclipse
  - Apache Tomcat
  - Git & GitHub



