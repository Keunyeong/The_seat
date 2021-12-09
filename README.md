acornacademy/FinalProject

# 🪑 The_seat_project 자리..있어요?


자세한 웹페이지의 기능은 밑의 링크에서 확인해 주세요 :)


[1. 📚  팀 노션](https://www.notion.so/2-2-d57f5833370740869bd2f24943881d4f)

[2. 📹  페이지 시연영상](https://www.youtube.com/watch?v=WDNLef7isgw)
<br>
Click video!
[![](https://img.youtube.com/vi/WDNLef7isgw/0.jpg)](http://www.youtube.com/watch?v=WDNLef7isgw "Click to play on Youtube.com")



## 목차


[1. 개요](#개요)

[2. 개발 환경](#개발-환경)

[3. 디자인 시안](#디자인-시안)

[4. 프로젝트 주요 기능](#프로젝트-주요-기능)



## 개요

빈자리가 있는지 없는지 모르고 매장을 방문하는 불안함과 자리가 없어 다른 곳을 찾아가야 하는 안타까움을 겪고 기획 및 개발

페이지를 통해 등록된 매장에 현재 자리가 있는지 알 수 있고 자리에 앉거나 방문 전에 미리 자리를 지정하고 주문을 할 수 있으며
뿐만 아니라 이용자가 매장을 오픈하여 사장님이 될 수 있고 매장 정보, 메뉴, 좌석을 업로드하고 주문을 관리할 수 있다.


프로젝트명 : The Seat (자리..있어요?)

개발 인원 : 4명

  - Front end: **고지은, 신현미**
  - Back end: **김규환, 이근영**
  - UI Design: **고지은**

개발 기간 : 2021.08.19 ~ 2021.09.13


## 개발 환경

- 개발환경 : oracleDB ApachTomcat
- 협업 : GitHub, Notion
- 디자인 툴 : figma DBdiagram
- Fontend : html css javascript sweetalert bootstrap
- Backend : springFramework jstl



## 디자인 시안

![the_seat_ui](https://user-images.githubusercontent.com/75401130/135559902-e40656ac-7963-4c2b-8b38-bb933c029468.png)



## 프로젝트 주요 기능


<details>
    <summary>참고 이미지</summary>

<img alt="login" src="https://user-images.githubusercontent.com/75401130/135568483-f05a4c1b-9c00-4450-a382-f0a78e373b69.png">
<img alt="loginform" src="https://user-images.githubusercontent.com/75401130/135568490-dc7749cc-4dc9-4f1a-b414-0e5e44d4a922.png">

</details>




### 인덱스 페이지 & 로그인 페이지

- 검색 기능 (지역 및 검색 키워드 필터)
- 유효성 검사를 통한 회원가입 절차
- 로그인



<details>
    <summary>참고 이미지</summary>

<img alt="main" src="https://user-images.githubusercontent.com/75401130/135568524-5266fad0-5056-4380-9bf3-6f7e221b6739.png">

<img alt="mainNav" height="500" src="https://user-images.githubusercontent.com/75401130/135568545-0c5afe73-3101-45b6-9b5b-a43fece8c026.png">

</details>




### 메인 페이지

- 등록된 매장(카드형식)노출 (메인에 노출 여부 선택 가능)
- 네비바
- 사이드바 목록 (로그인/마이페이지/매장목록/매장추가/로그아웃)



<details>
    <summary>참고 이미지 1</summary>

<img alt="myStore" src="https://user-images.githubusercontent.com/75401130/135568602-f8b41cef-e1fa-4c5d-876a-8c98b3ad5f35.png">

<img alt="storeNav" height="500" src="https://user-images.githubusercontent.com/75401130/135569457-f9616965-118f-410f-bcf0-4fd70ac6ddaa.png">

</details>

<details>
    <summary>참고 이미지 2 (반응형)</summary>

<img alt="storeOrder" src="https://user-images.githubusercontent.com/75401130/135569271-7041593d-c1b6-4fe7-904b-33d13dce3413.png">

<img alt="storeOrder2" height="500" src="https://user-images.githubusercontent.com/75401130/135569274-607b56bb-f64f-4c02-bb9d-361cdf9877f3.png">

<img alt="storeOrder3" height="500" src="https://user-images.githubusercontent.com/75401130/135569278-b4395e3a-2cef-4bd2-a349-591537633c9d.png">

</details>



### 매장 관리 페이지

① 매장정보
: 매장프로필, 정보, 검색키워드, 대표이미지 등록 및 매장 열기&닫기 버튼과 매장삭제 기능


② 메뉴관리
: 카테고리, 메뉴 추가 및 삭제, 매장 상세 페이지의 대표메뉴 등록 (최대 4개)


③ 리뷰관리
: 사용자 리뷰 확인 및 사장님의 답글 작성 및 수정 (사용자는 매장상세페이지/마이페이지에서 답글 확인 가능)


④ 주문확인
: 주문자 확인, 주문내역(메뉴부터 총금액까지), 주문확인버튼(클릭 시 사용자의 리뷰작성 버튼 활성화), 페이지 새로고침 (일정 시간마다 주문내역 업데이트)


⑤ 자리관리
: 좌석배치도 및 매장 알림 사항, 좌석 수(최대 30좌석) 및 상태(이용가능or이용중or이용불가능) 선택, 배치변경버튼



<details>
    <summary>참고 이미지</summary>

<img alt="info" src="https://user-images.githubusercontent.com/75401130/135569170-be394688-bd9a-460c-b157-4934775f8b72.png">

<img alt="info2" src="https://user-images.githubusercontent.com/75401130/135569193-dbc2dc4d-71a9-45a9-a487-0893901d81eb.png">

<img alt="infoReview" height="500" src="https://user-images.githubusercontent.com/75401130/135569207-bc7c4715-05f4-457a-a196-209704152bb2.png">

</details>




### 마이페이지

- 프로필 작성 및 편집
- 이용내역 (주문번호, 이용매장, 시간, 내역, 결제금액, 매장 및 나의 별점)
- 주문 확인 중 버튼 (사장님이 주문확인버튼 클릭 시, 리뷰 작성 버튼으로 변경)
- 해당 매장의 모든 리뷰 및 사장님의 답글 확인 (최신순으로 출력)



<details>
    <summary>참고 이미지</summary>

<img alt="storeDetail" src="https://user-images.githubusercontent.com/75401130/135569123-85bb930d-a680-4d6a-861a-a3d3f2630800.png">

</details>




### 매장 상세 페이지

- 대표 이미지 4개 및 매장의 모든 정보, 등록된 메뉴 확인
- 자리 선택
- 남은 자리 상태 표시
- 알림 사항 확인
- 로그인 상태가 아닐 경우, 알림창이 뜨며 로그인 페이지로 이동



<details>
    <summary>참고 </summary>

<img alt="order" src="https://user-images.githubusercontent.com/75401130/135569400-81f607c3-0272-4293-a833-29d4a15ede62.png">

</details>




### 주문 페이지

- 매장의 이름 및 선택한 자리 표기
- 메뉴 이미지에 마우스 호버 시, 메뉴의 구성 정보를 표시
- 메뉴 클릭하면 오른쪽 장바구니에 추가 (총 결제 금액은 자동 계산)
- 다시담기 버튼 및 주문버튼 (결제 완료 시, 메인 페이지로 이동)
