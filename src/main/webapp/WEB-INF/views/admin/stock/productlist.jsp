<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/setting.jsp" %>          
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>*********BEANSMALL*******</title>
    <meta name="description" content="">
    <!-- 반응형웹 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- icon -->
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/bootsAssets/img/favicon.ico">
    
    <!-- CSS  ======================== -->
    <!-- bootstrap CSS -->	
    <link rel = "stylesheet" href = "${path}/resources/bootsAssets/css/bootstrap.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${path}/resources/bootsAssets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <!-- login & join CSS -->
    <link rel = "stylesheet" href = "${path}/resources/css/adminCss/admin.css">
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>


</head>


<body>
   <!--header area start-->
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <!--header area end-->

    
   <!-- orderconfirm 시작 -->
	  <p><hr></p>
  	
         <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>Product List</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    
	    <!-- menu start -->
	    <%@ include file = "/WEB-INF/views/admin/member/menu.jsp" %>
	    <!-- menu end -->
        <!-- 내용 시작 -->
         <div class="container">
         <form class ="productlist" method = "post">
         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			 	<div align = "center"><p style = "color:black;">상품목록</p></div>
	              <br>
	                  <div class = "contents justify-content-center">
	                     <table class = "box table table-hover product" style = "text-align:center; width :1000px; margin: auto; font-size: 13px;">
								<tr>
									<th style="width:5%">번호</th>
									<th style="width:10%">브랜드</th>
									<th style="width:10%">상품명</th>
									<th style="width:10%">상품이미지</th>
									<th style="width:10%">카테고리</th>
									<th style="width:10%">가격</th>
									<th style="width:10%">등록수량</th>
									<th style="width:10%">상태</th>
									<th style="width:15%">등록일</th>
									<th style="width:5%">수정</th>
									<th style="width:5%">삭제</th>
								</tr>
								
								<!-- 게시글이 있으면 -->
								<c:forEach var = "dto" items="${list}">
								<tr>
									<td>${dto.pdNo}</td>
									<td>${dto.brand}</td>
									<td>${dto.pdName}</td>
									<td><img src = "${dto.pdImg}" width = "50px" height = "50px"></td>
									<td>${dto.category}</td>
									<td>${dto.price}원</td>
									<td>${dto.quantity}개</td>
									<td>${dto.status}</td>
									<td>${dto.indate}</td>
									<td>
										<input type = "button" value = "수정" class="btn btn-secondary btn-sm" onclick = "window.location = '${path}/productDetailAction.st?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">
									</td>
									<td>
										<input type = "button" value = "삭제" class="btn btn-secondary btn-sm" onclick = "window.location = '${path}/productDeleteAction.st?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">
									</td>	
								</tr>
								</c:forEach>
								
			                     <tr>
			                     	<td colspan = "11" align = "center">
			                     		<!-- 페이징 처리 -->
			                     		<!-- 이전버튼활성화여부 -->
			                     		<c:if test = "${paging.startPage > 10}">
			                     			<a href = "${path}/productlist.st?pageNum=${paging.prev}">[이전]</a>
			                     		</c:if> 
			                     		<!-- 페이지 번호 처리 -->
			                     		<c:forEach var = "pdNo" begin = "${paging.startPage}" end = "${paging.endPage}" >
			                     			<a href = "${path}/productlist.st?pageNum=${pdNo}">${pdNo}</a>
			                     		</c:forEach>
			                     		<!-- 다음버튼활성화여부 -->
			                     		<c:if test = "${paging.endPage < paging.pageCount}">
			                     			<a href = "${path}/productlist.st?pageNum=${paging.next}">[다음]</a>
			                     		</c:if>
			                     	</td>
			                     </tr>
	                   		  </table>
	                	    </div>
                	 </form>
                	</div> 
               <!-- 내용 종료 -->
               	                     
    
   <!--footer area start-->
   
   <!--footer area end-->

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

<!-- common JS  -->
<script src="${path}/resources/js/common.js"></script>
</body>

</html>