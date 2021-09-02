<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/manageMenu.css"
type="text/css" />

</head>
<body>
<!-- navbar 추가-->

<!---------------------------------- 가장 바깥의 배경 ---------------------------------->
<div class="container menu__article">
    <section class="menu__category mt-4">
        <ul id="categories">
            <li>
                <a href="${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}">전체</a></li>
            <c:forEach var="tmp" items="${categoryList }">
            	<li data-num="${dto.num }" class="category">
            		<a href="${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}&category=${tmp}">${tmp }</a></li>
            </c:forEach>
        </ul>
    <button id="categoryBtn" style="color:rgb(253, 197, 14); font-weight: 500;" data-bs-toggle="modal" data-bs-target="#modal-categoryBtn">카테고리 추가</button>
    </section>
    <article class="menu__list pe-3 ps-3" style="height:450px; text-overflow: hidden; overflow-x: auto;">
        <div class="card mb-5 mt-3 ms-3" style="max-width: 480px; height: 220px; margin-top: 20px;">
            <div class="menu__add card-body">
                <button type="button" class="circle-btn" data-bs-toggle="modal" data-bs-target="#modal-menuAddForm">
                    <div style="font-size: 20px; font-weight: 500;">+</div>
                </button>
                <span style="color: rgb(173, 173, 173); font-size: 14px;">새로운 메뉴 추가하기</span>
            </div>
        </div>
        <c:forEach var="tmp" items="${menuList }">
        	<div class="card" style="max-width: 500px;">
            	<div class="row g-0">
            		<c:choose>
            			<c:when test="${tmp.best == 'no' }">
            				<button class="mt-3 pe-2 starBtn" style="display: flex; justify-content:flex-end;">
			                    <i data-num="${tmp.num }" class="starIcon far fa-star"></i>
			                </button>
            			</c:when>
            			<c:otherwise>
            				<button class="mt-3 pe-2 starBtn" style="display: flex; justify-content:flex-end;">
			                    <i data-num="${tmp.num }" class="starIcon far fa-star fas"></i>
			                </button>
            			</c:otherwise>
            		</c:choose>
                	<div class="col-md-4 ms-4">
	                    <img src="${pageContext.request.contextPath}${tmp.menuImage}" class="rounded" alt="menu_image">
	                </div>
	                <div class="col-md-6">
	                    <div class="card-body p-2" style="width: 200px;">
	                        <h6 class="card-text">${tmp.menuName } <!-- <p class="card-text">존맛탱 케이크</p> --> </h6>
	                        <h6 class="card-text">${tmp.price }  <!-- <p class="card-text">10,000원</p> --> </h6>
	                        <h6 class="card-text">${tmp.content } <!-- <p class="card-text">생크림, 시나몬, 밀가루</p> --> </h6>
	                    </div>
	                </div>
	                <div class="menu__card-edit mb-2 pe-2" style="display: flex; justify-content: flex-end;">
	                    <button>수정</button>
	                    <button data-num="${tmp.num }" class="deleteBtn">삭제</button>
	                </div>
	            </div>
	        </div>
        </c:forEach>

    </article>
    
<!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->

    <aside class="store__aside">
        <button onclick="location.href='#'">매장 정보</button>
        <button onclick="${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}">메뉴 관리</button>
        <button onclick="location.href='${pageContext.request.contextPath}/storeReview.do'">리뷰 관리</button>
        <button onclick="location.href='${pageContext.request.contextPath}/storeOrder.do'">주문 확인</button>
        <button onclick="location.href='#'">자리 관리</button>
    </aside>
    
<!--------------------------------------- 메뉴 등록 모달창 ------------------------------>
    
    <div class="modal" tabindex="-1" id="modal-menuAddForm" aria-labelledby="menuAddForm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>메뉴 등록</strong> </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="menuAddForm" action="${pageContext.request.contextPath}/store/addMenu.do" method="post" enctype="multipart/form-data">                 
                    <img id="thumbImg" src="" alt="" />
                    
                    <input type="hidden" name="num" value="${storeDBNum }" />
                    <input class="form-control" type="file" name="imageFile" id="image">
                    <input class="form-control" type="text" name="menuName" id="menuname" placeholder="상품명" required="required">
                    <input class="form-control" type="text" name="price" id="menuprice" placeholder="상품가격">
                    <input class="form-control" type="text" name="content" id="menucontaine" placeholder="상품구성" required="required">
                    <span class="dropdown">카테고리 추가</span>
 
                    <select name="category" id="">
                    	<c:forEach var="tmp" items="${categoryList }">
                    		<option value="${tmp }">${tmp }</option>
                    	</c:forEach>
                    </select>
                    <button id="addBtn" type="submit">완료</button>
                </form>
            </div>
        </div>
    </div>
    </div>

