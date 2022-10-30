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

</head>
<script type="text/javascript">
$(function(){
	$('#cartQuantity').change(function(){
		   var param = {
			         "pdNo" : '${dto.pdNo}', 
			         "cartQuantity" : $('#cartQuantity').val(),
			   }
			   $.ajax({
			      url: "${path}/shop_total.sh?${_csrf.parameterName}=${_csrf.token}",
			      type: "post",
			      data: param,
			      success: function(result) { 
			    	  $('#total_display').html(result);
			      },
			      error: function() {
			         alert('오류');
			      }
			   });
	});
});


$(function(){
	//장바구니 이동
	$("#add_cart").click(function(){
		var option = $("#option").val();
		if(option == ""){
			alert("옵션을 선택하세요");
			return false;
		}
		if(option != "") {
			alert("장바구니로 이동합니다");
		document.insertForm.action = "${path}/cartInsertAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.insertForm.submit();
		}
		
	});
	$("#buy_now").click(function(){
		var option = $("#option").val();
		if(option == ""){
			alert("옵션을 선택하세요");
			return false;
		}
		
		if(option != "") {
			alert("구매페이지로 이동합니다");
		document.insertForm.action = "${path}/chkOutInsertAction.sh?${_csrf.parameterName}=${_csrf.token}";
		document.insertForm.submit();
		}
	});

});


	
</script>
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
                         <h3>PRODUCT</h3>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
     <!--product details start-->
    <div class="product_details">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                   <div class="product-details-tab" align="center">
                        <div id="img-1">
                             <img src="${dto.pdImg}">
                        </div>

                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product_d_right">
                       <form name = "insertForm" method="post">
                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <h1>${dto.brand} <span>${dto.pdName}</span></h1>
                            <div>
                                <ul>
                                    <li> 국가: <span>${dto.brand}</span></li>
                                    <li> 상품명: ${dto.pdName}</li>
                                    <li> 용량: ${dto.weight}</li>
                                    <li> 분쇄정도 :
                                    	<select id="option" class="input_in" name="option" required onchange="state_chg();">
			                        		<option value="" selected>옵션선택</option>
			                        		<option value="홀빈" selected>홀빈</option>
			                        		<option value="아주굵게">아주굵게-프렌치프레스용</option>
			                        		<option value="굵게">굵게-드립/커피메이커용</option>
			                        		<option value="중간">중간-더치용</option>
			                        		<option value="곱게">곱게-모카포트용</option>
		                        		</select></li>
                                </ul>
                            </div>
                            <div class="product_price">
                                <span class="old_price">10000원</span>
                                <span class="current_price">${dto.price}원</span>
                            </div>
                            <div class="product_desc">
                                <p>로스팅포인트 : ${dto.content}</p>
                            </div>
                            <div id="total_display">
                           		총액 : ${dto.price}원  
                            </div>

                            <div class="product_variant quantity">
                                <label>quantity</label>
                                <input min="1" max="100" value="1" type="number" name = "cartQuantity" id = "cartQuantity">
                                <input type = "hidden" name = "pdNo" value = "${dto.pdNo}">  
                                <button class="button" type="button" id = add_cart>add to cart</button>  
                                <button class="button" type="button" id = buy_now>buy now</button>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>    
    </div>
    <!--product details end-->
    
    <!--product info start-->
    <div class="product_d_info">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="product_d_inner">   
                        <div class="product_info_button">    
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-bs-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">BEANS INFO</a>
                                </li>
                                <li>
                                   <a data-bs-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">REVIEW</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="info" role="tabpanel" >
                                <div class="product_info_content">
                                    <p><img src = "${path}/resources/images/product/details.jpg"></p> <!-- detailImg 컬럼 추가 -->
                                </div>    
                            </div>
							<!-- 리뷰(코멘트)목록 -->
                            <div class="tab-pane fade" id="reviews" role="tabpanel" >
                                <div class="reviews_wrapper">
                                    <h2>REVIEW</h2>
                                    <!-- 리뷰 보기-->
                                    <div class="reviews_comment_box">
                                        <div class="comment_thmb">
                                            <img src="bootsAssets/img/blog/comment2.jpg" alt="">
                                        </div>
                                        <div class="comment_text">
                                            <div class="reviews_meta">
                                                <p><strong>sujin </strong>- 2022.08.14.</p>
                                                <span>커피가 맛있어요</span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- 리뷰 보기 end-->
                                    <!-- 리뷰쓰기 start -->
                                    <div class="comment_title">
                                        <h2>write </h2>
                                    </div>
                                    <div class="product_ratting mb-10">
                                    </div>
                                    <div class="product_review_form">
                                        <form action="#">
                                            <div class="row">
                                            	<div class="col-lg-6 col-md-6">
                                                    <label for="author">ID</label>
                                                    <input id="author"  type="text">

                                                </div> 
                                                <div class="col-lg-6 col-md-6"></div>
                                                <div class="col-12">
                                                    <label for="review_comment">리뷰</label>
                                                    <textarea name="comment" id="review_comment" ></textarea>
                                                </div> 
                                            <button type="submit">Submit</button>
                                            </div>                                       
                                         </form>   
                                    </div> 
                                    <!--리뷰쓰기 end  -->
                                </div>    
                            </div>
                        </div>
                    </div>     
                </div>
            </div>
        </div>    
    </div>  
    <!--product info end-->
    

   
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