<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="detailLocationList" value="${detailLocationMap.response.body.items.item }" />
<c:set var="detailPopularFestivalList" value="${detailPopularFestivalMap.response.body.items.item }" />
<c:set var="detailTopSightsList" value="${detailTopSightsMap.response.body.items.item }" />

<!-- 오른쪽 시작-->
<div class="col-md-3">
    
    <div class="tour-detail-right">
        <h3>${month }월 인기있는 축제</h3>
        
        <ul>
        	<c:forEach var="detailPopularFestivalVO" items="${detailPopularFestivalList }">
        		<fmt:parseDate value="${detailPopularFestivalVO.eventstartdate}" var="eventstartdate" pattern="yyyyMMdd"/>
				<fmt:parseDate value="${detailPopularFestivalVO.eventenddate}" var="eventenddate" pattern="yyyyMMdd"/>
        	<li class="popular_post" onclick="location.href='detail?contentId=${detailPopularFestivalVO.contentid}&contentTypeId=${detailPopularFestivalVO.contenttypeid }'">
			    <div class="tour-popular">
			        <div class="popular-image">
			        	<c:if test="${!empty detailPopularFestivalVO.firstimage }">
			            <img src="${detailPopularFestivalVO.firstimage }" alt="">
			            </c:if>
			            <c:if test="${empty detailPopularFestivalVO.firstimage }">
			            <img src="/resources/tour/images/No_Image_Available.jpg" alt="">
			            </c:if>
			        </div>
			        <div class="popular-text">
			            <h2>${detailPopularFestivalVO.title }</h2>
			            <span><i class="fa fa-calendar"></i>&nbsp;<fmt:formatDate value="${eventstartdate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventenddate}" pattern="yyyy.MM.dd"/></span>
			            <span><i class="fa fa-eye"></i>&nbsp;${detailPopularFestivalVO.readcount }</span>
			            <span><i class="fa fa-map-o"></i>&nbsp;${detailPopularFestivalVO.addr1 } <c:if test="${!empty detailPopularFestivalVO.addr2 }">${detailPopularFestivalVO.addr2 }</c:if></span>
			        </div>
			    </div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	
	<div class="tour-detail-right">
    	<h3>주변 관광정보</h3>
    	
    	<ul>     
   		<c:if test="${detailLocationList.getClass().simpleName == 'ArrayList' }">                                                                         
       		<c:forEach var="detailLocationVO" items="${detailLocationList }">
       			<c:if test="${detailLocationVO.dist ne '0'}">
	        	<li class="popular_post" onclick="location.href='detail?contentId=${detailLocationVO.contentid}&contentTypeId=${detailLocationVO.contenttypeid}'">
				    <div class="tour-popular">
				        <div class="popular-image">
				            <c:if test="${!empty detailLocationVO.firstimage }">
				            <img src="${detailLocationVO.firstimage }" alt="">
				            </c:if>
				            <c:if test="${empty detailLocationVO.firstimage }">
				            <img src="/resources/tour/images/No_Image_Available.jpg" alt="">
				            </c:if>
				        </div>
				        <div class="popular-text">
				            <h2>${detailLocationVO.title }</h2>
				            <span><i class="fa fa-road"></i>&nbsp;${detailLocationVO.dist }</span>
				            <span><i class="fa fa-eye"></i>&nbsp;${detailLocationVO.readcount }</span>
				            <c:if test="${!empty detailLocationVO.addr1 }">
				            <span><i class="fa fa-map-o"></i>&nbsp;${detailLocationVO.addr1 } ${detailLocationVO.addr2 }</span>
				            </c:if>
				            <c:if test="${empty detailLocationVO.addr1 }">
				            <span><i class="fa fa-map-o"></i>&nbsp;No Data</span>
				            </c:if>
				        </div>
				    </div>
				</li>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${detailLocationList.getClass().simpleName == 'HashMap' }">
			<c:if test="${detailLocationVO.dist ne '0'}">
	        	<li class="popular_post" onclick="location.href='detail?contentId=${detailLocationVO.contentid}&contentTypeId=${detailLocationVO.contenttypeid}'">
				    <div class="tour-popular">
				        <div class="popular-image">
				            <c:if test="${!empty detailLocationVO.firstimage }">
				            <img src="${detailLocationVO.firstimage }" alt="">
				            </c:if>
				            <c:if test="${empty detailLocationVO.firstimage }">
				            <img src="/resources/tour/images/No_Image_Available.jpg" alt="">
				            </c:if>
				        </div>
				        <div class="popular-text">
				            <h2>${detailLocationVO.title }</h2>  
				            <span><i class="fa fa-road"></i>&nbsp;${detailLocationVO.dist }</span>
				            <span><i class="fa fa-eye"></i>&nbsp;${detailLocationVO.readcount }</span>
				            <c:if test="${!empty detailLocationVO.addr1 }">
				            <span><i class="fa fa-map-o"></i>&nbsp;${detailLocationVO.addr1 } ${detailLocationVO.addr2 }</span>
				            </c:if>
				            <c:if test="${empty detailLocationVO.addr1 }">
				            <span><i class="fa fa-map-o"></i>&nbsp;No Data</span>
				            </c:if>
				        </div>
				    </div>
				</li>
				</c:if>
		</c:if>
		</ul>
	</div>
	
	<div class="tour-detail-right">
   		<h3>인기있는 TOP 3 관광지</h3>
    	<ul>
	    	<c:forEach var="detailTopSightsVO" items="${detailTopSightsList }">
	    	<li class="popular_post" onclick="location.href='detail?contentId=${detailTopSightsVO.contentid }&contentTypeId=${detailTopSightsVO.contenttypeid }'">
			    <div class="tour-popular">
			        <div class="popular-image">
			        	<c:if test="${!empty detailTopSightsVO.firstimage }">
				            <img src="${detailTopSightsVO.firstimage }" alt="">
				        </c:if>
				        <c:if test="${empty detailTopSightsVO.firstimage }">
				            <img src="/resources/tour/images/No_Image_Available.jpg" alt="">
				    	</c:if>
			        </div>
			        <div class="popular-text">
			            <h2>${detailTopSightsVO.title }</h2>
			            <span><i class="fa fa-eye"></i>&nbsp;${detailTopSightsVO.readcount }</span>
			            <span><i class="fa fa-map-o"></i>&nbsp;${detailTopSightsVO.addr1 } ${detailTopSightsVO.addr2 }</span>
			        </div>
			    </div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="blog-page-right margin-top">
	   
	    <!-- ad area start -->
		<div class="blog-sidebar-widget">
		    <div class="banner-ads">
		    </div>
		</div>
		<!-- ad area end -->
		
	</div>
</div>