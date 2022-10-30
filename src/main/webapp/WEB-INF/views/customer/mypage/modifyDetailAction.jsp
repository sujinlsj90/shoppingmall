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
	
	<!-- 회원수정 컨텐츠 시작 -->
         <!--breadcrumbs area start-->
	    <div class="breadcrumbs_area">
	        <div class="container">   
	            <div class="row">
	                <div class="col-12">
	                    <div class="breadcrumb_content">
	                        <h2>회원정보 수정</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
			<!-- 상단 중앙2 시작 -->
		<div class="joinform_area">
			<div class="container">  
				<form name="modifyform" action="${path}/modifyCustomerAction.do" method="post" onsubmit = "return modifyCheck();">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<!-- 2-1. -->
						<div class="row">
		               		<div class="col-12">
		                   	 	<div class="table_desc">
									<input type = "hidden" name = "hiddenId" value = "0">
										<table style="margin-left: auto; margin-right: auto; width:auto;" class = "box table table-hover product">
										<colgroup>
											<col style="width: auto">
											<col style="width: auto">
											<col style="width: auto">
										</colgroup>
										<tr>
											<th> * 아이디 </th>
											<td>
												${dto.getId()}
											</td>
										</tr>
										
										<tr>
											<th> * 비밀번호 </th>
											<td colspan="2">
												<input type="password" class="input" name="password" size="15" required  placeholder="공백없이 15자 이내로 작성">
											<td/>
										</tr>
										<tr>
											<th> * 비밀번호확인 </th>
											<td colspan="2">
												<input type="password" class="input" name="repassword" size="15" required placeholder="비밀번호 확인">
											<td/>
										</tr>
										
										<tr>
											<th> * 이름 </th>
											<td colspan="2">
												<input type="text" class="input" name="name" size="20" value="${dto.getName()}">
											</td>
										</tr>
										
										<tr>
											<th> * 생년월일 </th>
											<td colspan="2">
												<input type="date" class="input" name="birthday" size="8" placeholder="YYYYMMDD" value="${dto.getBirthday()}">
											</td> 
										</tr>
										
										<tr>
											<th> * 주소 </th>
											<td colspan="2">
												<input type="text" class="input" name="address" size="60" value="${dto.getAddress()}">									
											</td>
										</tr>
										
										<tr>
											<th> 핸드폰 </th>
											<td>
												<c:if test="${dto.getHp() == null}">
												<input type="text" class="input" name="hp1" size="60" maxlength="3" style="width:50px" placeholder="010">
												-
												<input type="text" class="input" name="hp2" size="60" maxlength="4" style="width:50px" placeholder="0000">
												-
												<input type="text" class="input" name="hp3" size="60" maxlength="4" style="width:50px" placeholder="0000">
												</c:if>
												
												<c:if test="${dto.getHp() != null}">
													<!-- String[] hpArr = dto.getHp().split("-"); -->
													<c:set var="hpArr" value="${fn:split(dto.getHp(), '-') }"/>
		
													<input type="text" class="input" name="hp1" size="60" maxlength="3" style="width:50px" placeholder="010" value="${hpArr[0]}">
													-
													<input type="text" class="input" name="hp2" size="60" maxlength="4" style="width:50px" placeholder="0000" value="${hpArr[1]}">
													-
													<input type="text" class="input" name="hp3" size="60" maxlength="4" style="width:50px" placeholder="0000" value="${hpArr[2]}">
												</c:if>

											</td>	
										</tr>
										
										<tr> 
											<th> * 이메일 </th>
											<td>
												<c:set var="emailArr" value="${fn:split(dto.getEmail(), '@')}"/>
											
												<input type="text" class="input" name="email1" maxlength="20" style="width:100px" value="${emailArr[0]}">
												@
												<input type="text" class="input" name="email2" maxlength="20" style="width:100px" value="${emailArr[1]}">
												<select class="input" name="email3" style="width:100px" onchange="selectEmailChk();">
													<option value="0">직접입력</option>
													<option value="naver.com">네이버</option>
													<option value="gmail.com">구글</option>
													<option value="daum.net">다음</option>
													<option value="nate.com">네이트</option>
												</select>
											</td>
										</tr>
										
										<tr>
											<td colspan="3" style="border-bottom: none;">
												<br>
												<div align="right">
													<input type="submit" class="button_login" value="정보수정">
													<input type="button" class="button_login" value="취소" onclick="window.location='${path}index.do'">
												</div>
											</td>
										</tr>
										</table>
								
									</div>
								</div>
							</div>
						</form>
					</div>
				</div> <!-- s2_inner -->
	<!-- 회원가입 컨텐츠 종료 -->
	
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