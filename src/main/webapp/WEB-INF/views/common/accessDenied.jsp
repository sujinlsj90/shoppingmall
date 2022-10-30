<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
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
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>
	<!-- header 시작 -->
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
	
	<!-- 로그인 컨텐츠 시작 -->
	<div id="container">
		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 align="center"> 관리자 페이지  </h1>
				<br>
				
				<p style = "font-size : 18px"> ${errMsg} </p>
				<c:if test ="${sessionScope.customerId != null}">
					<button value = "로그아웃" class = "inputButton" onclick = "window.location = 'logout.do'">로그아웃</button>
				</c:if>
				<c:if test ="${sessionScope.customerId == null}">
					<button value = "로그인" class = "inputButton" onclick = "window.location = 'login.do'">로그인</button>
				</c:if>
				
				 
				
				
			</div>
			
	<!-- 컨텐츠 종료 -->
	
    <!--footer area start-->
    <%@ include file = "footer.jsp" %>
    <!--footer area end-->


<!-- JS
============================================ -->

<!-- Plugins JS -->
<!--jquery min js-->

<script src="${path}/resources/bootsAssets/js/vendor/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/bootsAssets/js/popper.js"></script>
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




</body>

</html>