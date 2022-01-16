<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #3ac6b6 !important;
      background-color: #fff !important;
  }

</style>
<!-- Header Area Start -->
<section class="rapid-header-area">
	<nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container">
	    <div class="navbar-header">
	      <a href="/tour">
          	<img src="/resources/tour/images/logo.jpg" alt="site logo" />
          </a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	      <c:if test="${empty authInfo }">
	        <li><a href="/login">로그인</a></li>
	        <li><a href="/member/register">회원가입</a></li>
	      </c:if>
	      <c:if test="${!empty authInfo }">
			<li><a href="javascript: alert('준비중입니다...'); ">마이페이지</a></li>	 
			<li><a href="/logout">로그아웃</a></li>      
	      </c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
</section>