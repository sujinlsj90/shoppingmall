<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/setting.jsp" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
		<!-- menu start --> 
		<p><hr></p>
   		<div class="contents"> 
			<ul class="nav nav-pills justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link active" style="background:black;" aria-current="page" href="#">MAIN</a>
			  </li>
			  <li class="nav-item dropdown">
			   <a class="nav-link dropdown-toggle" style="color:black;" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상품관리</a>
			    <ul class="dropdown-menu">
			      <li><a class="dropdown-item" style="font-size:13px;" href="${path}/productList.st">상품목록</a></li>
			      <li><a class="dropdown-item" style="font-size:13px;" href="${path}/productAdd.st">상품등록</a></li>
			    </ul>
			  </li>
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" style="color:black;" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">주문관리</a>
			    <ul class="dropdown-menu">
			      <li><a class="dropdown-item" style="font-size:13px;" href="${path}/orderConfirmList.ad">주문승인 & 판매목록</a></li>
			      <li><a class="dropdown-item" style="font-size:13px;" href="${path}/refundlist.ad">환불승인 & 환불목록</a></li>
			    </ul>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" style="color:black;" href="${path}/member.ad">회원정보</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" style="color:black;" href="${path}/balance.ad">결산</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" style="color:black;" href="${path}/balanceChart.ad">결산차트</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" style="color:black;" href="${path}/logout.do">로그아웃</a>
			  </li>

			</ul>
		</div>	
	   <br><br>

       <!-- menu end --> 

</html>