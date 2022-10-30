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
   

  <p><hr></p>
    
   <!-- 관리자 회원관리 컨텐츠 시작 -->
   <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>MEMBER MANAGEMENT</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    
	    <!-- menu start -->
	    <%@ include file = "../member/menu.jsp" %>
	    <!-- menu end -->
	    
        <!-- 내용 시작 -->
	   	<div class="container">
	      <form class ="productlist">
	 		<div align = "center"><p style = "color:black;">회원관리</p></div>
	      		<div class = "contents justify-content-center">
                     <table class = "box table table-hover product" align="center";>
                     	<thead style="text-align:center;">
                           <tr>
                               <th>Name</th>
                               <th>ID</th>
                               <th>주소</th>
                               <th>연락처</th>
                               <th>생년월일</th>
                               <th>Email</th>
                           </tr>
                       </thead>
                       <tbody>
                       	<c:forEach var = "dto" items = "${list}">
                           <tr>
                               <td>${dto.id}</td>
                               <td>${dto.name}</td>
                               <td>${dto.address}</td>
                               <td>${dto.hp}</td>
                               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.birthday}"/></td>
                               <td>${dto.email}</td>
                           </tr>
                           </c:forEach>
                        </tbody>
                     </table>
              	    </div>
              	    </form>
              	</div> 
               	                     
   <!--footer area start-->
   <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
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

<!-- Member JS -->ript>
</body>

</html>