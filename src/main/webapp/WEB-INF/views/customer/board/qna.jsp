<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>     
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

		<body>
	    <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>QnA</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    <!-- QnA area-->
	    <div class="qna_area">
	   		 <div class="container">  
	   		 	 <div class="accordion" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne"  style = "font-family:맑은고딕";>
				        배송기간은 얼마나 걸리나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
				      <div class="accordion-body">
				        <strong>오후 세시 이전 주문(입금확인)시 당일배송합니다.</strong> 지역별로 차이가 있으나, 일반적으로 평일기준 1~2일 내에 받아보실 수 있습니다(도서산간지역 제외)
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo"  style = "font-family:맑은고딕";>
				        환불은 어떻게 하나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
				      <div class="accordion-body">
				        <strong>환불은 구매 후 14일 이내에만 가능합니다.</strong> 14일 이내에 꼭 환불신청을 해주세요. 환불 조건은 없습니다. 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree"  style = "font-family:맑은고딕";>
				        교환은 어떻게 하나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
				      <div class="accordion-body">
				       <strong>교환은 구매 후 14일 이내에만 가능합니다.</strong> 14일 이내에 꼭 교환신청을 해주세요. 교환 조건은 없습니다. 
				      </div>
				    </div>
				  </div>
				</div>
		 	</div>
		</div>


  <!-- 컨텐츠 끝 -->
  
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

<!-- common JS -->
<script src="${path}/resources/js/common.js"></script>
</body>
</html>
