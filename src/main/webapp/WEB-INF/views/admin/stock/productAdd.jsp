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
	                        <h2>Product Add</h2>
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
        <div class="table-responsive justify-content-center">
                  <div class="table_div">
                  	<form action="${path}/productAddAction.st?${_csrf.parameterName}=${_csrf.token}" method="post" name="productAdd" enctype = "multipart/form-data">
	                     <table class="table table-hover" id = "product_Add" align="center" style = "font-family:Noto Sans; width:600px; font-size:12px;">
	                        <tr>
	                        	<th>브랜드</th>
	                        	<td><input type="text" class="input" id = "brand" name="brand" size="60" placeholder="상품명 입력" required autofocus></td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>상품명</th>
	                        	<td><input type="text" class="input" id = "pdName" name="pdName" size="60" placeholder="상품명 입력" required autofocus></td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>무게</th>
	                        	<td>
	                        		<select id="weight" class="input" name="weight" required>
	                        		<option>무게</option>
	                        		<option value="500g">500g</option>
	                        		<option value="1kg">1kg</option>
	                        		</select>
	                        	</td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>카테고리</th>
	                        	<td>
	                        		<select id="category" class="input" name="category" required>
	                        		<option>분류</option>
	                        		<option value="SINGLE_ORIGIN">SINGLE_ORIGIN</option>
	                        		<option value="BLENDING">BLENDING</option>
	                        		<option value="SPACIAL">SPACIAL</option>
	                        		</select>
	                        	</td>
	                        </tr>
	                        	
	                        <tr>
	                        	<th>이미지</th>
	                        	<td><input type="file" class="input" name="pdImg" id = "pdImg" accept = "pdImg/*"></td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>제품설명</th>
	                        	<td><textarea rows = "5" cols = "55" id = "content" name = "content" placeholder="제품설명 입력" required></textarea></td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>판매가</th>
	                        	<td><input type="number" class="input" name="price" placeholder="판매가입력" required></td>
	                        
	                        
	                        </tr>
	                        
	                        <tr>
	                        	<th>등록수량</th>
	                        	<td><input type="number" class="input" name="quantity" id = "quantity" placeholder="재고수량입력" required></td>
	                        </tr>
	                        
	                        <tr>
	                        	<th>판매상태</th>
	                        	<td>
	                        		<select id="status" class="input" name="status" required>
	                        			<option>상품판매상태</option>
	                        			<option value="판매중" selected>판매중</option>
	                        			<option value="품절" selected>품절</option>
	                        		</select>
	                        	</td>
	                        </tr>
	                        
	                        <tr class="table-light">
	                        	<td colspan="2" style="border-bottom: none;">
	                        		<br>
	                        		<div align="center">	
		                        		<input type="submit" class="btn btn-secondary btn-sm" value="등록">
		                        		<input type="reset" class="btn btn-secondary btn-sm" value="초기화">
	                        		</div>
	                        	</td>
	                      </table>
	                 </form>
                  </div>
               </div>
               <!-- 내용 종료 -->
              </div>
  
    
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



</body>

</html>