<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 현재 날짜 -->
<c:set var="now" value="<%= new java.util.Date()%>" />

<!-- bootstrap3 -->
<link rel="stylesheet" href="/resources/tour/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- font awesome -->
<link rel="stylesheet" href="/resources/tour/css/font-awesome.css">

<!-- tour css -->
<link rel="stylesheet" href="/resources/tour/css/style.css">

<!-- custom js -->
<script src="/resources/tour/js/custom.js"></script>


<link rel="stylesheet" href="/resources/tour/css/owl.carousel.css">
<script src="/resources/tour/js/owl.carousel.min.js"></script>

<link rel="stylesheet" href="/resources/tour/css/slicknav.css">
<script src="/resources/tour/js/jquery.slicknav.min.js"></script>