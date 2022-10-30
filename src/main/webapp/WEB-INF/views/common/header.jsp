<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                            <c:if test = "${sessionScope.customerId == null}">
                               <li class="top_links"><a href="#">Join & Login<i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/join.do">Join</a></li>
                                        <li><a href="${path}/login.do">Login</a></li>
                             </c:if>
                             <c:if test = "${sessionScope.customerId != null}">
                               <li class="top_links"><a href="#">${sessionScope.customerId}</span>님 환영합니다.<i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/modifyDetailAction.do">회원정보수정</a></li>
                                        <li><a href="${path}/deleteCustomerAction.do">탈퇴</a></li>
                                        <li><a href="${path}/logout.do">logout</a></li>
                              </c:if>
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
                                       <li><a href="${path}/index.do">Home</a></li>
                                       <li><a href="${path}/about.jsp">About BEANSMALL</a></li>
                                     </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shopping</a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children">
                                            <ul class="sub-menu">
                                                <li><a href="${path}/shop.sh?category=SINGLE_ORIGIN?${_csrf.parameterName}=${_csrf.token}">싱글오리진</a></li>
                                                <li><a href="${path}/shop.sh?category=SPACIAL?${_csrf.parameterName}=${_csrf.token}">스페셜티</a></li>
                                                <li><a href="${path}/shop.sh?category=BLENDING?${_csrf.parameterName}=${_csrf.token}">BEANS블랜딩</a></li>
                                            </ul>
                                        </li>
                                    <%--     
                                        <li class="menu-item-has-children">
                                            <a href="#">무게별</a>
                                            <ul class="sub-menu">
                                                  <li><a href="${path}/shop_weight.sh?weight=500g">500g</a></li>
                                                  <li><a href="${path}/shop_weight.sh?weight=1kg">1kg</a></li>
                                            </ul>
                                        </li>
                                         --%>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">My account</a>
                                    <ul class="sub-menu">
                                    <c:if test = "${sessionScope.customerId == null}">
                                        <li><a href="${path}/join.do">Join</a></li>
                                        <li><a href="${path}/login.do">Login</a></li>
                                    </c:if>
                                    <c:if test = "${sessionScope.customerId != null}">
                                        <li><a href="${path}/modifyDetailAction.do">회원정보수정</a></li>
                                        <li><a href="${path}/deleteCustomerAction.do">탈퇴</a></li>
                                        <li><a href="${path}/logout.do">logout</a></li>
                                    </c:if>
                                        <li><a href="${path}/cart.sh">장바구니</a></li>
                                        <li><a href="${path}/checkout.sh">구매하기 </a></li>
                                        <li><a href="${path}/orderList.my">구매목록</a></li>
                                    </ul>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Community </a>
                                    <ul class="sub-menu">
                                        <li><a href="${path}/customer/board/qna.jsp">Frequently Questions</a></li>
                                        <li><a href="${path}/boardList.bo">reviews</a></li>
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
                               <c:if test = "${sessionScope.customerId == null}">
                               <li class="top_links"><a href="#">Join & Login<i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/join.do">Join</a></li>
                                        <li><a href="${path}/login.do">Login</a></li>
                               </c:if>
                            	<c:if test = "${sessionScope.customerId != null}">
                               <li class="top_links"><a href="#">${sessionScope.customerId}</span>님 환영합니다.<i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/modifyDetailAction.do">회원정보수정</a></li>
                                        <li><a href="${path}/deleteCustomerAction.do">탈퇴</a></li>
                                        <li><a href="${path}/logout.do">logout</a></li>
                              	</c:if>
                                    </ul>
                                </li>
                                 
                                <c:if test = "${sessionScope.customerId == 'admin'}">
                                <li class="top_links"><a href="${path}/productList.st"> admin <i class="ion-chevron-down"></i></a>
                                    <ul class="dropdown_links">
                                        <li><a href="${path}/productList.st">adminMenu</a></li>
                                    </ul>
                                </li> 
                                </c:if>
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
                            <a href="${path}/index.do"><img src="${path}/resources/images/header/icon1.png"></a>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-7 col-6">
                        <div class="middel_right">
<%--                             <div class="search_btn">
                                <a href="#"><i class="ion-ios-search-strong"></i></a>
                                <div class="dropdown_search">
                                    <form action="#">
                                        <input placeholder="Search product..." type="text">
                                        <button type="submit"><i class="ion-ios-search-strong"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="cart_link">
                                <a href="${path}/cart.sh"><i class="ion-android-cart"></i><span class="cart_text_quantity">0원</span> <i class="fa fa-angle-down"></i></a>
                                <span class="cart_quantity">0</span>
                            </div> --%>
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
                               <a href="${path}/index.do"><img src="${path}/resources/images/header/icon1.png" alt=""></a>
                           </div>
                            <div class="main_menu"> 
                                <nav>  
                                    <ul>
                                        
                                        <li class="active"><a href="${path}/index.do">Home <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu">
                                                <li><a href="${path}/index.do">Home</a></li>
                                                <li><a href="${path}/index.do">About BEANSMALL</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="${path}/shop.sh?category=SINGLE_ORIGIN">shop <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
		                                        <li><a href="${path}/shop.sh?category=SINGLE_ORIGIN">싱글오리진</a></li>
                                                <li><a href="${path}/shop.sh?category=SPACIAL">스페셜티</a></li>
                                                <li><a href="${path}/shop.sh?category=BLENDING">BEANS블랜딩</a></li>
                                               <%--  <li><a href="${path}/shop_weight.sh?weight=500g">무게별</a>
                                                    <ul>
                                                       <li><a href="${path}/shop_weight.sh?weight=500g">500g</a></li>
	                                                  <li><a href="${path}/shop_weight.sh?weight=1kg">1kg</a></li>
                                                    </ul>
                                                </li> --%>
                                            </ul>
                                        </li>
                                        <li><a href="#">My Account<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
		                                        <c:if test = "${sessionScope.customerId == null}">
			                                        <li><a href="${path}/join.do">Join</a></li>
			                                        <li><a href="${path}/login.do">Login</a></li>
			                                    </c:if>
			                                    <c:if test = "${sessionScope.customerId != null}">
			                                        <li><a href="${path}/modifyDetailAction.do">회원정보수정</a></li>
			                                        <li><a href="${path}/deleteCustomerAction.do">탈퇴</a></li>
			                                        <li><a href="${path}/logout.do">logout</a></li>
			                                    </c:if>
		                                        <li><a href="${path}/cart.sh">장바구니</a></li>
		                                        <li><a href="${path}/checkout.sh">구매하기 </a></li>
		                                        <li><a href="${path}/orderList.my">구매목록</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Community<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                        <li><a href="${path}/customer/board/qna.jsp">Frequently Questions</a></li>
                                        <li><a href="${path}/boardList.bo">reviews</a></li>
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
</body>
</html>