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
	<script type="text/javascript">
	   $(function(){
			$('#searchbtn').click(function(){ 
				var keyword = $('#keyword').val();
					$.ajax({
						url:'${path}/search.bo?${_csrf.parameterName}=${_csrf.token}',
						type:'post',
						data:'keyword=' + keyword,
						success: function(result){
							$('#container_board').html(result);
						},
						error: function(){
							alert("오류");
						}
					});
			});
		});

	</script>

</head>

<body>

   <!--header area start-->
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <!--header area end-->
   <!-- UserLoginSuccessHandler 에서 msg 넘김 -->
   <c:if test="${msg != null}">
      <script type="text/javascript">
         alert("${msg}");
      </script>
   </c:if>
	
		<body>
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
	    <!--boardlist area-->
	    <div class="boardlist_area" style = "max-width:900px; margin:auto;">
	   		 <div id="container_board">  
                 <form method = "post">
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="row align-items-center">
                    	<div class="col-12">
                       	 <div class="board_desc">
                       	 	<div class="board_page table-responsive" style = "font-family:'맑은 고딕';"> <!-- //join_page->board_page바꾸기 -->
                       	 	
                       	 	<input type = "button" class="btn btn-secondary btn-sm" style = "float:right;" onclick = "location.href = '${path}/board_insert.bo'" value = "write">
							 <table id = "community" class="table table-striped table-hover" style = "text-align:center;">
							  <thead>
							  <tr>
							    <th><label>No.</label></th>
							    <th width = 45%><label>제목</label></th>
							    <th><label>글쓴이</label></th>
							    <th><label>작성일</label></th>
							    <th><label>조회</label></th>
							  </tr>
							  </thead>
							  <tbody>
		                     <!-- 게시글이 있으면 -->
		                     
		                     <c:forEach var = "dto" items="${list}"> <%-- <c:forEach var = "개별항목" items="${집합}"> --%>
		                     <tr>
		                        <td>${dto.num}</td>
		                        <td>
		                        	<a href = "${path}/board_detailAction.bo?num=${dto.num}">${dto.title}</a>
		                        	<c:if test = "${dto.comment_count > 0}">
                        			 [${dto.comment_count}]
                         			</c:if>
		                        </td>
		                        <td>${dto.writer}</td>
		                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regDate}"/></td>
		                        <td>${dto.readCnt}</td>
		                     </tr>
		                    </c:forEach>
		                    
							  </tbody>
							  </table>
							  </div>
							</div>
					 	 </div>  
					 	 <!-- 페이징 처리 -->
						  <div class ="board_page">
							  <div class="align-items-center">
							    	<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style = "margin:auto; float:center;">
									  <!-- 이전버튼활성화여부 -->
									  <c:if test = "${paging.startPage > 10}">
									    <a href = "${path}/boardList.bo?pageNum=${paging.prev}">
									    	<button type="button" class="btn btn-outline-secondary">
									    	<<
									    	</button>
									    </a>
									   </c:if> 
									   <!-- 페이지 번호 처리 -->
		                     			<c:forEach var = "num" begin = "${paging.startPage}" end = "${paging.endPage}" >
			                     			<a href = "${path}/boardList.bo?pageNum=${num}">
											    <button type="button" class="btn btn-outline-secondary">
											    ${num}
											    </button>
											</a>
										</c:forEach>
										<!-- 다음버튼활성화여부 -->
		                     			<c:if test = "${paging.endPage < paging.pageCount}">
		                     				<a href = "${path}/boardList.bo?pageNum=${paging.next}">
										   		 <button type="button" class="btn btn-outline-secondary">
										   		 >>
										   		 </button>
									   		 </a>
									    </c:if>
									  </div>
									</div>
								 </div>
						 		</div>
						 		</form>
						 	</div>
						
					<div class="btn-group me-2" role="group" aria-label="First group" style = "margin:auto;">
					  <div class="input-group">
					    <div class="input-group-text" id="btnGroupAddon" style = "font-size:12px;">제목검색</div>
					    <input type="text" id = "keyword" name = "keyword" class="form-control" placeholder="제목으로 검색" aria-label="search" aria-describedby="btnGroupAddon" style = "width:200px;">
					    <button type="button" id = "searchbtn" class="btn btn-outline-secondary" style = "width:100px;">검색</button>
					  </div>
					</div>
				</div>

  <!-- 컨텐츠 끝 -->
  
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
<script src="${path}/resources/js/request.js"></script>

<!-- Main JS -->
<script src="${path}/resources/bootsAssets/js/main.js"></script>

<!-- common JS -->
<script src="${path}/resources/js/common.js"></script>
</body>
</html>