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
			
		<div class="container">
			<form name="passwordform">
				<div class="row align-items-center">		
						
							<c:if test = "${delectCnt == 0}">
								<script type = "text/javascript">
									alert("회원탈퇴실패");
								</script>
							</c:if>
						
						<c:if test = "${delectCnt != 0}">
						<%
								 request.getSession().invalidate(); //모든 세션 삭제
						%>
							<script type = "text/javascript">
								setTimeout(function() {
									alert("탈퇴처리 되었습니다");
									window.location="${path}/index.do";
								}, 1000);
							</script>
							
						    <div class="breadcrumbs_area">
						        <div class="container">   
						            <div class="row">
						                <div class="col-12">
						                    <div class="breadcrumb_content">
						                        <h2>회원탈퇴</h2>
						                    </div>
						                </div>
						            </div>
						        </div>         
						    </div>

							
						</c:if>
					</div>
				</form>
			</div>
	
	<!-- footer 시작 -->
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
		

</body>
</html>