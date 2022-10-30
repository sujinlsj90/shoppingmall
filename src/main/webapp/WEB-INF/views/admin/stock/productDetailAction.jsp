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
		//목록버튼 클릭시 목록으로 이동
	$("#btnList").click(function(){
		location.href="${path}/productList.st?pageNum=${pageNum}"
	});
});

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
	                        <h2>Product Detail</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    
	    <!-- menu start -->
	    <%@ include file = "/WEB-INF/views/admin/member/menu.jsp" %>
	    <!-- menu end -->
            
           <!-- 우측 내용 시작 -->
           
               <div class="table_div">
               	<form method = "post" action = "${path}/productUpdateAction.st?${_csrf.parameterName}=${_csrf.token}" name = "editForm"  enctype = "multipart/form-data"> 
                  	<input type = "hidden" name = "pageNum" value = "${pageNum}"> <!-- input에 없는 값을 싣고 감  -->
                  	<input type = "hidden" name = "hiddenPdNo" value = "${dto.pdNo}">
                  	<input type = "hidden" name = "hiddenPdImg" value = "${dto.pdImg}"> <!-- 기존상품이미지 -->
               
                  <table style="text-align:center; margin: auto; font-size: 13px;">
                     <tr>
                     	<th style = "width:170px;">제품번호 </th>
                     	<td style = "text-align:left;">
                     		${dto.pdNo}
                     	</td>
                     </tr>
                     <tr>	
                     	<th style = "width:170px;">상품명 *</th>
                     	<td style = "text-align:left;">
                     		<input type = "text" class = "stInput" name = "pdName" id = "pdName" size = "20" value = "${dto.pdName}" placeholder = "상품명을 입력하세요" required>
                     	</td>
                     </tr>
                     
                     <tr>
                        <th style = "width:150px;"> 국가명 * </th>
                     	<td style = "text-align:left;">
                     		<input type = "text" class = "stInput" id = "brand" name = "brand" size = "20" value = "${dto.brand}" placeholder = "브랜드 입력" required>
                     	</td> <!-- db에서 읽어오기 -->
                    </tr>
                    <tr> 	
                     	<th style = "width:150px; text-align:center;">상품무게*</th>
                     	<td style = "text-align:left;">
                     		<div>
                     			<select id = "weight" name = "weight" required>
                     				<option>weight</option>
                     				<option <c:if test="${dto.weight== '500g'}">selected</c:if> value="500g">500g</option>
                                    <option <c:if test="${dto.weight == '1kg'}">selected</c:if> value="1kg">1kg</option>
                     			</select>
                     		</div>
                     	</td>
                     	
                     </tr>
                     
                    <tr> 	
                     	<th style = "width:170px; text-align:center;">상품카테고리*</th>
                     	<td style = "text-align:left;">
                     		<div>
                     			<select id = "category" name = "category" required>
                     				<option>category</option>
                     				<option <c:if test="${dto.category == 'SINGLE_ORIGIN'}">selected</c:if> value="SINGLE_ORIGIN">SINGLE ORIGIN</option>
                                    <option <c:if test="${dto.category == 'BLENDING'}">selected</c:if> value="BLENDING">BLENDING</option>
                                    <option <c:if test="${dto.category == 'SPACIAL'}">selected</c:if> value="SPACIAL">SPACIAL</option>
                     			</select>
                     		</div>
                     	</td>
                     	
                     </tr>
                     
                     <tr>
                      <th style = "text-align:center;">상품이미지 *</th>
						<td style = "text-align:left;"><img src = "${dto.pdImg}" width = "80px">
						<input type="file" class="stInput" id = "pdImg" name="pdImg" accept = "image/*">
						</td>  
                     </tr>
                     
                     <tr>	
                     	<th>제품설명</th>
                     	<td colspan = "3" style = "text-align:left;">
                     		<textarea rows="5" cols="30" name = "content" id = "content">${dto.content}</textarea>
                     	</td>
                     </tr>
                     
                     <tr>
                        <th style = "width:100px;"> 판매가격 * </th>
                     	<td style = "text-align:left;">
                     		<input type = "number" class = "stInput" id = "price" name = "price" size = "10" value = "${dto.price}" placeholder = "가격 입력" required>
                     	</td> <!-- db에서 읽어오기 -->
                     </tr>
                     <tr>	
                     	<th style = "width:150px;"> 등록수량 *</th>
						<td style = "text-align:left;">
							<input type = "number" class = "stInput" style = "width:200px;" name = "quantity" id = "quantity" size = "15" value = "${dto.quantity}" placeholder = "수량입력">
						</td>                     	
                     </tr>
                     
                     <tr>
                     	<th>판매상태*</th>
                     	<td colspan = "3" style = "text-align:left;">
                     		<div>
                     			<select class = "stInput" id = "status" name = "status" required>
                     				<option>판매상태구분</option>
                     				<option <c:if test = "${dto.status == '판매중'}">selected</c:if> value = "판매중">판매중</option>
                     				<option <c:if test = "${dto.status == '품절'}">selected</c:if> value = "품절">품절</option>
                     			</select>
                     		</div>
                     	</td>
                     </tr>
                     
                     <tr>
                     	<th>등록일*</th>
                     	<td colspan = "3" style = "text-align:left;">
                     		${dto.indate}
                     	</td>
                     </tr>
                     
                     
                     <tr>
                     	<th colspan = "4">
                     	<input type = "submit" class = "inputButton" value = "수정" id = "btnUpdate"> <!-- input type = "button" 이어야 click 자바스크립트 정상작동  / jquery는 id로 움직임 name은 getparameter -->
                     	<input type = "button" class = "inputButton" value = "목록" id = "btnList">
                     	</th>
                     </tr>
                     
                  </table>
                 </form>
               </div>
            <!-- 우측 내용 종료 -->
  
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