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
           <h1>패스워드 찾기</h1>
        </div>

        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputID">ID</label>
           <div class="col-sm-6">
               <input class="form-control" id="inputID" name="userid" placeholder="아이디">
              <span class="help-block" id="idcheckresult"></span>
           </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputMobile">핸드폰</label>
           <div class="col-sm-6">
             <input class="form-control" id="inputMobile" name="mobile" type="text" placeholder="핸드폰">
           
           </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btnPwdFind" class="btn btn-primary" type="submit">비밀번호 찾기<i class="fa fa-check spaceLeft"></i></button>
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
   $("#btnPwdFind").click(function(event){                                          //btnPwdFind id를 가진 버튼을 클릭하면 다음 함수를 실행하겠다.                                     //myform id를 가진 form태그내의 내용들을 submit하겠다.
           $("#myform").prop("method", "post");                                       //myform id를 가진 form태그에 method속성을 추가하고 method값은 post로 하겠다.
          $("#myform").prop("action", "/user/pwdfind");   //myform id를 가진 form태그에 action속성을 추가하고 action값은 <c:url value="/member/pwdfind_proc.mt"/>로 하겠다.
          
   });
});


</script>


