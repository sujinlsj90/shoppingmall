<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>    
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
<body>

<!-- Main Wrapper Start -->
    <!--Offcanvas menu 시작-->
    <div class="off_canvars_overlay">
                
    </div>
    <div class="Offcanvas_menu">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="canvas_open">
                        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                    </div>
                    <div class="Offcanvas_menu_wrapper">
                        <div class="canvas_close">
                              <a href="javascript:void(0)"><i class="ion-android-close"></i></a>  
                        </div>
                                               
                        <div class="top_right text-right">
                            <ul>
                               <li class="top_links"><a href="#">Join & Login<i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/customer/join/join.html">Join</a></li>
                                        <li><a href="${path}/customer/login/login.html">Login</a></li>
                                    </ul>
                                </li> 
                            </ul>
                        </div> 
                        <div class="home_contact">
                            <div class="contact_box">
                                <label>Location</label>
                                <p>서울시 금천구 가산로 </p>
                            </div>
                            <div class="contact_box">
                                <label>Tel.</label>
                                <p>0123456789</a></p>

                            </div>
                        </div>
                        <div id="menu" class="text-left ">
                            <ul class="offcanvas_main_menu">
                                <li class="menu-item-has-children">
                                    <ul class="sub-menu">
                                       <a href="#">Home</a>
                                       <li><a href="index.html">Home</a></li>
                                       <li><a href="about.html">About BEANSMALL</a></li>
                                     </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shopping</a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children">
                                            <a href="#">원두별</a>
                                            <ul class="sub-menu">
                                                <li><a href="${path}/product/shop.html">싱글오리진</a></li>
                                                <li><a href="${path}/product/shop2.html">스페셜티</a></li>
                                                <li><a href="${path}/product/shop3.html">BEANS블랜딩</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="#">무게별</a>
                                            <ul class="sub-menu">
                                                  <li><a href="${path}/product/shop4.html">500g</a></li>
                                                  <li><a href="${path}/product/shop5.html">1kg</a></li>
                                                  <li><a href="${path}/product/shop6.html">10kg(업소용)</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">My account</a>
                                    <ul class="sub-menu">
                                        <li><a href="${path}/customer/join/join.html">회원가입</a></li>
                                        <li><a href="${path}/customer/login/login.html">LOGIN</a></li>
                                        <li><a href="${path}/customer/myaccount/order/cart.html">장바구니</a></li>
                                        <li><a href="${path}/customer/myaccount/order/checkout.html">구매하기 </a></li>
                                        <li><a href="${path}/customer/myaccount/order/my-account.html">구매목록</a></li>
                                    </ul>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Community </a>
                                    <ul class="sub-menu">
                                        <li><a href="${path}/customer/board/qna.html">Frequently Questions</a></li>
                                        <li><a href="${path}/customer/board/boardList.html">reviews</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="Offcanvas_footer">
                            <span><a href="#"><i class="fa fa-envelope-o"></i> sujin90@gmail.com</a></span>
                            <ul>
                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li class="pinterest"><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Offcanvas menu area 끝-->
    
     <!--header 시작-->
    <header class="header_area">
        <!--header top start-->
        <div class="header_top">
            <div class="container">   
                <div class="row align-items-center">

                    <div class="col-lg-7 col-md-12">
                        <div class="welcome_text">
                           <p>Free shipping on all domestic orders for <span>"members"</span> only</p>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="top_right text-right">
                            <ul>
                               <li class="top_links"><a href="#"> Join & Login <i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/customer/join/join.html">Join</a></li>
                                        <li><a href="${path}/customer/login/login.html">Login</a></li>
                                    </ul>
                                </li> 
                                <li class="top_links"><a href="#"> admin <i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/admin/adminlogin.html">login</a></li>
                                        <li><a href="${path}/admin/stock/product.html">adminMenu</a></li>
                                    </ul>
                                </li> 
                            </ul>
                        </div>   
                    </div>
                </div>
            </div>
        </div>
        <!--header top 시작-->

        <!--header middel 시작-->

        <div class="header_middel">
            <div class="container">
                <div class="row align-items-center">
                    
                    <div class="col-lg-5">
                        <div class="home_contact">
                            <div class="contact_box">
                                <label>Location</label>
                                <p>Gasan digital ro, Geumcheon-gu, Seoul, Republic of Korea</p>
                            </div>
                            <div class="contact_box">
                                <label>tel.</label>
                                <p><a href="tel:0123456789">0123456789</a></p>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-4"> <!-- 그리드 -->
                        <div class="logo">
                            <a href="index.html"><img src="${path}/resources/images/header/icon1.png"></a>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-7 col-6">
                        <div class="middel_right">
                            <div class="search_btn">
                                <a href="#"><i class="ion-ios-search-strong"></i></a>
                                <div class="dropdown_search">
                                    <form action="#">
                                        <input placeholder="Search product..." type="text">
                                        <button type="submit"><i class="ion-ios-search-strong"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="cart_link">
                                <a href="${path}/customer/myaccount/order/cart.html"><i class="ion-android-cart"></i><span class="cart_text_quantity">0원</span> <i class="fa fa-angle-down"></i></a>
                                <span class="cart_quantity">0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--header middel 끝-->

        <!--header bottom 시작-->
        <div class="header_bottom sticky-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="main_menu_inner">
                           <div class="logo_sticky">
                               <a href="index.html"><img src="${path}/resources/images/header/icon1.png" alt=""></a>
                           </div>
                            <div class="main_menu"> 
                                <nav>  
                                    <ul>
                                        
                                        <li class="active"><a href="index.html">Home <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu">
                                                <li><a href="index.html">Home</a></li>
                                                <li><a href="about.html">About BEANSMALL</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="${path}/product/shop.html">shop <i class="fa fa-angle-down"></i></a>
                                            <ul class="mega_menu">
                                                <li><a href="${path}/product/shop.html">원두별</a>
		                                            <ul class="sub-menu">
		                                                <li><a href="${path}/product/shop.html">싱글오리진</a></li>
		                                                <li><a href="${path}/product/shop2.html">스페셜티</a></li>
		                                                <li><a href="${path}/product/shop3.html">BEANS블랜딩</a></li>
		                                            </ul>
		                                        </li>
                                                <li><a href="${path}/product/shop4.html">무게별</a>
                                                    <ul>
                                                        <li><a href="${path}/product/shop4.html">500g</a></li>
                                                        <li><a href="${path}/product/shop5.html">1kg</a></li>
                                                        <li><a href="${path}/product/shop6.html">10kg(업소용)</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="#">My Account<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
		                                        <li><a href="${path}/customer/join/join.html">회원가입</a></li>
		                                        <li><a href="${path}/customer/login/login.html">LOGIN</a></li>
		                                        <li><a href="${path}/customer/myaccount/order/cart.html">장바구니</a></li>
		                                        <li><a href="${path}/customer/myaccount/order/checkout.html">구매하기 </a></li>
		                                        <li><a href="${path}/customer/myaccount/order/my-account.html">구매목록</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Community<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                        <li><a href="${path}/customer/board/qna.html">Frequently Questions</a></li>
                                        <li><a href="${path}/customer/board/boardList.html">reviews</a></li>
                                            </ul>
                                        </li>
                                    </ul>  
                                </nav> 
                            </div>
                        </div> 
                    </div>
                   
                </div>
            </div>
        </div>
        <!--header bottom 끝-->
    </header>
    <!--header area 끝-->


    <!--slider area 시작-->
    <div class="slider_area owl-carousel">
         <div class="single_slider" data-bgimg="${path}/resources/images/index/main1.png">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="slider_content">
                            <p></p>
                            <h2>Premium KENYA AA</h2>
                            <p class="slider_price">Shipping<span>Free</span></p>
                            <a class="button" href="${path}/product/shop.html">shopping now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single_slider" data-bgimg="${path}/resources/images/index/main2.png">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="slider_content">
                            <p></p>
                            <h2>신규가입 특별 이벤트 3000 point + </h2>
                            <p class="slider_price">Shipping<span>Free</span></p>
                            <a class="button" href="${path}/product/shop.html">shopping now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single_slider" data-bgimg="${path}/resources/images/index/main3.png">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="slider_content">
                            <p>모든 사람을 위한 커피</p>
                            <h2>DeCaffeine 스페셜 블랜딩</h2>
                            <p class="slider_price">Shipping<span>Free</span></p>
                            <a class="button" href="${path}/product/shop2.html">shopping now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--slider area 끝-->
    
    
    <!--banner area 시작-->
    <section class="banner_section">
        <div class="container">
            <div class="row ">
                <div class="col-lg-4 col-md-6">
                   <div class="single_banner">
                       <div class="banner_thumb">
                            <a href="${path}/product/shop.html"><img src="${path}/resources/images/index/main3.png" alt=""></a>
                            <div class="banner_content">
                                <p>싱글오리진</p>
                                <h2>kenyaAA, columbiaSuprimo, Tanzyania AAA etc.</h2>
                            </div>
                        </div>
                   </div>
                    
                </div>
                <div class="col-lg-4 col-md-6">
                   <div class="single_banner">
                       <div class="banner_thumb">
                            <a href="${path}/product/shop2.html"><img src="${path}/resources/images/index/main4.png" alt=""></a>
                            <div class="banner_content">
                                <p>For Everyone</p>
                                <h2>SpecialTea by .....</h2>
                            </div>
                        </div>
                   </div>
                    
                </div>
                <div class="col-lg-4 col-md-6">
                   <div class="single_banner bottom">
                       <div class="banner_thumb">
                            <a href="${path}/product/shop3.html"><img src="${path}/resources/images/index/main5.png" alt=""></a>
                            <div class="banner_content">
                                <p>Beans Special Blending</p>
                                <h2>Floral, MorningSpecial etc.</h2>
                            </div>
                        </div>
                   </div>
                    
                </div>
            </div>
            </div>
        </div>
    </section>
    <!--banner area end-->
    
    
<hr> 
<br><br>  
<h3 style = "text-align:center;">최상급 원두만 취급합니다 </h3>
<br><br>
    
  
    
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




</body>

</html>