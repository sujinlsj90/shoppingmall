<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>     
<!doctype html>
<html class="no-js" lang="en">
<head>
</head>	
<body>
<form action="" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<c:forEach var = "dto" items = "${list}">
	   <div class="reviews_comment_box">
	          <div class="comment_text">
	              <div class="reviews_meta">
	                  <p><strong>${dto.writer} </strong>- <fmt:formatDate pattern="yyyy-MM-dd" value="${dto.req_date}"/>
	                  </p>
	                  <span>${dto.content}</span>
	              </div>
	          </div>
	      </div>   
     </c:forEach>
</form>     
               
</body>
</html>
