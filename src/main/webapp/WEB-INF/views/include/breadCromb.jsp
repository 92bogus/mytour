<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Breadcromb Area Start -->
<section class="rapid-breadcromb-area section_50">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcromb">  
                    <ul>
                        <li><a href="newHome">HOME</a></li>
                        <c:if test="${!empty contentTypeId}">
                        <li> > </li>
                        </c:if>
                        <li>
                   			<c:if test="${contentTypeId eq '12'}">관광</c:if>
    						<c:if test="${contentTypeId eq '39'}">음식</c:if>
    						<c:if test="${contentTypeId eq '38'}">쇼핑</c:if>
    						<c:if test="${contentTypeId eq '28'}">레포츠</c:if>
    						<c:if test="${contentTypeId eq '14'}">문화</c:if>
    						<c:if test="${contentTypeId eq '25'}">코스</c:if>
	                      	<c:if test="${contentTypeId eq '15'}">축제 및 행사</c:if>
	                      	<c:if test="${contentTypeId eq '32'}">숙박</c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>