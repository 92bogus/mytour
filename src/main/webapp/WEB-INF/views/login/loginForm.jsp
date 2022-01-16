<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<%@include file="../include/newHeader.jsp" %>
</head>
<body>   
	<form class="form-horizontal" method="POST"> 
		<article class="container">
			<div class="col-md-12">
				<div class="page-header">
					<h1>로그인</h1>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputId">아이디</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputId" name="id" placeholder="아이디" value="${loginCommand.id }">
						<span class="help-block" id="idcheckresult"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPassword" name="password" type="password" placeholder="비밀번호">
						<span class="help-block" id="logincheck"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputkeeplogin"></label>
					<div class="col-sm-6">
						<label class="form-check-label">
							<c:choose>
								<c:when test="${loginCommand.useCookie }">
									<input class="form-check-input" id="useCookie" name="useCookie" type="checkbox" checked />
								</c:when>
								<c:otherwise>
									<input class="form-check-input" id="useCookie" name="useCookie" type="checkbox" />
								</c:otherwise>
							</c:choose>
							아이디 기억하기
						</label>
						<span class="help-block" id="logincheck"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button id="btnLogon" class="btn btn-primary" type="submit">로그인</button>
						<button id="btnIdFind" class="btn btn-danger" type="submit">아이디 찾기</button>
						<button id="btnPwdFind" class="btn btn-danger" type="submit">비밀번호 찾기</button>
					</div>
				</div> 
				<hr>
			</div>
		</article>
	</form>
</body>
</html>

<script>

$(function(){
   $("#btnIdFind").click(function(event){                             
      event.preventDefault();                                                          
      alert('준비중입니다...');
      //location.href="/user/idfind";                      
   });
   
   $("#btnPwdFind").click(function(event){                                   
      event.preventDefault();                                                           
      alert('준비중입니다...');
      //location.href="/user/pwdfind";                        
   });
   
});

</script>


