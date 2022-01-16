<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	<c:if test="${!empty userVO}">
	alert("로그인 되셨습니다");
		<c:if test="${!empty dest}">
		self.location="${dest}";
		</c:if>
		<c:if test="${empty dest}">
		self.location="/tour";
		</c:if>
	</c:if>
	
	<c:if test="${empty userVO}">
	alert("로그인 실패하였습니다.");
	self.location="/user/login";
	</c:if>
</script>
</body>
</html>