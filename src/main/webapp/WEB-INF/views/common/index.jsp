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

    <!--header area start-->
    <%@ include file = "header.jsp" %>
    <!--header area end-->
   
   <!-- UserLoginSuccessHandler 에서 msg 넘김 -->
   <c:if test="${msg != null}">
      <script type="text/javascript">
         alert("${msg}");
      </script>
   </c:if>

	<!-- Main Wrapper Start -->
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
                            <a class="button" href="${path}/shop.sh">shopping now</a>
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
                            <a class="button" href="${path}/shop.sh">shopping now</a>
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
                            <a class="button" href="${path}/shop.sh">shopping now</a>
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
                            <a href="${path}/shop.sh"><img src="${path}/resources/images/index/main3.png" alt=""></a>
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
                            <a href="${path}/shop.sh"><img src="${path}/resources/images/index/main4.png" alt=""></a>
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
                            <a href="${path}/shop.sh"><img src="${path}/resources/images/index/main5.png" alt=""></a>
                            <div class="banner_content">
                                <p>Beans Special Blending</p>
                                <h2>Floral, MorningSpecial etc.</h2>
                            </div>
                        </div>
                   </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!--banner area end-->
    
    
    
    <!--footer area start-->
    <%@ include file = "footer.jsp" %>
    <!--footer area end-->


<!-- JS
============================================ -->

<!-- Plugins JS -->
<!--jquery min js-->

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