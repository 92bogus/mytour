<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">

<%@ include file="../include/newHeader.jsp" %>

<title>관광정보사이트</title>
</head>
<body>
<%@ include file="../include/tourHeader.jsp" %>

<%@ include file="../include/mainmenu.jsp" %>  

<%@ include file="../include/breadCromb.jsp" %>  

<section class="post_area">
    
    <!-- 축제 및 행사 S -->
    <div class="container">
        <div class="welcome_title">
            <h3>축제 및 행사</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=15&eventStartDate=<fmt:formatDate value="${now}" pattern="yyyyMM" />01 " class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		
        		<c:forEach var="VO" items="${areaBasedListFestivalMap.response.body.items.item }">
	                <fmt:parseDate value="${VO.eventstartdate}" var="eventstartdate" pattern="yyyyMMdd"/>
					<fmt:parseDate value="${VO.eventenddate}" var="eventenddate" pattern="yyyyMMdd"/>
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-calendar" aria-hidden="true"> <fmt:formatDate value="${eventstartdate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventenddate}" pattern="yyyy.MM.dd"/></i></li>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
               	</c:forEach>
       </div>
    </div>
    <!-- 축제 및 행사 E -->
   	
   	<!-- 관광 S -->
   	<div class="container">
        <div class="welcome_title">
            <h3>관광</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=12" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		<c:forEach var="VO" items="${areaBasedListSightsMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
               	</c:forEach>
       </div>
    </div> 
    <!-- 관광 E -->
    
    <!-- 음식 S -->
    <div class="container">
        <div class="welcome_title">
            <h3>음식</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=39" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
                <c:forEach var="VO" items="${areaBasedListFoodMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
       </div>
    </div>
    <!-- 음식 E -->
    
    <!-- 문화 S -->
    <div class="container">
        <div class="welcome_title">
            <h3>문화</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=14" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		<c:forEach var="VO" items="${areaBasedListCultureMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
       </div>
    </div>
    <!-- 문화 E -->
    
    <!-- 쇼핑 S -->
    <div class="container">
        <div class="welcome_title">
            <h3>쇼핑</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=38" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		<c:forEach var="VO" items="${areaBasedListShoppingMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
       </div>
    </div>
    <!-- 쇼핑 E -->
    
    <!-- 레포츠 S -->
	<div class="container">
        <div class="welcome_title">
            <h3>레포츠</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=28" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		<c:forEach var="VO" items="${areaBasedListLeportsMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
				</c:forEach>
       </div>
    </div>
    <!-- 레포츠 E -->
    
    <!-- 숙박 S -->
	<div class="container">
        <div class="welcome_title">
            <h3>숙박</h3>
            <div class="more">
                <a href="/tour/areaBasedListRequest?contentTypeId=32" class="btn btn-default btn-sm">더보기</a>
            </div>
        </div>
 
        <div class="row">
        		<c:forEach var="VO" items="${areaBasedListStayMap.response.body.items.item }">
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="blog-image">
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">
                                 <c:if test="${!empty VO.firstimage }">
                                <img src="${VO.firstimage}" alt="blog" />
                                </c:if>
                                <c:if test="${empty VO.firstimage }">
                                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog" />
                                </c:if>
                            </a>
                        </div>
                        <div class="post_text">
                            <h2><a id="title_2551594" href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }">${VO.title}</a></h2>
                            <div class="blog-meta">
                                <ul>
                                    <li><i class="fa fa-eye" aria-hidden="true"></i> ${VO.readcount}</li>
                                </ul>
                            </div>
                            <p id="overview_2551594">${VO.overview }<br></p>
                            <a href="/tour/detail?contentId=${VO.contentid }&contentTypeId=${VO.contenttypeid }" class="btn btn-success">자세히보기</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
       </div>
    </div>
    <!-- 숙박 E -->
</section>

<%@ include file="../include/notice.jsp" %>    
  
<!-- Mainmenu Area End -->    
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript" src="/resources/tour/js/wcslog.js"></script>   
 
</body>
</html>
<script>
<c:if test="${msg eq 'JOIN_SUCCESS'}">
	alert("가입 완료되었습니다.");
</c:if>
</script>