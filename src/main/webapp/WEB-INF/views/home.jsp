<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 페이지</title>
</head>
<body>
	<script type="text/javascript">
		setTimeout(function() {
			window.location='${path}/index.do' 			
		}, 1000);
		
	</script>
</body>
</html>