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

        <!-- 내용 시작 -->
       <div class="container">
        <form class ="productlist" method = "post">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
		 	<div align = "center"><p style = "color:black;">환불완료목록</p></div>
              <br>
                  <div class = "contents justify-content-center">
                     <table class = "box table table-hover product" align="center">
                     	<thead style="text-align:center;">
                        <tr>
                           <th class = "order_no">환불번호</th>
                           <th class = "user_id">id</th>
                           <th class = "order_summary">주문요약</th>
                           <th class = "product_total">환불금액</th>
                           <th class = "order_date">신청날짜</th>
                           <th class = "admin_statement">상태</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider" style="text-align:center;">
                        <c:forEach var = "dto" items = "${list}">
                        <input type = hidden name = "refundNo" value = "${dto.refundNo}">
                        <input type = hidden name = "pdNo" value = "${dto.pdNo}">
                        <tr>
                           <td class = "order_no">${dto.refundNo}</td>
                           <td class = "user_id">${dto.customerId}</td>
                           <td class = "order_summary">${dto.brand} ${dto.pdName} ${dto.weight} ${dto.refundQuantity}개</td>
                           <td class = "product_total">${dto.refundTotal}원</td>
                           <td class = "order_date">${dto.refundDate}</td>
                           <td class = "admin_statement">${dto.refundState}</td>
	                     </tr>
	                     </c:forEach>
                        </tbody>
                     </table>
                	    </div>
                	 </form>
                	</div> 
               <!-- 내용 종료 -->

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