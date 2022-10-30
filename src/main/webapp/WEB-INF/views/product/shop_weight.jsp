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
    <!--modernizr min js here-->
    <script src="${path}/resources/bootsAssets/js/vendor/modernizr-3.7.1.min.js"></script>
<script type="text/javascript">
function loginpop() {
	window.open("${path}/login2.do", "a", "width = 600, height = 450");
}

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
                    <c:forEach var = "dto" items="${list}" begin = "0" end = "0">
                         <h3>${dto.weight}</h3>
                     </c:forEach>    
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--shop  area start-->
   	<div class = "shop_area"> 
		<div class="container-fluid">
		
		 <!-- 상품목록 -->
				<div class="row">
				 <c:forEach var = "dto" items="${list}">
					<div class="col-md-3">
						<div class="card" style="width: 18rem;">
						  <img src="${dto.pdImg}" class="card-img-top">
						   <div class="card-body">
						    <h4 class="card-title">${dto.brand} ${dto.pdName} ${dto.weight}</h4>
						    <p class="card-text">${dto.price}</p>
						    <c:if test="${empty sessionScope.customerId}">
						    <button type = button class="btn btn-secondary btn-sm" onclick = "loginpop();">Details</button>
						    
						    </c:if>
						    <c:if test="${not empty sessionScope.customerId}"> 
						    <a href="${path}/product_details.sh?pdNo=${dto.pdNo}&${_csrf.parameterName}=${_csrf.token}" class="btn btn-secondary btn-sm">Details</a>
						    </c:if>
						  </div>
						</div>
					</div>
					</c:forEach>
					
				</div>
			<!-- 상품목록 끝 -->
			
		</div>
	</div>
	
                   
    <!--shop  area end-->
    
  
    
    <!--footer area start-->
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
    <!--footer area end-->
      

<!-- JS
============================================ -->

<!-- Plugins JS -->
<!--jquery min js-->
<script src="${path}/resources/bootsAssets/js/bootstrap.min.js"></script>
<script src="${path}/resources/bootsAssets/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/bootsAssets/js/vendor/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/bootsAssets/js/popper.js"></script>
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