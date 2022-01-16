<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/newHeader.jsp" %>
<title>대한민국 관광정보의 모든 것</title>
</head>
<body>  
<%@ include file="../include/tourHeader.jsp" %>
<%@ include file="../include/mainmenu.jsp" %>

<c:set var="list" value="${searchKeywordMap.response.body.items.item }" />
<section class="rapid-section section_50">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
				
				<c:if test="${list.getClass().simpleName == 'HashMap' }">
				<div class="row bg-silver">
				    <div class="col-md-4">
				        <a href="detail?contentId=${list.contentid}&contentTypeId=${list.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword">
				        	<img class="img-fluid rounded mb-3 mb-md-0" src="<c:if test="${list.firstimage2 ne 'null' }">${list.firstimage2 }</c:if>
				             	<c:if test="${!list.containsKey('firstimage2')}">/resources/tour/images/No_Image_Available.jpg</c:if>" alt="thumbnail">
				    	</a>
					</div>
					<div class="col-md-8">
					    <a href="detail?contentId=${list.contentid}&contentTypeId=${list.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword">
					        <h3>${list.title }</h3> 
						</a>
						<h4>
							<i class="fa fa-eye"></i>&nbsp;${list.readcount }
						</h4>
						<h4>
							<c:if test="${list.contenttypeid ne '25' }"><i class="fa fa-map"></i>&nbsp;${list.addr1 }&nbsp;
							<c:if test="${areaBasedListVO.addr2 ne 'null' }">${list.addr2 }</c:if></c:if>
						</h4>
						<p>${list.overview }</p>
						<br/>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='detail?contentId=${list.contentid}&contentTypeId=${list.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword'"> 자세히보기 </button>
					</div>
				</div>
				<hr>
				</c:if>
				
				<c:if test="${list.getClass().simpleName == 'ArrayList' }">
				<c:forEach var="searchKeywordVO" items="${list }">                                                                                                                                             		
				<div class="row bg-silver">
				    <div class="col-md-4">
				        <a href="detail?contentId=${searchKeywordVO.contentid}&contentTypeId=${searchKeywordVO.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword">
				        	<img class="img-fluid rounded mb-3 mb-md-0" src="<c:if test="${searchKeywordVO.firstimage2 ne 'null' }">${searchKeywordVO.firstimage2 }</c:if>
				             	<c:if test="${!searchKeywordVO.containsKey('firstimage2')}">/resources/tour/images/No_Image_Available.jpg</c:if>" alt="thumbnail">
				    	</a>
					</div>
					<div class="col-md-8">
					    <a href="detail?contentId=${searchKeywordVO.contentid}&contentTypeId=${searchKeywordVO.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword">
					        <h3>${searchKeywordVO.title }</h3> 
						</a>
						<h4>
							<i class="fa fa-eye"></i>&nbsp;${searchKeywordVO.readcount }
						</h4>
						<h4>
							<c:if test="${searchKeywordVO.contenttypeid ne '25' }"><i class="fa fa-map"></i>&nbsp;${searchKeywordVO.addr1 }&nbsp;
							<c:if test="${searchKeywordVO.addr2 ne 'null' }">${searchKeywordVO.addr2 }</c:if></c:if>
						</h4>
						<p>${searchKeywordVO.overview }</p>
						<br/>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='detail?contentId=${searchKeywordVO.contentid}&contentTypeId=${searchKeywordVO.contenttypeid }&keyword=${rp.keyword }&pageNo=${rp.pageNo}&service=searchKeyword'"> 자세히보기 </button>
					</div>
				</div>
				<hr>
				</c:forEach> 
				</c:if>
    			<!-- Pagination S -->
                <div class="tour-page">
					<nav>
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="searchKeyword${pageMaker.makeQuery(1) }">&laquo;</a></li>
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link"  href="searchKeyword${pageMaker.makeQuery(pageMaker.startPage - 1) }">&lt;</a></li>
						</c:if>
						<c:if test="${!pageMaker.prev }">
							<li class="page-item"><a class="page-link"  href="searchKeyword${pageMaker.makeQuery(1) }">&lt;</a></li>
						</c:if>
						
						<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item <c:out value="${pageMaker.rp.pageNo == idx ? 'active' :  ''}" />" >
								<a class="page-link"  href="searchKeyword${pageMaker.makeQuery(idx) }">${idx }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link"  href="searchKeyword${pageMaker.makeQuery(pageMaker.endPage + 1) }">&gt;</a></li>
						</c:if>
						<c:if test="${!pageMaker.next }">
							<li class="page-item"><a class="page-link"  href="searchKeyword${pageMaker.makeQuery(pageMaker.lastPage) }">&gt;</a></li>
						</c:if>
							<li class="page-item"><a class="page-link"  href="searchKeyword${pageMaker.makeQuery(pageMaker.lastPage) }">&raquo;</a></li>
						</ul>
					</nav>
				</div>
               <!-- Pagination E -->
               
            </div>
        </div>
    </div>
</section>    

<!-- notice S -->
<section class="provider">
    <div class="container">
        <div class="provider_text provider_info" id="callout-alerts-no-default">
            <p>본 정보는 한국관광공사에서 제공하는 공공데이터를 활용하였으며, 현지사정에 의해 변경될 수 있습니다.</p>
           	
        </div>
    </div>
</section>
<!-- notice E -->    

<%@ include file="../include/footer.jsp" %>
</body>
</html>