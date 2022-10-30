<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 처리 페이지</title>
</head>
<body>
<!-- update 성공 -->
			<c:if test ="${deleteCnt == 0}">
				<script type = "text/javascript">
					alert("상품삭제를 실패했습니다");
					window.location = "${path}/productList.st?pageNum=${pageNum}";
				</script>
			</c:if>
			<!-- update 실패 -->
			<c:if test ="${deleteCnt == 1}">
				<script type = "text/javascript">
					alert("상품이 정상적으로 삭제했습니다")
					window.location = "${path}/productList.st?pageNum=${pageNum}";
				</script>
			</c:if>

</body>
</html>