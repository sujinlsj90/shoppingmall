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
<script type="text/javascript">
//주문완료
function orderSheet(){
	if(confirm("주문을 접수하시겠습니까?")){
		document.chkout_form.action = "${path}/orderListInsertAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.chkout_form.submit();
		}
};

$(function(){
	//체크박스 삭제
	$("#delete_chkOutList").click(function(){
		if(confirm("삭제하시겠습니까?")){
		document.chkout_form.action = "${path}/chkOutDeleteAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.chkout_form.submit();
		}
	});
});


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
	                        <h2>구매하기</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
    
    <!--buy_total area start -->
    <div class="buynow_area">
        <div class="container">  
            <form name = "chkout_form" method = "post"> 
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="buynow_page table-responsive" style = "font-family:'맑은 고딕';">
                                <table>
                            <thead>
                                <tr>
                                	<th class="product_select">select<br>
                                                             <label for="all_check" style="font-size:11px">ALL<br></label>
            												 <input type="checkbox" id="all_check"></th>
                                    <th class="product_name" width = "70%">Product</th>
                                    <th class="product_total">SubTotal</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "dto" items = "${list}">
                            		<input type="hidden" name = "pdNo" value = "${dto.pdNo}">
                            		<input type="hidden" name = "chkoutQuantity" value = "${dto.chkoutQuantity}">
                            		<input type="hidden" name = "chkoutOption" value = "${dto.chkoutOption}">
                            		<input type="hidden" name = "chkoutNo" value = "${dto.chkoutNo}">
                                <tr>
                                	<td class="product_select"><input type="checkbox" name="buyChk" id="cart_select" class="p_selectChk" value="${dto.chkoutNo}"></td>
                                    <td class="product_name">${dto.brand} ${dto.pdName} ${dto.chkoutOption} ${dto.weight} ${dto.chkoutQuantity}개  / (단가: ${dto.price}원)</td>
                                    <td class="product_total">${dto.chkoutTotal}원</td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table> 
                           <c:forEach var = "dto" items = "${list}"  begin = "0" end = "0" varStatus="status"> 
	                           <c:set var= "pdNo" value="${dto.pdNo}"/>
	                           <c:if test = "${empty pdNo}">
	                           </c:if>
	                           <c:if test = "${!empty pdNo}">
	                        	<div class="cart_submit">
                               	 <button type="button" id = "delete_chkOutList">delete product</button>
                            	</div>
	                      	  </c:if>
                           </c:forEach>      
                        </div>
                     </div>
                 </div>
              </div>
                 
                 <!--result area start-->
                 <div class="result_area">
                    <div class="row">
                       <div class="col-6 d-inline-block">
                       		<div class="buy_result right">
                                <h3>Shipping Infomation</h3>
                                <div class="buy_inner">
                                   <div class="buy_subtotal">
                                       <p>주문자</p>
                                       <c:forEach var = "dto" items = "${list}" begin = "0" end = "0">
                                       <p class="c_name">${dto.cusName}</p>
                                       </c:forEach>
                                   </div>
                                   <div class="buy_subtotal ">
                                       <p>연락처</p>
                                       <c:forEach var = "dto" items = "${list}" begin = "0" end = "0">
                                       <p class="m_phone">${dto.cusPhone}</p>
                                       </c:forEach>
                                   </div>
                                   <div class="buy_subtotal ">
                                       <p>배송지</p>
                                       <c:forEach var = "dto" items = "${list}" begin = "0" end = "0">
                                       <p class="m_address">${dto.cusAddress}</p>
                                       </c:forEach>
                                   </div>
                                   
                                   <c:forEach var = "dto" items = "${list}"  begin = "0" end = "0" varStatus="status"> 
			                           <c:set var= "pdNo" value="${dto.pdNo}"/>
			                           <c:if test = "${empty pdNo}">
			                           </c:if>
			                           <c:if test = "${!empty pdNo}">
				                        	<div class="checkout_btn">
	                                      		 <a href="${path}/modifyCustomer.do">회원정보 수정</a>
	                                  		</div>
			                      	  </c:if>
		                           </c:forEach> 
                                   
                                </div>
                            </div>
                       </div>
                       <div class="col-6 d-inline-block">
                       	  <div class= align-items-center>
                            <div class="cart_result right">
                                <h3>Check Out</h3>
                                <div class="cart_inner" id = "cart_inner">
                                   <div class="cart_total">
                                       <p>OrderList</p><br>
                                       <p class="cart_Famount">
                                       <c:forEach var = "dto" items = "${list}"> 
										${dto.brand} ${dto.pdName} ${dto.chkoutOption} ${dto.weight} ${dto.chkoutQuantity}개<br>
										</c:forEach><br>
										</p>
                                      
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>SubTotal</p>
                                       <p class="cart_Famount">
                                        <c:set var = "total" value = "0" />
                                        <c:forEach var = "dto" items = "${list}" varStatus="status"> 
                                        	<c:set var= "total" value="${total + dto.chkoutTotal}"/>
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
                                        	<c:set var= "total" value="${total + dto.chkoutTotal}"/>
                                        </c:forEach>
                                        	<c:out value="${total}원"/>
                                       
                                       </p> 
                                </div>
		                           <c:forEach var = "dto" items = "${list}"  begin = "0" end = "0" varStatus="status"> 
			                           <c:set var= "pdNo" value="${dto.pdNo}"/>
			                           <c:if test = "${empty pdNo}">
			                           </c:if>
			                           <c:if test = "${!empty pdNo}">
			                        	<div class="checkout_btn">
                                      	 <button type = "button" onclick="orderSheet();">주문하기</button>
                                  		</div>
			                      	  </c:if>
		                           </c:forEach> 
                                   
                            </div>
                        </div>
                    </div>
                </div>
               </div> 
               </div>
                <!--result area end-->
            </form> 
        </div>     
    </div>
    
    <!--orderarea end -->
    
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