<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>     
<!doctype html>
<html class="no-js" lang="en">
</head>
<body>
	<div class="row align-items-center">
		   	<div class="col-12">
		   	 <div class="board_desc">
		   	 	<div class="board_page table-responsive" style = "font-family:'맑은 고딕';"> <!-- //join_page->board_page바꾸기 -->
		   	 	<form method = "post">
		   	 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
		            <c:forEach var = "dto" items="${list2}"> <%-- <c:forEach var = "개별항목" items="${집합}"> --%>
		            <tr>
		               <td>${dto.num}</td>
		               <td>
		               	<a href = "${path}/board_detailAction.bo?num=${dto.num}">${dto.title}</a>
		               	<c:if test = "${dto.comment_count > 0}">
	             			 [${dto.comment_count}]
           				</c:if>
		               </td>
		               <td>${dto.writer}</td>
		               <td>${dto.regDate}</td>
		               <td>${dto.readCnt}</td>
		            </tr>
		           </c:forEach>
					               
				  </tbody>
			  	</table>
			  	</form>
		      </div>
		  </div>
		</div>  
		 <!-- 페이징 처리 -->
		<div class ="board_page">
		 <div class="row">
		   	<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style = "margin:auto;">
				<!-- 이전버튼활성화여부 -->
				<c:if test = "${paging.startPage > 10}">
				  <a href = "${path}/boardList.bo?pageNum=${paging.prev}">
				  	<button type="button" class="btn btn-outline-secondary" style = "float:center;">
				  	<<
				  	</button>
				  </a>
				 </c:if> 
				 <!-- 페이지 번호 처리 -->
       			<c:forEach var = "num" begin = "${paging.startPage}" end = "${paging.endPage}" >
        			<a href = "${path}/boardList.bo?pageNum=${num}">
			    <button type="button" class="btn btn-outline-secondary"style = "float:center;">
			    ${num}
			    </button>
					</a>
				</c:forEach>
				<!-- 다음버튼활성화여부 -->
       			<c:if test = "${paging.endPage < paging.pageCount}">
    				<a href = "${path}/boardList.bo?pageNum=${paging.next}">
			  		 <button type="button" class="btn btn-outline-secondary"style = "float:center;">
			  		 >>
			  		 </button>
		 		 	</a>
			  	</c:if>
			</div>
			</div>
		 </div>
		</div>
</body>
</html>
