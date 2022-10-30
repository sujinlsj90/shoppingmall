<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/setting.jsp" %>          
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>*********BEANSMALL*******</title>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@500&display=swap');
	</style>
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
		bought_list();
	});	
	
	//지난구매 리스트
	function bought_list(){
		$.ajax({
			url: "${path}/boughtList.my?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			success : function(result) {
				$("#boughtList").html(result);
			},
			error: function(){
				alert("boughtList 오류");
			}
		});
	};	
	</script>

</head>
<body>
   <!--header area start-->
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <!--header area end-->

         <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>My Account</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
    
    <!--buyList area start -->
    <div class="buyList_area">
        <div class="container">  
            <form name = "buylist_form" method = "post"> 
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cust_buy table-responsive" style = "font-family:'맑은 고딕';">
                                <table>
		                            <thead>
		                                <tr>
		                                    <th class="refund_select">
		                                    						<label for="all_check" style="font-size:11px">ALL<br></label>
		            												 <input type="checkbox" id="all_check"></th>
		                                    <th class="order_summary">OrderItems</th>
		                                    <th class="m_address">Shipping Address</th>
		                                    <th class="product_total">Total</th>
		                                    <th class="order_date">OrderDate</th>
		                                    <th class="order_statement">Statement</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                	<c:forEach var = "dto" items = "${list}"> 
		                                	<input type = "hidden" id = "orderState" name = "orderState" value = "${dto.orderState}">
		                                <tr>
		                                    <td class="refund_select"><input type="checkbox" name="orderNo" id="p_select" class="p_selectChk" value="${dto.orderNo}"></td>
		                                    
		                                    <td class="order_summary">
		                                    	<a href="#"><p>${dto.brand} ${dto.pdName} ${dto.orderOption} ${dto.orderweight} ${dto.orderQuantity}개</p></a>
		                                    </td>
		                                    <td class="m_address">${dto.shipAddress}</td>
		                                    <td class="product_total">${dto.orderTotal}원</td>
		                                    <td class="order_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.orderDate}"/></td>
		                                    <td class="order_statement">${dto.orderState}</td>
		                                </tr>
		                               	</c:forEach>
		                            </tbody>
                        		`</table>  
	                       </div>
	                       <br>
                     </div>
                 </div>
              </div>
            </form> 
        </div>
        <div id = "boughtList">
        
        </div>     
    </div>
    <!--buyList area end -->
    

    
    <!--footer area start-->
         <div class="footer_middel">
                <div class="row">
                    <div class="col-12">
                        <div class="footer_middel_menu">
                        	<hr>
		                   <ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보 처리방침</a></li>
		  					</ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bottom">
               <div class="row">
                    <div class="col-12">
                       <div>
						<p> 고객센터 010-1111-2222</p>
						<p> 평일 및 주말 10:00 ~ 17:00(공휴일휴무)
							점심시간: 12:00~13:00</p>
					   </div>
						<div>
							<span><strong>법인명</strong> KOSMOcorp</span>
							<span><strong>대표</strong> Park Hana</span>
							<span><strong>사업자번호</strong> 000-11-2222</span>
							<span><strong>소재지</strong> 서울시 금천구 가산동</span>
						</div>
                    </div>
                </div>
            </div>
      
    

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


<!-- Main JS -->
<script src="${path}/resources/bootsAssets/js/main.js"></script>

<!-- common JS  -->
<script src="${path}/resources/js/common.js"></script>



</body>

</html>