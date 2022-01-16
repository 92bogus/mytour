<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/newHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/tour/old_view/css/old_view_use_layout.css">
	<title>게시판</title>
</head>

<body>
<%@ include file="../include/tourHeader.jsp" %>
<%@ include file="../include/mainmenu.jsp" %>
<%@ include file="../include/breadCromb.jsp" %>
	
<section class="post_area">
	<div class="container">
		<div class="row">
		<h2>여행 후기 게시판</h2>
		<p>자유로운 후기글을 올려주세요</p>				
		<table class="table">
			<colgroup>
			    <col width="5%"/>
			    <col width="60%"/>
			    <col width="10%"/>                 
			    <col width="15%"/>       
			    <col width="10%"/>
		  	</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="boardVO" items="${list }">
				<tr>
					<td>${boardVO.bno }</td>
					<td><a href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}">${boardVO.title } <strong>[${boardVO.replycnt }]</strong></a></td>
					<td>${boardVO.writer }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }" /></td>
					<td>${boardVO.viewcnt }</td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div class="row">
		<div class="tour-page">
			<a href='javascript:void(0);' class="btn btn-default" onclick='goListAll();'>전체목록</a>
			<a href='javascript:void(0);' class="btn btn-default" onclick='goWrite();'>새 글</a>
		</div>
		</div>
		<hr>
		<div class="row">
			
				<div class="tour-page">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(1) }">&laquo;</a></li>
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link"  href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&lt;</a></li>
					</c:if>
					<c:if test="${!pageMaker.prev }">
						<li class="page-item"><a class="page-link"  href="list${pageMaker.makeSearch(1) }">&lt;</a></li>
					</c:if>
					
					<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="page-item <c:out value="${pageMaker.cri.page == idx ? 'active' :  ''}" />" >
							<a class="page-link"  href="list${pageMaker.makeSearch(idx) }">${idx }</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link"  href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&gt;</a></li>
					</c:if>
					<c:if test="${!pageMaker.next }">
						<li class="page-item"><a class="page-link"  href="list${pageMaker.makeSearch(pageMaker.lastPage) }">&gt;</a></li>
					</c:if>
						<li class="page-item"><a class="page-link"  href="list${pageMaker.makeSearch(pageMaker.lastPage) }">&raquo;</a></li>
					</ul>
				</div>
		</div>
		
		<div class="row">
			<form class="form-inline col-sm-4 col-sm-offset-4">
				<div class="input-group">
					<div class="input-group-btn">
						<select name="searchType" class="form-control">
							<option value="n" <c:out value="${cri.searchType == null ? 'selected' : '' }" />>전체</option>
							<option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' : '' }" />>제목</option>
							<option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' : '' }" />>내용</option>
							<option value="w" <c:out value="${cri.searchType eq 'w' ? 'selected' : '' }" />>작성자</option>
							<option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }" />>제목 또는 내용</option>
							<option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' : '' }" />>내용 또는 작성자</option>	
						</select>	
					</div>
					<input type="text" class="form-control" name="keyword" id="keywordInput" value="${cri.keyword }" >
					<div class="input-group-btn">
						<button class="btn btn-default" id="searchBtn">검색</button>
					</div>
				</div>
			</form>
		</div>
		
		
	</div>
</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>

<script>
	var result = '${msg}';
	
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	function goListAll() {
		self.location = "list"
	}
	
	function goWrite() {
		self.location = "register"
			+ '${pageMaker.makeQuery(pageMaker.cri.page)}'
			+ '&searchType='
			+ $("select option:selected").val()
			+ "&keyword="
			+ encodeURIComponent($('#keywordInput').val());
	}
	
	$(document).ready(function() {
		$("#searchBtn").on("click", function(event) {
			self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select option:selected").val()
							+ "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
		});
	
	});
</script>

<script>
	$(document).on("click", "#logoutBtn", function() {
		location.href = "/user/logout";
	});
</script>