<!--------------------------------------- 카테고리 추가 모달창 ------------------------------>
    \\\\\\\
    <div class="modal" tabindex="-1" id="modal-categoryBtn" aria-labelledby="menuAddForm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>카테고리 추가</strong> </h4>
                <button id="modal-close" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form data-num="${dto.num }" id="addCategoryForm" action="${pageContext.request.contextPath}/store/addCategory.do" method="post">                 
                    <label class="form-label" for="category">추가할 카테고리 이름</label>
                    <input type="hidden" name="num" value="${storeDBNum}" />
                    <input class="form-control" type="text" id="inputCategory" name="category"/>
                    <button id="addCategory" type="submit">완료</button>
                </form>
            </div>
        </div>
    </div>
    </div> 
</div>

<!-------------------------- 아이콘 링크 ---------------------->

<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>

	
	// 이미지를 고르면 썸네일에 등장하도록 하는 영역
	viewThumbNail("#image");
	
	// 이미지 파일을 선택했을 때 동작하는 method
	function viewThumbNail(rel){
		document.querySelector(rel).addEventListener("change", function(e){
			readImage(e.target);
		});
	}
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        let reader=new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload=function(e){
	            let previewImg=document.querySelector("#thumbImg");
	            previewImg.src=e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	// 모달에서 메뉴 등록 버튼을 눌렀을 때 동작하는 곳
	document.querySelector("#menuAddForm").addEventListener("submit", function(e){
		e.preventDefault();
		
		let wantAdd=confirm("메뉴를 추가하시겠습니까?");
		
		if(wantAdd){
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beAdded){
					alert("메뉴가 추가되었습니다.");
					location.href="${pageContext.request.contextPath}/store/manageMenu.do?num=${storeData.num}&storeName=${storeData.storeName}";
				}
			});	
		}
		
	});
	
	// 등록한 메뉴를 삭제하는 method
	let deleteBtns=document.querySelectorAll(".deleteBtn");
	for(let i=0; i<deleteBtns.length; i++){
		deleteBtns[i].addEventListener("click", function(e){
			e.preventDefault();
			
			let menuNum=this.getAttribute("data-num");
			let wantDel=confirm("이 메뉴를 삭제하시겠습니까?");
			if(wantDel){
				ajaxPromise("${pageContext.request.contextPath}/store/deleteMenu.do", "post", "num="+menuNum)
				.then(function(response){
					return response.json();
				}).then(function(data){
					console.log(data);
					if(data.beDeleted){
						location.href="${pageContext.request.contextPath}/store/manageMenu.do?num=${storeData.num}&storeName=${storeData.storeName}";
					}
				});	
			}
		});	
	}

	//해당 매장의 메뉴를 best로 설정 및 취소하는 method
	let icons = document.querySelectorAll('.starIcon');
	let storeNum=${storeDBNum};
	let storeName="${storeDBName}";
	
	for (let i=0; i < icons.length; i++) {
		icons[i].addEventListener('click', ()=> {
			
			let beFilled=icons[i].classList.contains("fas");
			let num=icons[i].getAttribute("data-num");

			if(!beFilled){
				let best="yes";
				let obj={num, best, storeNum, storeName};
				ajaxPromise("${pageContext.request.contextPath}/store/bestOnOff.do", "post", obj)
				.then(function(response){
					return response.json();
				}).then(function(data){
					console.log(data);
					if(data.beSwitched==true){
						icons[i].classList.toggle('fas');
					} else if(data.beSwitched==false){
						alert("베슽흐 메뉴는 최대 4개까지만 등록할 수 있습니다.");
					}
				});
			} else {
				let best="no";
				let obj={num, best, storeNum, storeName};
				ajaxPromise("${pageContext.request.contextPath}/store/bestOnOff.do", "post", obj)
				.then(function(response){
					return response.json();
				}).then(function(data){
					console.log(data);
					icons[i].classList.toggle('fas');
				});
			}		
		});
	}
	
	// 카테고리 안에 x 버튼 넣어서 로딩하기
	// 페이지 로딩되는 시점에 작동할 함수
	window.onload=function(){
		// 태그에 해당하는 버튼들의 array
		let links=document.querySelectorAll(".category");
		for(let i=0; i<links.length; i++){
			// 버튼의 data-num 성분의 값을 가져옴
			let dataNum=links[i].getAttribute("data-num");
			//새로운 버튼을 만듦(취소 버튼)
			let deleteBtn=document.createElement("button");
			// 새로운 버튼에 class와 data-num 정보를 지정
			deleteBtn.setAttribute("class", "btn-close del-category btn-sm");
			deleteBtn.setAttribute("data-num", dataNum);
			// 각 버튼에 자식 요소로 넣어줌
			links[i].appendChild(deleteBtn);
		}
		// 새로 만들어진 취소 버튼에 삭제 이벤트를 부여
		deleteCategory(".del-category", ".category");
	};
	
	// 매장 카테고리를 추가하는 method
	document.querySelector("#addCategoryForm").addEventListener("submit", test);
	
	// 태그를 추가하는 함수에 들어갈 함수
	function test(e){
		e.preventDefault();
		// 태그를 추가할 버튼의 data-num 성분을 읽어옴
		let num=this.getAttribute("data-num");
		// 추가하고 싶은 태그를 작성한 input 요소의 값을 읽어옴
		let category=document.querySelector("#inputCategory").value;

		let wantAdd=confirm("카테고리를 추가하시겠습니까?");
		if(category==""){
			alert("카테고리를 작성해주세요.");
		} else if(wantAdd){
			
			// 두 정보를 object로 만들어서 전달할 준비
			let obj={num, category};
			console.log(obj);
			
			// 해당 링크를 요청하면서 object를 전달하고
			ajaxPromise("${pageContext.request.contextPath}/store/addCategory.do", "post", obj)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				// 데이터를 받으면
				if(data.beAdded){
					// 카테고리 추가 input 창을 reset함
					document.querySelector("#inputCategory").value="";

					// 해당 매장의 DB 번호를 받아서
					let dataNum=${dto.num};
					
					// 새로운 링크 버튼을 만들고 속성과 값을 부여함.
					let newLink=document.createElement("a");
					newLink.innerText=category;
					let path="${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}&category="+category;
					newLink.setAttribute("href", path);
					
					// 새로운 태그 버튼을 만들고 속성과 값을 부여함
					let newLi=document.createElement("li");
					newLi.setAttribute("class", "add-category");
					newLi.setAttribute("data-num", dataNum);
					newLi.appendChild(newLink);
					
					// 새로운 취소 버튼을 만들고 성분과 값을 부여함
					let newDeleteBtn=document.createElement("button");
					newDeleteBtn.setAttribute("class", "btn-close add-del-category");
					newDeleteBtn.setAttribute("data-num", dataNum);
					// 새 li의 자식 요소로 취소 버튼을 넣고, 카테고리 li 또한 카테고리 공간의 자식 요소로 넣어줌
					newLi.appendChild(newDeleteBtn);
					document.querySelector("#categories").appendChild(newLi);

					// 새롭게 만든 삭제 버튼에 태그 삭제 이벤트 부여
					deleteCategory(".add-del-category", ".add-category");
					newLi.setAttribute("class", "category");
					newDeleteBtn.setAttribute("class", "btn-close del-category");
					
					// 모달 창을 닫는다.
					document.querySelector("#modal-close").click();
				}
			});
		}
	}

	// 카테고리를 삭제하는 함수 (추가된 삭제 버튼, 추가된 태그 버튼)
	function deleteCategory(addDeleteCategory, addCategory){
		// 추가된 삭제 버튼, 태그버튼들
		let deleteBtns=document.querySelectorAll(addDeleteCategory);
		let categories=document.querySelectorAll(addCategory);
		// 버튼의 개수만큼 반복
		for(let i=0; i<deleteBtns.length; i++){
			// 버튼의 data-num 성분의 값과 태그 값을 얻어서 object로 담음
			let num=deleteBtns[i].getAttribute("data-num");
			let category=categories[i].innerText;
			console.log(category);
			let obj={num, category};
			// 삭제 버튼을 눌렀을 때 작동할 이벤트
			deleteBtns[i].addEventListener("click", function(){
				// 삭제여부를 확인
				console.log(obj);
				let toDelete=confirm("이 카테고리를 삭제하시겠습니까?");
				if(toDelete){
					// 해당 경로를 요청하면서 object 전달
					ajaxPromise("${pageContext.request.contextPath}/store/deleteCategory.do", "post", obj)
					.then(function(response){
						return response.json();
					}).then(function(data){
						console.log(data);
						if(data.beDeleted){
							// 해당 카테고리 버튼과 삭제버튼을 지움.
							categories[i].remove();
							deleteBtns[i].remove();
						}
					});	
				}
			});
		}
	}
	
</script>
</body>
</html>