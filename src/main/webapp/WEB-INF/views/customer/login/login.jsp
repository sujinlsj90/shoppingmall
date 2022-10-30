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

	<!-- header 시작 -->
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
	<!-- UserLoginFailureHandler 에서 msg 넘김 -->
   <c:if test="${errorMsg != null}">
      <script type="text/javascript">
         alert("${errorMsg}");
      </script>
   </c:if>
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
			
			<!-- 상단 중앙2 시작 -->
			<div id = "section2">
				<div id = "s2_inner">
					<div class = "join">
						<form name = "loginform" action = "${path}/loginAction.do" method="post" onsubmit="login();" action="#">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-floating mb-3">
							  <input type="text" class="form-control" id="floatingInput" name="id" placeholder="공백없이 20자 이내">
							  <label for="floatingInput">ID</label>
							</div>
							<div class="form-floating">
							  <input type="password" class="form-control" id="floatingPassword"  name="password" placeholder="Password 20자 이내">
							  <label for="floatingPassword">Password</label>
							</div>
							<div class="form-floating">
							<br>
										<input type="submit" class="button_login" value="로그인">
										<input type="reset" class="button_login" value="초기화">
										<input type="button" class="button_login" value="회원가입" onclick="window.location='${path}/join.do'">
							</div>
						
						<%-- 
							<table>
							<colgroup>
								<col style = "width: 150px">
								<col style = "width: auto">
								<col style = "width: auto">
							</colgroup>
							<tr>
								<th>* 아이디</th>
								<td>
									<input type = "text" class="input" name="id" id = "id" size="20" placeholder = "공백없이20자이내" autofocus required></input>
								</td>
							</tr>
							
							<tr>
								<th>* 비밀번호</th>
								<td colspan="2">
									<input type= "password" class = "input" name="password" id = "password" size = "20" placeholder = "비밀번호 20자리이내"></input>
								</td>
							</tr>
									
							<tr>
								<td colspan = "3" style = "border-bottom: none;">
								<br>
								<div align="right">
										<input type="submit" class="button_login" value="로그인">
										<input type="reset" class="button_login" value="초기화">
										<input type="button" class="button_login" value="회원가입" onclick="window.location='${path}/join.do'">
								</div>
								</td>
							</tr>
							</table> --%>
							</form>
					</div><!-- join -->
				</div><!-- s2_inner -->
			</div><!-- section2 -->
		
	<!-- 컨텐츠 끝 -->
	
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