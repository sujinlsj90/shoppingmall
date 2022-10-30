<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>  
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
	
	<script>
	$(function() {  // 페이지가 로딩되면
		   // 자동으로 댓글목록 호출
		   comment_list();
		   
		   // 댓글쓰기 버튼 클릭
		    $("#btnSave").click(function() {
		       comment_add();
		   });   
		   
		      //목록버튼 클릭시 목록으로 이동
		   $("#btnList").click(function() {
		      location.href="${path}/boardList.bo?${_csrf.parameterName}=${_csrf.token}"
		   });
		      
		      //수정삭제화면으로 이동
		   $("#btnEdit").click(function() {
		      // alert("상세페이지-btnEdit")
		      document.detailForm.action ="${path}/password_chk.bo?${_csrf.parameterName}=${_csrf.token}";
		      document.detailForm.submit();
		   });
		});
	
	//댓글리스트
	function comment_list(){
		$.ajax({
			url: "${path}/commentList.bo?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			data: "board_num=${dto.num}",
			success : function(result) {
				$("#commentList").html(result);
			},
			error: function(){
				alert("comment_list 오류");
			}
		});
	}
	
	//댓글작성
	function comment_add(){
		var param = {
				"board_num" : '${dto.num}',
				"writer" : $('#writer').val(),
				"content" : $('#content').val()
		}
		$.ajax({
			url: "${path}/commentAdd.bo?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			data: param,
			success: function() {
				$('#writer').val("");
				$('#content').val("");
				comment_list(); // 댓글목록 새로고침 
			},
			error: function(){
				alert("comment_add 오류");
			}
		});
	}
	
	</script>

</head>

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
	                        <h2>COMMUNITY</h2>
	                    </div>
	                </div>
	            </div>
	        </div>         
	    </div>
	    <!--breadcrumbs area end-->
	    <!--boardread area-->
	    <div class="boardlist_area" style = "max-width:900px; margin:auto;">
	   		 <div class="container-md">  
	   		 	 <form class = "board_write" name = "detailForm" method = "post">
	   		 	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
					<div class="row align-items-center">
                    	<div class="col-12">
                       	 <div class="board_desc">
                       	 	<div class="board_page" style = "font-family:'맑은 고딕';">
                       	 		<div class="row">
	                       	 		<div class="col-md-3">
									  <label id="user_id"> USER ID : ${dto.writer}</label></div>
									<div class="col-md-3">  
									  <label id="board_date"> DATE : <fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regDate}"/> </label></div>
									<div class="col-md-3">  
									  <label id="board_click"> 조회수 : ${dto.readCnt} </label></div>
									<div class="col-md-3">  
									  <label id="board_password"> 
									  <input type = "password" class = "input" style = "width:200px;" name = "password" id = "password"
										value = "" placeholder = "비밀번호입력" required>
										<c:if test = "${param.message == 'error'}">
											<br><span style = "color:red">비밀번호불일치</span>
										</c:if>  </label></div>
								</div> 
								<div class="mb-3 border" name>
								  <label for="board_title" class="form-label">TITLE</label>
								  ${dto.title}
								</div>
								<div class="mb-3 border" style = "min-height:350px;">
								  ${dto.content}
								</div>
							  </div>
							</div>
					 	 </div>  
							 <div class= "board_read">
							 	<input type = "hidden" name = "num" value = "${dto.num}">  <!-- 실제 화면은 없지만 데이터는 넘겨줘야 할 때 hidden사용함 -->
	                       	 	<input type = "button" class="btn btn-outline-secondary btn-sm" style = "float:right;" value = "edit" id = "btnEdit">
	                       	 	<input type = "button" class="btn btn-outline-secondary btn-sm" style = "float:right;" value = "list" id = "btnList">
                       	 	</div><br><br>
					 		</div>
					 		</form>
					 		
					 		<!-- 리뷰 보기-->
					 		<div class="comment_title">
					 			<h4>COMMENT</h4>
                            </div>
					 			<div id = "commentList">
                                </div>
                                    <!-- 댓글 보기 end-->
                                    <!-- 댓글쓰기 start -->
                                    
                                    <div class="product_ratting mb-10">
                                    </div>
                                    <div class="product_review_form">
                                            <div class="row">
                                            	<div class="col-lg-6 col-md-6">
                                                    <label for="author">작성자</label>
                                                    <input id="writer" type="text"  placeholder = "작성자">

                                                </div> 
                                                <div class="col-lg-6 col-md-6"></div>
                                                <div class="col-12">
                                                    <label for="review_comment">comment</label>
                                                    <textarea name="comment" id="content" placeholder = "내용을 입력하세요"></textarea>
                                                </div> 
                                            <button id = "btnSave">Submit</button>
                                            </div>                                         
                                    </div> 
                                    <!--댓글쓰기 end  -->
					 		
					 	</div>
					</div>
 		 <!--boardread end	-->
  
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

<!-- common JS -->
<script src="${path}/resources/js/common.js"></script>
