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
	<script>
	$(function(){
		outSoldList();
	});	
	
	//지난구매 리스트
	function outSoldList(){
		$.ajax({
			url: "${path}/outSoldList.ad?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			success : function(result) {
				$("#outSoldList").html(result);
			},
			error: function(){
				alert("outSoldList 오류");
			}
		});
	};	
	
	</script>


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
	                        <h2>Order Confirm</h2>
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
          <form class = "productlist" method = "post">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 	<div align = "center"><p style = "color:black;">주문승인</p></div>
              <br>
                <div class = "contents justify-content-center">
                  <table class = "box table table-hover product" align="center">
                   		<thead style="text-align:center;">
                	    <tr>
                           <th class = "order_no">주문번호</th>
                           <th class = "user_id">id</th>
                           <th class = "order_summary">주문요약</th>
                           <th class = "m_address">주소</th>
                           <th class = "product_total">결제금액</th>
                           <th class = "order_date">주문날짜</th>
                           <th class = "product_total">확인</th>
                           <th class = "admin_statement">상태</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider" style="text-align:center;">
                        <c:forEach var = "dto" items = "${list}">
                        <input type = hidden name = "orderNo" value = "${dto.orderNo}">
                        <input type = hidden name = "pdNo" value = "${dto.pdNo}">
                        <tr>
                           <td class = "order_no">${dto.orderNo}</td>
                           <td class = "user_id">${dto.customerId}</td>
                           <td class = "order_summary">${dto.pdName} ${dto.orderOption} ${dto.orderweight} ${dto.orderQuantity}</td>
                           <td class = "m_address">${dto.shipAddress}</td>
                           <td class = "product_total">${dto.orderTotal}원</td>
                           <td class = "order_date">
                           		<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.orderDate}"/>
                           </td>
	                       <td>
	                       <input type = "button" value = "승인" class="btn btn-secondary btn-sm" onclick = "window.location = '${path}/updateOrderStateAction.ad?orderNo=${dto.orderNo}&orderState=주문승인'">
	                       </td>
	                       <td>${dto.orderState}</td>
	                     </tr>
	                     </c:forEach>
                        </tbody>
                     </table>
                	    </div>
                	 </form>
                	</div> 
                	<br><br>
                	<hr>
                	<br><br>
                	<div id = "outSoldList">
                	</div>
               <!-- 내용 종료 -->
    
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
</body>

</html>