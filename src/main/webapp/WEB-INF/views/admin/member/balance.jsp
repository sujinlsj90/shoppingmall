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
    
    <!-- 결산 컨텐츠 시작 -->
  	
       <!-- 내용 시작 -->
         <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>BALANCE</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    
	    <!-- menu start -->
	        <%@ include file = "menu.jsp" %>
	    <!-- menu end -->
        <!-- orderlist start -->
        <div class="container">
         <form class ="productlist" method = "post">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
         
              <br>
                  <div class = "justify-content-center">
                     <table class = "box table table-hover product" style = "width: 600px;" align = "center">
                     	<thead style="text-align:center;">
                        <tr>
                           <th class = "product_no">결산일</th>
                           <th class = "order_no">최근30일 수입</th>
                           <th class = "user_id">최근 60일 수입</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider" style="text-align:center;">
                        <tr>
                           <td class = "product_no"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.today}"/></td>
                           <td class = "order_no">${dto.sold1mth}원</td>
                           <td class = "user_id">${dto.sold2mth}원</td>
                        </tr>   
                     </table>
                     
                      <table class = "box table table-hover product" style = "width: 600px;" align = "center">
                     	<thead style="text-align:center;">
                        <tr>
                           <th class = "product_no">결산일</th>
                           <th class = "order_no">최근30일 환불액</th>
                           <th class = "user_id">최근 60일 환불액</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider" style="text-align:center;">
                        <tr>
                            <td class = "product_no">${dto.today}</td>
                           <td class = "order_no">${dto.refund1mth}원</td>
                           <td class = "user_id">${dto.refund2mth}원</td>
                        </tr>   
                     </table>
                     <br>
                     <hr>
                     <br>
                     <table class = "box table table-hover product" style = "width: 600px;" align = "center">
                        <tr>
                           <th>최근 30일 수입</th>
                           <td class = "balance">총${dto.balance1mth}원</td>
                        </tr>
                        <tr>
                           <th>최근 60일 수입</th>
                           <td class = "balance">총${dto.balance2mth}원</td>
                        </tr>
                        <tbody class="table-group-divider" style="text-align:center;">
                          </table>
                          </div>
                	 </form>
                	</div> 
               <!-- 우측 내용 종료 -->
               	                     
    
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