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
	<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>


</head>
<title>중복확인 페이지</title>

</head>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("이메일 인증 실패!!");
			window.location = "login.do";
		</script>
	</c:if>

	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("이메일 인증 성공!!");
			window.location = "login.do";
		</script>
	</c:if>
</body>
</html>