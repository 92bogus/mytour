<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="../include/newHeader.jsp" %>
<title>관광정보와 인기있는 관광지 및 주변 관광정보 </title>

</head>
<body>

<c:if test="${cri.service eq 'searchKeyword' }">
<form role="form" action="searchKeyword" method="get">
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name="pageNo" value="${cri.pageNo }" />
</form>
</c:if>
<c:if test="${cri.service ne 'searchKeyword' }">
<form role="form" action="areaBasedList" method="get">
	<input type="hidden" name="contentTypeId" value="${cri.contentTypeId }" />
	<input type="hidden" name="eventStartDate" value="${cri.eventStartDate }" />
	<input type="hidden" name="pageNo" value="${cri.pageNo }" />
</form>
</c:if>


<%@ include file="../include/tourHeader.jsp" %>
<%@ include file="../include/mainmenu.jsp" %>
<%@ include file="../include/breadCromb.jsp" %>
<c:set var="detailCommon" value="${detailCommonMap.response.body.items.item }" />
<c:set var="detailIntro" value="${detailIntroMap.response.body.items.item }" />  

<fmt:parseDate value="${detailIntro.eventstartdate}" var="eventstartdate" pattern="yyyyMMdd"/>
<fmt:parseDate value="${detailIntro.eventenddate}" var="eventenddate" pattern="yyyyMMdd"/>

