<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Mainmenu Area Start -->
<section class="rapid-mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-9 col-sm-9">
                        <!-- Responsive Menu -->
                        <div class="mainmenu">
                            <nav>
                                <ul id="rapid_navigation">
                                    <li><a href="/tour/areaBasedList?contentTypeId=12">관광</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=15&eventStartDate=<fmt:formatDate value="${now}" pattern="yyyyMM" />01 ">축제 및 행사</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=39">음식</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=32">숙박</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=38">쇼핑</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=28">레포츠</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=14">문화</a></li>
                                    <li><a href="/tour/areaBasedList?contentTypeId=25">코스</a></li>
                                    <li><a href="/board/list">게시판</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="rapid-search-bar">
                            <form name="" method="GET" action="searchKeyword">
                                <input name="keyword" placeholder="Search..." type="search" value="">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Mainmenu Area End -->   