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


 //환불신청버튼
function refundReq(soldNo) {
		if(confirm("환불을 신청하시겠습니까?")) {
			location.href = "${path}/refundAction.my?soldNo="+soldNo+"&${_csrf.parameterName}=${_csrf.token}";
	}
}

</script>
<body>
	<!--breadcrumbs2 area start-->

    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <h4 style="font-family:'나눔고딕';">지난 구매내역</h4>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs2 area end-->


     <!--buyend area start -->
    <div class="buyList_area">
        <div class="container">  
            <form name = "boughtlist" method = "post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cust_buy table-responsive" style = "font-family:'맑은 고딕';">
                                <table>
                            <thead>
                                <tr>
                                    <th class="order_summary">OrderItem</th>
                                    <th class="product_total">Total</th>
                                    <th class="order_date">구매완료일</th>
                                    <th class="buy_statement">Statement</th>
                                    <th class="buy_statement">환불신청</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "dto" items = "${list}">
                            	<input type = "hidden" name = "soldNo" value = "${soldNo}"> 
                                <tr>
                                    <td class="order_summary">
                                    	${dto.brand} ${dto.pdName} ${dto.soldOption} ${dto.weight} ${dto.soldQuantity}개
                                    </td>
                                    <td class="product_total">${dto.soldTotal}</td>
                                    <td class="order_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.soldDate}"/></td>
                                    <td class="buy_statement">${dto.soldState}</td>
                                    <td class="refund">
                                    	<input type="button" name="refund_req" class="refund_req" value="환불신청" onclick="refundReq(${dto.soldNo});"> 
                                    </td>
                                </tr>
                             </c:forEach>   
                            </tbody>
                        </table>  
                        </div>
                        <br>
                       <!--  <button class="btn btn-outline-secondary" style = "float:right;" id = "refund_request"> 환불신청 </button> -->
                     </div>
                 </div>
              </div>
                 
            </form> 
        </div>     
    </div>
    <!--buyend area end -->
       

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
</body>
</html>