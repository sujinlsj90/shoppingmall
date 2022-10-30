<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>    
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>*********BEANSMALL*******</title>
    <meta name="description" content="">
    <!-- 반응형웹 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/bootsAssets/img/favicon.ico">
    
    <!-- CSS  ======================== -->

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${path}/resources/bootsAssets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <!-- login & join CSS -->
    <link rel = "stylesheet" href = "${path}/resources/css/customerCss/join.css">
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>


	<script>
	$(function(){
		//목록버튼 클릭시 목록으로 이동
	$("#btnList").click(function(){
		location.href="${path}/boardList.bo"
	});
		
		//수정
	$("#btnUpdate").click(function(){
		var password = $("#password").val();
		var title = $("#title").val();
		var content = $("#content").val();
		
		if(password == ""){
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
		if(title == ""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		if(content == ""){
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		document.editForm.action = "${path}/board_updateAction.bo";
		document.editForm.submit();
		//삭제
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제할까요?")){
		document.editForm.action = "${path}/board_deleteAction.bo";
		document.editForm.submit();
		}
	});;
		

});
	</script>

</head>

<body>

	<!-- header 시작 -->
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
   
	 <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>COMMUNITY</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    
	    <!--boardwrite area-->
	    <div class="boardlist_area" style = "max-width:900px; margin:auto;">
	   		 <div class="container">  
	   		 	 <form class = "board_write" name = "editForm" method = "post">  
	   		 	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="row align-items-center">
                    	<div class="col-12">
                       	 <div class="board_desc">
                       	 	<div class="board_page" style = "font-family:'맑은 고딕';"> 
                       	 		<div class="mb-3">
								  작성자: <input type="text" id="writer" name = "writer" value = "${dto.writer}">
								 <%-- 비밀번호: <input type="password" id="password" name = "password" placeholder="password" value = "${dto.password}"> --%>
								  작성일: <input type="text" id="regDate" name = "regDate" value= "${dto.regDate}" readonly>
								</div>
								<div class="mb-3">
								  <label for="board_title" class="form-label" >TITLE</label>
								  <input type="text" class="form-control" id="board_title" name = "title" value = "${dto.title}" placeholder="제목을 입력하세요">
								</div>
								 <div class="mb-3">
								  <label>파일첨부</label><br>
								  <input class="form-control form-control-sm" id="formFileSm" type="file">
								</div>
								<div class="mb-3">
								  <label for="board_text" class="form-label">WRITE</label>
								  <textarea  rows="5" class="form-control" id="board_text" name = "content" rows="10">${dto.content}</textarea>
								</div>
							  </div>
							</div>
					 	 </div>  
							 <div class= "board_submit">
								<input type = "hidden" name = "num" value = "${dto.num}">  <!-- 실제 화면은 없지만 데이터는 넘겨줘야 할 때 hidden사용함 -->							 
	                       	 	<input type = "button" class="btn btn-outline-secondary btn-sm" id = "btnUpdate" style = "float:right;" value = "update">
	                       	 	<input type = "button" class="btn btn-outline-secondary btn-sm" id = "btnDelete" style = "float:right;" value = "delete">
	                       	 	<input type = "button" class="btn btn-outline-secondary btn-sm" id = "btnList" style = "float:right;" value = "list">
                       	 	</div><br><br>
					 		</div>
					 		</form>
					 	</div>
					</div>


  	<!-- 컨텐츠 끝 -->
  
	<!-- footer 시작 -->
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
		
    
<!-- JS
============================================ -->

<!-- Plugins JS -->
<!--jquery min js-->
<script src="${path}/resources/bootsAssets/js/vendor/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/bootsAssets/js/popper.js"></script>
<script src="${path}/resources/bootsAssets/js/bootstrap.min.js"></script>
<script src="${path}/resources/bootsAssets/js/plugins.js"></script>
<script src="${path}/resources/bootsAssets/js/owl.carousel.main.js"></script>
<script src="${path}/resources/bootsAssets/js/jquery.nice.select.js"></script>
<script src="${path}/resources/bootsAssets/js/scrollup.js"></script>
<script src="${path}/resources/bootsAssets/js/ajax.chimp.js"></script>
<script src="${path}/resources/bootsAssets/js/jquery.ui.js"></script>
<script src="${path}/resources/bootsAssets/js/jquery.elevatezoom.js"></script>
<script src="${path}/resources/bootsAssets/js/imagesloaded.js"></script>
<script src="${path}/resources/bootsAssets/js/isotope.main.js"></script>
<script src="${path}/resources/bootsAssets/js/jqquery.ripples.js"></script>
<script src="${path}/resources/bootsAssets/js/jquery.cookie.js"></script>
<script src="${path}/resources/bootsAssets/js/bpopup.js"></script>

<!-- Main JS -->
<script src="${path}/resources/bootsAssets/js/main.js"></script>

<!-- common JS -->
<script src="${path}/resources/js/common.js"></script>