<!-- 중앙 Start -->    
<section class="rapid-Allpost-area section_50">
	<div class="container">
		<div class="row">
			<div id="fb-root"></div>
			
			<!-- 본문 Start-->
			<div class="col-md-9">
			    <div class="blog-page-left">
			        <div class="single-blog">
			            <div class="blog-image">
			                <c:if test="${!empty detailCommon.firstimage }">
			                <img src="${detailCommon.firstimage}" alt="blog">
			                </c:if>
			                <c:if test="${empty detailCommon.firstimage }">
			                <img src="/resources/tour/images/No_Image_Available.jpg" alt="blog">
			                </c:if>
			            </div>
			            <div class="blog-text single-post-text">
			                <div class="post-cat">
			                    <p>tourist</p>
			                </div>
			                <h2>${detailCommon.title }</h2>
			                <div class="blog-meta">
			                    <ul>
			                        <!-- contentTypeId가 15(축제 및 행사)인 경우 행사 일정을 출력 -->
			                        <c:if test="${contentTypeId eq '15' }">
			                        <li><i class="fa fa-calendar" aria-hidden="true"></i> <fmt:formatDate value="${eventstartdate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventenddate}" pattern="yyyy.MM.dd"/> </li>	
			                        </c:if>
			                        <li>
			                            <div class="fb-share-button">
			                            	<a target="_blank" href="#" class="fb-xfbml-parse-ignore">공유하기</a>
			                            </div>  
			                        </li>
			                    </ul>
			                </div>
			               
			                <div class="post-content">
			                    <div class="title">개요</div>
			                    <div class="content">${detailCommon.overview }</div>
			                </div>
			               
			                <div class="post-content">
				                <div class="title">홈페이지</div>
				                <div class="content">${detailCommon.homepage }</div>
			                </div>
			               
			                <div id="tourDetail" class="post-content">
			                    <div class="title">이용안내</div>
			                    <div class="content">
									<ul>
									<!-- contentTypeId='12'(관광) S -->
									<c:if test="${contentTypeId eq '12' }">
										<c:if test="${detailIntro.accomcount != '' && detailIntro.accomcount ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">수용인원</div>
										        <div class="col-md-7">${detailIntro.accomcount }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkbabycarriage != '' && detailIntro.chkbabycarriage ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">유모차 대여 여부</div>
										        <div class="col-md-7">${detailIntro.chkbabycarriage }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.chkcreditcard != '' && detailIntro.chkcreditcard ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">신용카드 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkcreditcard }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.chkpet != '' && detailIntro.chkpet ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">애완동물 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkpet }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.expagerange != '' && detailIntro.expagerange ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">체험가능 연령</div>
										        <div class="col-md-7">${detailIntro.expagerange }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.expguide != '' && detailIntro.expguide ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">체험안내</div>
										        <div class="col-md-7">${detailIntro.expguide }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.heritage1 != '' && detailIntro.heritage1 ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">세계 기록유산 유무</div>
										        <div class="col-md-7">${detailIntro.heritage1 }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.heritage2 != '' && detailIntro.heritage2 ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">세계 기록유산 유무</div>
										        <div class="col-md-7">${detailIntro.heritage2 }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.heritage3 != '' && detailIntro.heritage3 ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">세계 기록유산 유무</div>
										        <div class="col-md-7">${detailIntro.heritage3 }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocenter != '' && detailIntro.infocenter ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocenter }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.opendate != '' && detailIntro.opendate ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">개장일</div>
										        <div class="col-md-7">${detailIntro.opendate }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.parking != '' && detailIntro.parking ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parking }</div>
										    </div>
										</li>
									 	</c:if>		 	
									 	<c:if test="${detailIntro.restdate != '' && detailIntro.restdate ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">쉬는날</div>
										        <div class="col-md-7">${detailIntro.restdate }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.useseason != '' && detailIntro.useseason ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용시기</div>
										        <div class="col-md-7">${detailIntro.useseason }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.usetime != '' && detailIntro.usetime ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용시간</div>
										        <div class="col-md-7">${detailIntro.usetime }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
									<!-- contentTypeId='12'(관광) E -->
									
									<!-- contentTypeId='14'(문화) S -->
									<c:if test="${contentTypeId eq '14'}">
										<c:if test="${detailIntro.accomcountculture != '' && detailIntro.accomcountculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">수용인원</div>
										        <div class="col-md-7">${detailIntro.accomcountculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkbabycarriageculture != '' && detailIntro.chkbabycarriageculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">유모차 대여 여부</div>
										        <div class="col-md-7">${detailIntro.chkbabycarriageculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkcreditcardculture != '' && detailIntro.chkcreditcardculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">신용카드 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkcreditcardculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkpetculture != '' && detailIntro.chkpetculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">애완동물 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkpetculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.discountinfo != '' && detailIntro.discountinfo ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">할인정보</div>
										        <div class="col-md-7">${detailIntro.discountinfo }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocenterculture != '' && detailIntro.infocenterculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocenterculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkingculture != '' && detailIntro.parkingculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parkingculture }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.parkingfee != '' && detailIntro.parkingfee ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차요금</div>
										        <div class="col-md-7">${detailIntro.parkingfee }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.restdateculture != '' && detailIntro.restdateculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">쉬는날</div>
										        <div class="col-md-7">${detailIntro.restdateculture }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.usefee != '' && detailIntro.usefee ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용요금</div>
										        <div class="col-md-7">${detailIntro.usefee }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.usetimeculture != '' && detailIntro.usetimeculture ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용시간</div>
										        <div class="col-md-7">${detailIntro.usetimeculture }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.scale != '' && detailIntro.scale ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">규모</div>
										        <div class="col-md-7">${detailIntro.scale }</div>
										    </div>
										</li>
									 	</c:if>
										<c:if test="${detailIntro.spendtime != '' && detailIntro.spendtime ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">관람 소요시간</div>
										        <div class="col-md-7">${detailIntro.spendtime }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
									<!-- contentTypeId='14'(문화) E -->
									
									<!-- contentTypeId='15'(행사/공연/축제) S -->
									<c:if test="${contentTypeId eq '15' }">
										<c:if test="${detailIntro.agelimit != '' && detailIntro.agelimit ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">관람 가능연령</div>
										        <div class="col-md-7">${detailIntro.agelimit }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.bookingplace != '' && detailIntro.bookingplace ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">예매처</div>
										        <div class="col-md-7">${detailIntro.bookingplace }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.discountinfofestival != '' && detailIntro.discountinfofestival ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">할인정보</div>
										        <div class="col-md-7">${detailIntro.discountinfofestival }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.eventenddate != '' && detailIntro.eventenddate ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사종료일</div>
										        <div class="col-md-7">${detailIntro.eventenddate }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.eventhomepage != '' && detailIntro.eventhomepage ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사 홈페이지</div>
										        <div class="col-md-7">${detailIntro.eventhomepage }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.eventplace != '' && detailIntro.eventplace ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사 장소</div>
										        <div class="col-md-7">${detailIntro.eventplace }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.eventstartdate != '' && detailIntro.eventstartdate ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사 시작일</div>
										        <div class="col-md-7">${detailIntro.eventstartdate }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.festivalgrade != '' && detailIntro.festivalgrade ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">축제 등급</div>
										        <div class="col-md-7">${detailIntro.festivalgrade }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.placeinfo != '' && detailIntro.placeinfo ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사장 위치안내</div>
										        <div class="col-md-7">${detailIntro.placeinfo }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.playtime != '' && detailIntro.playtime ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">공연시간</div>
										        <div class="col-md-7">${detailIntro.playtime }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.program != '' && detailIntro.program ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">행사 프로그램</div>
										        <div class="col-md-7">${detailIntro.program }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.spendtimefestival != '' && detailIntro.spendtimefestival ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">관람 소요시간</div>
										        <div class="col-md-7">${detailIntro.spendtimefestival }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sponsor1 != '' && detailIntro.sponsor1 ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주최자 정보</div>
										        <div class="col-md-7">${detailIntro.sponsor1 }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sponsor1tel != '' && detailIntro.sponsor1tel ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주최자 연락처</div>
										        <div class="col-md-7">${detailIntro.sponsor1tel }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sponsor2 != '' && detailIntro.sponsor2 ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주관사 정보</div>
										        <div class="col-md-7">${detailIntro.sponsor2 }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sponsor2tel != '' && detailIntro.sponsor2tel ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주관사 연락처</div>
										        <div class="col-md-7">${detailIntro.sponsor2tel }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.subevent != '' && detailIntro.subevent ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">부대행사</div>
										        <div class="col-md-7">${detailIntro.subevent }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.usetimefestival != '' && detailIntro.usetimefestival ne null}">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용요금</div>
										        <div class="col-md-7">${detailIntro.usetimefestival }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
				                    <!-- contentTypeId='15'(행사/공연/축제) E -->
				                    
				                    <!-- contentTypeId='25'(여행코스) S -->
									<c:if test="${contentTypeId eq '25' }">
										<c:if test="${detailIntro.distance != '' && detailIntro.distance ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">코스 총거리</div>
										        <div class="col-md-7">${detailIntro.distance }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocentertourcourse != '' && detailIntro.infocentertourcourse ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocentertourcourse }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.schedule != '' && detailIntro.schedule ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">코스 일정</div>
										        <div class="col-md-7">${detailIntro.schedule }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.taketime != '' && detailIntro.taketime ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">코스 총 소요시간</div>
										        <div class="col-md-7">${detailIntro.taketime }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.theme != '' && detailIntro.theme ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">코스 테마</div>
										        <div class="col-md-7">${detailIntro.theme }</div>
										    </div>
										</li>
									 	</c:if>
									 </c:if>		 	
				                    <!-- contentTypeId='25'(여행코스) E -->
				                    
				                    <!-- contentTypeId='28'(레포츠) S -->
				                    <c:if test="${contentTypeId eq '28' }">
										<c:if test="${detailIntro.accomcountleports != '' && detailIntro.accomcountleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">수용인원</div>
										        <div class="col-md-7">${detailIntro.accomcountleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkbabycarriageleports != '' && detailIntro.chkbabycarriageleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">유모차 대여 여부</div>
										        <div class="col-md-7">${detailIntro.chkbabycarriageleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkcreditcardleports != '' && detailIntro.chkcreditcardleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">신용카드 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkcreditcardleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkpetleports != '' && detailIntro.chkpetleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">애완동물 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkpetleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.expagerangeleports != '' && detailIntro.expagerangeleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">체험 가능연령</div>
										        <div class="col-md-7">${detailIntro.expagerangeleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocenterleports != '' && detailIntro.infocenterleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocenterleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.openperiod != '' && detailIntro.openperiod ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">개장기간</div>
										        <div class="col-md-7">${detailIntro.openperiod }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkingfeeleports != '' && detailIntro.parkingfeeleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차요금</div>
										        <div class="col-md-7">${detailIntro.parkingfeeleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkingleports != '' && detailIntro.parkingleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parkingleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.reservation != '' && detailIntro.reservation ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">예약안내</div>
										        <div class="col-md-7">${detailIntro.reservation }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.restdateleports != '' && detailIntro.restdateleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">쉬는날</div>
										        <div class="col-md-7">${detailIntro.restdateleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.scaleleports != '' && detailIntro.scaleleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">규모</div>
										        <div class="col-md-7">${detailIntro.scaleleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.usefeeleports != '' && detailIntro.usefeeleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">입장료</div>
										        <div class="col-md-7">${detailIntro.usefeeleports }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.usetimeleports != '' && detailIntro.usetimeleports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">이용시간</div>
										        <div class="col-md-7">${detailIntro.usetimeleports }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
				                    <!-- contentTypeId='28'(레포츠) E -->
				                    
				                    <!-- contentTypeId='32'(숙박) S -->
									<c:if test="${contentTypeId eq '32' }">
										<c:if test="${detailIntro.accomcountlodging != '' && detailIntro.accomcountlodging ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">수용 가능인원</div>
										        <div class="col-md-7">${detailIntro.accomcountlodging }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.benikia != '' && detailIntro.benikia ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">베니키아 여부</div>
										        <div class="col-md-7">${detailIntro.benikia }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.checkintime != '' && detailIntro.checkintime ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">입실 시간</div>
										        <div class="col-md-7">${detailIntro.checkintime }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.checkouttime != '' && detailIntro.checkouttime ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">퇴실 시간</div>
										        <div class="col-md-7">${detailIntro.checkouttime }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkcooking != '' && detailIntro.chkcooking ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">객실 내 취사 여부</div>
										        <div class="col-md-7">${detailIntro.chkcooking }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.foodplace != '' && detailIntro.foodplace ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">식음료장</div>
										        <div class="col-md-7">${detailIntro.foodplace }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.goodstay != '' && detailIntro.goodstay ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">굿스테이 여부</div>
										        <div class="col-md-7">${detailIntro.goodstay }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.hanok != '' && detailIntro.hanok ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">한옥 여부</div>
										        <div class="col-md-7">${detailIntro.hanok }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocenterlodging != '' && detailIntro.infocenterlodging ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocenterlodging }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkinglodging != '' && detailIntro.parkinglodging ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parkinglodging }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.pickup != '' && detailIntro.pickup ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">픽업 서비스</div>
										        <div class="col-md-7">${detailIntro.pickup }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.roomcount != '' && detailIntro.roomcount ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">객실수</div>
										        <div class="col-md-7">${detailIntro.roomcount }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.reservationlodging != '' && detailIntro.reservationlodging ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">예약안내</div>
										        <div class="col-md-7">${detailIntro.reservationlodging }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.reservationurl != '' && detailIntro.reservationurl ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">예약안내 홈페이지</div>
										        <div class="col-md-7">${detailIntro.reservationurl }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.roomtype != '' && detailIntro.roomtype ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">객실유형</div>
										        <div class="col-md-7">${detailIntro.roomtype }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.scalelodging != '' && detailIntro.scalelodging ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">규모</div>
										        <div class="col-md-7">${detailIntro.scalelodging }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.subfacility != '' && detailIntro.subfacility ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">부대시설 (기타)</div>
										        <div class="col-md-7">${detailIntro.subfacility }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.barbecue != '' && detailIntro.barbecue ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">바비큐장 여부</div>
										        <div class="col-md-7">${detailIntro.barbecue }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.beauty != '' && detailIntro.beauty ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">뷰티시설 정보</div>
										        <div class="col-md-7">${detailIntro.beauty }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.beverage != '' && detailIntro.beverage ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">식음료장 여부</div>
										        <div class="col-md-7">${detailIntro.beverage }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.bicycle != '' && detailIntro.bicycle ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">자전거 대여 여부</div>
										        <div class="col-md-7">${detailIntro.bicycle }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.campfire != '' && detailIntro.campfire ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">캠프파이어 여부</div>
										        <div class="col-md-7">${detailIntro.campfire }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.fitness != '' && detailIntro.fitness ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">휘트니스 센터 여부</div>
										        <div class="col-md-7">${detailIntro.fitness }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.karaoke != '' && detailIntro.karaoke ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">노래방 여부</div>
										        <div class="col-md-7">${detailIntro.karaoke }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.publicbath != '' && detailIntro.publicbath ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">공용 샤워실 여부</div>
										        <div class="col-md-7">${detailIntro.publicbath }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.publicpc != '' && detailIntro.publicpc ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">공용 PC실 여부</div>
										        <div class="col-md-7">${detailIntro.publicpc }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sauna != '' && detailIntro.sauna ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">사우나실 여부</div>
										        <div class="col-md-7">${detailIntro.sauna }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.seminar != '' && detailIntro.seminar ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">세미나실 여부</div>
										        <div class="col-md-7">${detailIntro.seminar }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.sports != '' && detailIntro.sports ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">스포츠 시설 여부</div>
										        <div class="col-md-7">${detailIntro.sports }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
				                    <!-- contentTypeId='32'(숙박) E -->
				                    
				                    <!-- contentTypeId='38'(쇼핑) S -->
				                    <c:if test="${contentTypeId eq '38' }">
										<c:if test="${detailIntro.chkbabycarriageshopping != '' && detailIntro.chkbabycarriageshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">유모차 대여 여부</div>
										        <div class="col-md-7">${detailIntro.chkbabycarriageshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkcreditcardshopping != '' && detailIntro.chkcreditcardshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">신용카드 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkcreditcardshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.chkpetshopping != '' && detailIntro.chkpetshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">애완동물 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkpetshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.culturecenter != '' && detailIntro.culturecenter ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문화센터 바로가기</div>
										        <div class="col-md-7">${detailIntro.culturecenter }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.fairday != '' && detailIntro.fairday ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">장서는 날</div>
										        <div class="col-md-7">${detailIntro.fairday }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocentershopping != '' && detailIntro.infocentershopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocentershopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.opendateshopping != '' && detailIntro.opendateshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">개장일</div>
										        <div class="col-md-7">${detailIntro.opendateshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.opentime != '' && detailIntro.opentime ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">영업시간</div>
										        <div class="col-md-7">${detailIntro.opentime }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkingshopping != '' && detailIntro.parkingshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parkingshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.restdateshopping != '' && detailIntro.restdateshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">쉬는날</div>
										        <div class="col-md-7">${detailIntro.restdateshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.restroom != '' && detailIntro.restroom ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">화장실 설명</div>
										        <div class="col-md-7">${detailIntro.restroom }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.saleitem != '' && detailIntro.saleitem ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">판매 품목</div>
										        <div class="col-md-7">${detailIntro.saleitem }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.saleitemcost != '' && detailIntro.saleitemcost ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">판매 품목별 가격</div>
										        <div class="col-md-7">${detailIntro.saleitemcost }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.scaleshopping != '' && detailIntro.scaleshopping ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">규모</div>
										        <div class="col-md-7">${detailIntro.scaleshopping }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.shopguide != '' && detailIntro.shopguide ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">매장안내</div>
										        <div class="col-md-7">${detailIntro.shopguide }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
				                    <!-- contentTypeId='38'(쇼핑) E -->
				                    
				                    <!-- contentTypeId='39'(음식) S -->
				                    <c:if test="${contentTypeId eq '39' }">
										<c:if test="${detailIntro.chkcreditcardfood != '' && detailIntro.chkcreditcardfood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">신용카드 가능 여부</div>
										        <div class="col-md-7">${detailIntro.chkcreditcardfood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.discountinfofood != '' && detailIntro.discountinfofood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">할인정보</div>
										        <div class="col-md-7">${detailIntro.discountinfofood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.firstmenu != '' && detailIntro.firstmenu ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">대표 메뉴</div>
										        <div class="col-md-7">${detailIntro.firstmenu }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.infocenterfood != '' && detailIntro.infocenterfood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">문의 및 안내</div>
										        <div class="col-md-7">${detailIntro.infocenterfood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.kidsfacility != '' && detailIntro.kidsfacility ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">어린이 놀이방 여부</div>
										        <div class="col-md-7">${detailIntro.kidsfacility }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.opendatefood != '' && detailIntro.opendatefood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">개업일</div>
										        <div class="col-md-7">${detailIntro.opendatefood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.opentimefood != '' && detailIntro.opentimefood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">영업시간</div>
										        <div class="col-md-7">${detailIntro.opentimefood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.packing != '' && detailIntro.packing ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">포장 가능</div>
										        <div class="col-md-7">${detailIntro.packing }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.parkingfood != '' && detailIntro.parkingfood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">주차시설</div>
										        <div class="col-md-7">${detailIntro.parkingfood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.reservationfood != '' && detailIntro.reservationfood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">예약안내</div>
										        <div class="col-md-7">${detailIntro.reservationfood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.restdatefood != '' && detailIntro.restdatefood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">쉬는날</div>
										        <div class="col-md-7">${detailIntro.restdatefood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.scalefood != '' && detailIntro.scalefood ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">규모</div>
										        <div class="col-md-7">${detailIntro.scalefood }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.seat != '' && detailIntro.seat ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">좌석수</div>
										        <div class="col-md-7">${detailIntro.seat }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.smoking != '' && detailIntro.smoking ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">금연/흡연 여부</div>
										        <div class="col-md-7">${detailIntro.smoking }</div>
										    </div>
										</li>
									 	</c:if>
									 	<c:if test="${detailIntro.treatmenu != '' && detailIntro.treatmenu ne null }">
				                        <li>
										    <div class="container">
										        <div class="col-md-2 use_info">취급 메뉴</div>
										        <div class="col-md-7">${detailIntro.treatmenu }</div>
										    </div>
										</li>
									 	</c:if>
									</c:if>
				                    <!-- contentTypeId='39'(음식) E -->
				                    </ul>      
			                    </div>
			                </div>
			                
			                <div class="post-content">
			                    <div class="title">위치</div>
			                    <div class="content">${detailCommon.addr1} <c:if test="${!empty detailCommon.addr2 }">${detailCommon.addr2 }</c:if></div>
			                    
			                    <!-- 다음 지도api 영역 -->
			                    <div id="map" class="gMap"></div>
			                </div>
			               
			                <div class="post-content">
			                    <div class="title">사진</div>
			                    <div class="content">
				                    <c:if test="${detailImageMap.response.body.totalCount ne '0' }">
				                    	<!-- 사진이 1개일 때 -->
				                    	<c:if test="${detailImageMap.response.body.items.item.getClass().simpleName == 'HashMap' }">
				                    		<img src="${detailImageMap.response.body.items.item.originimgurl }" alt="">
				                    	</c:if>
				                    	<!-- 사진이 2개 이상일 때 -->
				                    	<c:if test="${detailImageMap.response.body.items.item.getClass().simpleName == 'ArrayList' }">
				                    		<c:forEach var="detailImageItem" items="${detailImageMap.response.body.items.item }">
				                    		<img src="${detailImageItem.originimgurl }" alt="">
				                    		</c:forEach>
				                    	</c:if>
				                    </c:if>	                   
			                    </div>
			                </div>
			           	</div>
			        </div>
			    </div>
			    <div>
			        <button type="submit" class="btn btn-default btn-lg btn-block" id="goListBtn"> 목록 </button>
			    </div>
			</div>
			<!-- 본문 End -->
			
			<!-- 오른쪽 Start -->
			<%@ include file="../include/right.jsp" %>
	        
		</div>
	</div>
</section>
<!-- 중앙 End -->

<%@ include file="../include/notice.jsp" %>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53cbe013d2f558ce9f97d98fc1cabd5b"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${detailCommon.mapy}, ${detailCommon.mapx}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(${detailCommon.mapy}, ${detailCommon.mapx}); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>

<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$("#goListBtn").on("click", function(event) {
		event.preventDefault();
		formObj.attr("method", "get");
		formObj.submit();
	});
});

</script>
</body>
</html>
<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$(".goListBtn").on("click", function(event) {
		event.preventDefault();
		formObj.attr("method", "get");
		formObj.submit();
	});
});

</script>