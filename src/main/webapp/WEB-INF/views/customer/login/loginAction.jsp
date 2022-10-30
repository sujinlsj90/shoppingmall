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
	<c:if test = "${sessionScope.customerId == 'admin'}">
		<script type = "text/javascript">
			alert("관리자로그인");
			window.location = "${path}/productlist.st";
		</script>
	</c:if>

	
	<!-- header 시작 -->
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
	<!-- 회원탈퇴 컨텐츠 시작 -->
         <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>LOGIN</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
 		<!-- 로그인 컨텐츠 시작 -->
	
	<!-- 컨텐츠 시작 -->
	<div id="container">
	<div id="contents">
		<!-- 상단 중앙2 시작 -->
		<div id="section2">
			<div id="s2_inner">
				<div class="join">
				<form name = "loginform" action = "${path}/loginAction.do" method="post" onsubmit="return signInCheck();">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
						<!-- 세션이 없는 경우: 첫 진입, 로그인실패 -->
					<c:if test="${sessionScope.customerId == null}">
						<div class="form-floating mb-3">
							<h3>
							<c:choose>
								<c:when test="${selectCnt == -1}">
								비밀번호가 다릅니다. 다시확인하세요
								</c:when>
								<c:when test="${selectCnt == 0}">
								존재하지 않는 아이디입니다
								</c:when>
							</c:choose>
							</h3>
						</div>
											
					
						<div class="form-floating mb-3">
						  <input type="text" class="form-control" id="floatingInput" name="id" placeholder="공백없이 20자 이내">
						  <label for="floatingInput">ID</label>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="floatingPassword"  name="password" placeholder="Password 20자 이내">
						  <label for="floatingPassword">Password</label>
						</div>
						<br>
						<div class="form-floating">
							<input type="submit" class="button_login" value="로그인">
							<input type="reset" class="button_login" value="초기화">
							<input type="button" class="button_login" value="회원가입" onclick="window.location='${path}/join.do'">
						</div>
					
							
					</c:if>
					</form>		
					
					<form>	
					<c:if test="${sessionScope.customerID != null}">
						<div class="form-floating mb-3">
							<span style = "color:pink"><b>${sessionScope.customerID}</b></span>님 안녕하세요!
						</div>
							
						<br>
						<div class="form-floating">
							<input type="button" class = "button_login" value="회원수정" onclick = "window.location='${path}/modifyCustomer.do'">
							<input type="button" class = "button_login" value="회원탈퇴" onclick = "window.location='${path}/deleteCustomer.do'" >
							<input type="button" class = "button_login" value="로그아웃" onclick="window.location='${path}/logout.do'">
						</div>
					</c:if>
					</form>	
						
						
						
						
					</div>
				</div> <!-- s2_inner -->
			</div> <!-- section2 -->
		</div> <!-- contents -->
	</div> <!-- container -->
	<!-- 로그인 컨텐츠 종료 -->
	
	<!-- footer 시작 -->
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
		
    

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