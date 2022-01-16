<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>  
<title>아이디찾기</title>
<%@include file="../include/newHeader.jsp" %>
</head>
<body>
	<form name="myform" id="myform" class="form-horizontal">
		<article class="container">
			<div class="col-md-12">
				<div class="page-header">
					<h1>아이디 찾기</h1>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputEmail" name="email" type="text" placeholder="email을 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputMobile">핸드폰</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputMobile" name="mobile" type="text" placeholder="핸드폰번호를 '-' 없이 입력하세요">
						<span class="help-block" id="idfindcheck"></span>
					</div>
				</div>  
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button id="btnIdFind" class="btn btn-primary" type="submit">아이디 찾기<i class="fa fa-check spaceLeft"></i></button>
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
      $("#myform").prop("method", "POST");
      $("#myform").prop("action", "/user/idfind");
   });
});
</script>


