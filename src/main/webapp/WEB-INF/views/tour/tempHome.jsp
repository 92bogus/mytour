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
    임시 페이지...
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