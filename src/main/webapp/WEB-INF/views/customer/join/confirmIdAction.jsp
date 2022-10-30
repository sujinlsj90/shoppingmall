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

	<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${path}/resources/bootsAssets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <!-- login & join CSS -->
    <link rel = "stylesheet" href = "${path}/resources/css/customerCss/join.css">
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>


</head>
</head>
<body onload = "confirmIdFocus();">
	
	<form name="confirmform" action="${path}/confirmIdAction.do" method="post" onsubmit = "return confirmIdCheck();">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<!-- id중복  -->
	<c:if test = "${selectCnt == 1}">

	<table style = "width:420px; text-align:center; margin:auto;">
		<tr>
			<th colspan = "2">
				<span>${id}</span>는 사용할 수 없습니다
			</th>
		</tr>
		<tr>
			<td> <span style = "color:black">아이디</span> </td>
			
			<td>
				<input type="text" class="input" name="id" maxlength = "20" 
				style = "width: 150px" placeholder="공백없이 15자 이내로 작성" autofocus required>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input class = "input" type = "submit" value = "확인">
				<input class = "input" type = "reset" value = "취소" onclick = "self.close();">
			</td>
		</tr>
	</table>
	</c:if>
		
	<!-- id 중복 아닐떄  -->
	<c:if test = "${selectCnt != 1}">
	<table style = "width:420px; text-align:center; margin:auto;">
		<tr>
			<th colspan = "2" align="center">
				<span>${id}</span>는 사용할 수 있습니다
			</th>
		</tr>
		
		<tr>
			<td colspan = "2" align="center">
				<input class = "input" type = "button" value = "확인" onclick="setId('${id}');">
			</td>
		</tr>
	</table>
	</c:if>
	</form>
</body>
<!-- JS
============================================ -->


<!-- common JS  -->
<script src="${path}/resources/js/common.js"></script>

</body>

</html>