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
		//checkbox 삭제
	$("#delete_cart").click(function(){
		if(confirm("삭제할까요?")){
		document.cartForm.action = "${path}/cartDeleteAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.cartForm.submit();
		}
	});
		
		//checkbox 구매
	$("#check_buy").click(function(){
		if(confirm("선택상품을 구매하시겠습니까?")){
		document.cartForm.action = "${path}/cartBuycheck.sh?${_csrf.parameterName}=${_csrf.token}";
		document.cartForm.submit();
		}
	});
		
		
		
		//개별 수정
	$(".update_one").click(function(){
		var cartNo = $(this).data("num");
		var pdNo = $(this).data("num2");
		var cartQuantity = $(this).prev().val();
		location.href = "${path}/updateCartOne.sh?cartNo="+cartNo+"&pdNo="+pdNo+"&cartQuantity="+cartQuantity+"&${_csrf.parameterName}=${_csrf.token}";
	});
	
		//전체수정
	$("#update_all").click(function(){
		if(confirm("수정할까요?")){
		document.cartForm.action = "${path}/cartUpdateAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.cartForm.submit();
		}
	});
		
	$("#cart_buy").click(function(){
		if(confirm("전체 상품을 주문하시겠습니까?")){
		document.cartForm.action = "${path}/buyInsertAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.cartForm.submit();
		}
	});

});

// 개별 삭제버튼
function deleteOne(cartNo) {
	if(confirm("삭제할까요?")) {
		location.href = "${path}/cartDeleteOne.sh?cartNo="+cartNo+"&${_csrf.parameterName}=${_csrf.token}";
	}
}

// 개별 수정 버튼


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
	                        <h2>장바구니</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
    
    <!--shopping cart area start -->
    <div class="shopping_cart_area">
        <div class="container">  
            <form name = "cartForm" action="#" method = "post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive" style = "font-family:'맑은 고딕';">
                                <table>
                            <thead>
                                <tr>
                                    <th class="product_select">select<br>
                                                             <label for="all_check" style="font-size:11px">ALL<br></label>
            												 <input type="checkbox" id="all_check"></th>
                                    <th class="product_remove">원산지<br></th>
                                    <th class="product_remove">상품명<br></th>
                                    <th class="product_quantity">상품옵션<br></th>
                                    <th class="product_thumb">Image</th>
                                    <th class="product_name">중량</th>
                                    <th class="product-price">단가</th>
                                    <th class="product_remove">Quantity</th>
                                    <th class="product_total">SubTotal</th>
                                    <th class="cart_update">Update</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var = "dto" items = "${list}">
                                	<input type="hidden" name = "cartOption" value = "${dto.cartOption}">
                                	<input type="hidden" name = "cartNo" value = "${dto.cartNo}">
                                	<input type="hidden" name = "pdNo" value = "${dto.pdNo}">
                                <tr>
                                    <td class="product_select">
                                    	<input type="checkbox" name="cartChk" id="cart_select" class="p_selectChk" value="${dto.cartNo}">
                                    </td>
                                    <td class="product_name">${dto.brand}</td>
                                    <td class="product_remove">${dto.pdName}</td>
                                    <td class="product_remove">${dto.cartOption}</td>
                                    <td class="product_thumb"><a href="#"><img src="${dto.pdImg}"></a></td>
                                    <td class="product-price">${dto.weight}</td>
                                    <td class="product-price">${dto.price}원</td>
                                    <td class="product_quantity">
                                    	<input type = "number" min = "1" max = "10" name = "cartQuantity" id = "cartQuantity" value = "${dto.cartQuantity}">개
                                    	<input type="button" class="update_one" value="변경" data-num="${dto.cartNo}" data-num2 = "${dto.pdNo}" >
                                    </td>
                                    <td class="product_total">
                                    	<div id = "cartSubTotal">${dto.cartTotal}원</div>
                                    </td>
                                    <td class="product_total">
                                    	<input type="button" name="delete_one" class="delete_one" value="삭제" onclick="deleteOne(${dto.cartNo});">
                                    </td>
                                </tr>
                                </c:forEach>
                           </tbody>
                        </table>   
                            </div> 
                            <c:forEach var = "dto" items = "${list}" begin = "0" end = "0" varStatus="status"> 
                              <c:set var= "pdNo" value="${dto.pdNo}"/>
	                              <c:if test = "${empty pdNo}">
	                              </c:if>
	                              <c:if test = "${!empty pdNo}">
	                           		<div class="cart_submit">
	                                <button type = "button" id = "update_all">Update All</button></td>
	                                <button type = "button" id = "delete_cart">Delete checked Product</button>
	                                <button type = "button" id = "check_buy">Buy checked Product</button>
	                            </div>   
	                           </c:if>
                          	</c:forEach>                           
                        </div>
                     </div>
                 </div>
                 <!--total area start-->
                <div class="result_area">
                    <div class="row">
                       <div class= align-items-center>
                   		<div id = "cart_total_display">
                            <div class="cart_result right">
                                <h3>Cart Totals</h3>
                                <div class="cart_inner" id = "cart_inner">
                                   <div class="cart_total">
                                       <p>OrderList</p><br>
                                       <p class="cart_Famount">
                                       
                                       <c:forEach var = "dto" items = "${list}"> 
										${dto.brand} ${dto.pdName} ${dto.cartOption} ${dto.weight} ${dto.cartQuantity}개<br>
										</c:forEach><br>
										</p>
                                      
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>SubTotal</p>
                                       <p class="cart_Famount">
                                        <c:set var = "total" value = "0" />
                                        <c:forEach var = "dto" items = "${list}" varStatus="status"> 
                                        	<c:set var= "total" value="${total + dto.cartTotal}"/>
                                        </c:forEach>
                                        	<c:out value="${total}원"/>
                                       </p>
                                   </div>
                                   <div class="cart_subtotal ">
                                       <p>Shipping Fee</p>
                                       <p class="cart_shippingFee">0원 </p>
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>total</p>
                                       <p class="cart_amount">
                                       <c:set var = "total" value = "0" />
                                        <c:forEach var = "dto" items = "${list}" varStatus="status"> 
                                        	<c:set var= "total" value="${total + dto.cartTotal}"/>
                                        </c:forEach>
                                        	<c:out value="${total}원"/>
                                       
                                       </p> 
                                   </div>
                                   <c:forEach var = "dto" items = "${list}"  begin = "0" end = "0"  varStatus="status"> 
                                      <c:set var= "pdNo" value="${dto.pdNo}"/>
                                      <c:if test = "${empty pdNo}">
                                      </c:if>
                                      <c:if test = "${!empty pdNo}">
                                   		<div class="checkout_btn">
                                       		<button type = "button" id = "cart_buy">구매하기 </button>
                                   		</div>
                                   </c:if>
                                        </c:forEach>
                                </div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--total area end-->
            </form> 
        </div>     
    </div>
    <!--shopping cart area end -->
    
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


<!-- Main JS -->
<script src="${path}/resources/bootsAssets/js/main.js"></script>

<!-- common JS  -->
<script src="${path}/resources/js/common.js"></script>



</body>

</html>