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
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/bootsAssets/img/favicon.ico">
    
    <!-- CSS  ======================== -->

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${path}/resources/bootsAssets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <!-- login & join CSS -->
    <link rel = "stylesheet" href = "${path}/resources/css/customerCss/join.css">
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>


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
	                        <h2>주문 결과</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
    
		<!-- 주문완료 내용 시작 -->
		<c:choose>
			<c:when test="${insertCnt == 1}">
				<div class="join">
					<form>	
						<div class="form-floating">
							<span style = "color:brown"><b>${sessionScope.customerId}</b></span>님의 주문이 정상적으로 접수되었습니다.<br> 자세한 내용은 구매목록에서 확인해주세요.
						</div>
						<div class="form-floating">
						<br>
							<input type="button" class="button_login" value="구매목록" onclick="window.location='${path}/orderList.my'">
							<input type="button" class="button_login" value="쇼핑하기" onclick="window.location='${path}/shop.sh?category=SINGLE_ORIGIN'">
						</div>						
					</form>	
				</div>
			</c:when>
			<c:when test="${insertCnt == 0}">
							<div class="join">
					<form>	
						<div class="form-floating">
							<span style = "color:brown"><b>${sessionScope.customerId}</b></span>님의 주문이 정상적으로 접수되지 않았습니다. <br>다시 주문해주세요.
						</div>
						<div class="form-floating">
						<br>
							<input type="button" class="button_login" value="구매목록" onclick="window.location='${path}/orderList.my'">
							<input type="button" class="button_login" value="쇼핑하기" onclick="window.location='${path}/shop.sh?category=SINGLE_ORIGIN'">
						</div>
					</form>	
				</div>
			</c:when>
		</c:choose>

		<!-- 주문완료 내용 종료 -->
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
<script src="${path}/resources/bootsAssets/js/bpopup.js"></script>

<!-- Main JS -->
<script src="${path}/resources/bootsAssets/js/main.js"></script>

<!-- common JS  -->
<script src="${path}/resources/js/common.js"></script>

</body>

</html>