<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- explorer edge 버전와의 호환성 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 안드로이드나 아이폰에서 화면회전할때 비율 -->
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>회원가입</title>
   <%@include file="../include/newHeader.jsp" %>
    <!--  아래 주석은 html5 가 지원되지 않는 
                 브라우저의 호환성을 위해서 붙임 
                 삭제하면 안됨 
    -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 
  </head>
  <body>
   
      
     <form name="myform" id="myform" class="form-horizontal">
      
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
           <h1>아이디 </h1>
        </div>

        <div class="form-group">
          <c:if test="${empty userid}">         <!--만약 session에 저장한 email값이 null 이거나 공백이면-->
           <div class="col-sm-6">
               아이디를 찾을 수 없습니다                         <!--아이디를 찾을 수 없습니다.-->
           </div>
         </c:if>
         <c:if test="${!empty userid}">           <!--만약 session에 저장한 email값이 null이 아니거나 공백이 아니면-->
           <div class="col-sm-6">
               아이디는 ${userid} 입니다                          <!--session에 email이란 name으로 저장한 값을 보여준다.-->
           </div>
         </c:if>
        </div>
        
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btnLogon" class="btn btn-primary" type="submit">로그온<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
        
          <hr>
        </div>
      </article>
</form>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
  </body>
</html>
<script>
$(function(){
   $("#btnLogon").click(function(event){                   //btnLogon id를 가진 태크를 클릭하면 다음 함수를 실행하겠다.
      event.preventDefault();                               //submit을 막고
      location.href="/user/login";         //${commonURL}/member/logon.mt다음 경로로 이동하겠다.
   });
});


</script>


