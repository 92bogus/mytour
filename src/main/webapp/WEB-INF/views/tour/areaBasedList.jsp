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
<%@ include file="../include/breadCromb.jsp" %>

<c:set var="areaBasedList" value="${areaBasedListMap.response.body.items.item }" />

<section class="rapid-section section_50">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
				
				<!-- 축제 및 행사, 숙박이 아닌 경우 -->
				<c:if test="${contentTypeId ne '15' && contentTypeId ne '32'}">
					<c:forEach var="areaBasedListVO" items="${areaBasedList }">                                                                                                                                             		
					<div class="row bg-silver">
					    <div class="col-md-4">
					        <a href="detail?contentId=${areaBasedListVO.contentid}&contentTypeId=${areaBasedListVO.contenttypeid }&pageNo=${rp.pageNo}">
					        	<img class="img-fluid rounded mb-3 mb-md-0" src="<c:if test="${!empty areaBasedListVO.firstimage}">${areaBasedListVO.firstimage }</c:if>
					             	<c:if test="${empty areaBasedListVO.firstimage}">/resources/tour/images/No_Image_Available.jpg</c:if>" alt="thumbnail">
					    	</a>
						</div>
						<div class="col-md-8">
						    <a href="detail?contentId=${areaBasedListVO.contentid}&contentTypeId=${areaBasedListVO.contenttypeid }&pageNo=${rp.pageNo}">
						        <h3>${areaBasedListVO.title }</h3> 
							</a>
							<h4>
								<i class="fa fa-eye"></i>&nbsp;${areaBasedListVO.readcount }
							</h4>
							<h4>
								<c:if test="${pageMaker.rp.contentTypeId ne '25' }"><i class="fa fa-map"></i>&nbsp;${areaBasedListVO.addr1 }&nbsp;
								<c:if test="${!empty areaBasedListVO.addr2}">${areaBasedListVO.addr2 }</c:if></c:if>
							</h4>
							<p>${areaBasedListVO.overview}</p>
							<br/>
							<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='detail?contentId=${areaBasedListVO.contentid}&contentTypeId=${areaBasedListVO.contenttypeid }&pageNo=${rp.pageNo}'"> 자세히보기 </button>
						</div>
					</div>
					<hr>
					</c:forEach> 
				</c:if>
				
				<!-- 축제 및 행사 -->
				<c:if test="${contentTypeId eq '15' }">
					<c:forEach var="searchFestivalVO" items="${areaBasedList }">                                                                                                                                             
						<fmt:parseDate value="${searchFestivalVO.eventstartdate}" var="eventstartdate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${searchFestivalVO.eventenddate}" var="eventenddate" pattern="yyyyMMdd"/>
					
					<div class="row bg-silver">
					    <div class="col-md-4">
					        <a href="detail?contentId=${searchFestivalVO.contentid}&contentTypeId=${searchFestivalVO.contenttypeid }&eventStartDate=${rp.eventStartDate }&pageNo=${rp.pageNo}">
					            <img class="img-fluid rounded mb-3 mb-md-0" src="<c:if test="${!empty searchFestivalVO.firstimage}">${searchFestivalVO.firstimage }</c:if>
					             	<c:if test="${empty searchFestivalVO.firstimage}">/resources/tour/images/No_Image_Available.jpg</c:if>" alt="thumbnail">
					    	</a>
						</div>
						<div class="col-md-8">
						    <a href="detail?contentId=${searchFestivalVO.contentid}&contentTypeId=${searchFestivalVO.contenttypeid }&eventStartDate=${rp.eventStartDate }&pageNo=${rp.pageNo}">
						        <h3>${searchFestivalVO.title }</h3> 
							</a> 
							<h4>
								<i class="fa fa-calendar"></i>&nbsp;<fmt:formatDate value="${eventstartdate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventenddate}" pattern="yyyy.MM.dd"/>&nbsp;&nbsp;&nbsp;<i class="fa fa-eye"></i>&nbsp;${searchFestivalVO.readcount }
							</h4>
							<h4>
								<i class="fa fa-map"></i>&nbsp;${searchFestivalVO.addr1 }&nbsp;<c:if test="${!empty searchFestivalVO.addr2}">${searchFestivalVO.addr2 }</c:if>
							</h4>
							<p>${searchFestivalVO.overview }</p>
							<br/>
							<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='detail?contentId=${searchFestivalVO.contentid}&contentTypeId=${searchFestivalVO.contenttypeid }&eventStartDate=${rp.eventStartDate }&pageNo=${rp.pageNo}'"> 자세히보기 </button>
						</div>
					</div>
					<hr>
					</c:forEach>
				</c:if>
				
				<!-- 숙박 -->
				<c:if test="${contentTypeId eq '32' }">
				<c:forEach var="searchStayVO" items="${areaBasedList }">                                                                                                                                             		
				<div class="row bg-silver">
				    <div class="col-md-4">
				        <a href="detail?contentId=${searchStayVO.contentid}&contentTypeId=${searchStayVO.contenttypeid }&pageNo=${rp.pageNo}">
				        	<img class="img-fluid rounded mb-3 mb-md-0" src="<c:if test="${!empty searchStayVO.firstimage}">${searchStayVO.firstimage }</c:if>
				             	<c:if test="${empty searchStayVO.firstimage}">/resources/tour/images/No_Image_Available.jpg</c:if>" alt="thumbnail">
				    	</a>
					</div>
					<div class="col-md-8">
					    <a href="detail?contentId=${searchStayVO.contentid}&contentTypeId=${searchStayVO.contenttypeid }&pageNo=${rp.pageNo}">
					        <h3>${searchStayVO.title }</h3> 
						</a>
						<h4>
							<i class="fa fa-eye"></i>&nbsp;${searchStayVO.readcount }
						</h4>
						<h4>
							<i class="fa fa-map"></i>&nbsp;${searchStayVO.addr1 }&nbsp;<c:if test="${!empty searchStayVO.addr2}">${searchStayVO.addr2 }</c:if>
						</h4>
						<p>${searchStayVO.overview }</p>
						<br/>
						<button type="button" class="btn btn-default btn-lg btn-block" onclick="location.href='detail?contentId=${searchStayVO.contentid}&contentTypeId=${searchStayVO.contenttypeid }'"> 자세히보기 </button>
					</div>
				</div>
				<hr>
				</c:forEach>
				</c:if>
	
    			<!-- Pagination S -->
                <div class="tour-page">
					<nav>
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="areaBasedList${pageMaker.makeQuery(1) }">&laquo;</a></li>
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link"  href="areaBasedList${pageMaker.makeQuery(pageMaker.startPage - 1) }">&lt;</a></li>
						</c:if>
						<c:if test="${!pageMaker.prev }">
							<li class="page-item"><a class="page-link"  href="areaBasedList${pageMaker.makeQuery(1) }">&lt;</a></li>
						</c:if>
						
						<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item <c:out value="${pageMaker.rp.pageNo == idx ? 'active' :  ''}" />" >
								<a class="page-link"  href="areaBasedList${pageMaker.makeQuery(idx) }">${idx }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link"  href="areaBasedList${pageMaker.makeQuery(pageMaker.endPage + 1) }">&gt;</a></li>
						</c:if>
						<c:if test="${!pageMaker.next }">
							<li class="page-item"><a class="page-link"  href="areaBasedList${pageMaker.makeQuery(pageMaker.lastPage) }">&gt;</a></li>
						</c:if>
							<li class="page-item"><a class="page-link"  href="areaBasedList${pageMaker.makeQuery(pageMaker.lastPage) }">&raquo;</a></li>
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