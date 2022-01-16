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
    
    <!--  아래 주석은 html5 가 지원되지 않는 브라우저의 호환성을 위해서 붙임, 삭제하면 안됨  -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
      function findZipCode(event)
      {
      
         event.preventDefault();
         //서버로 submit 막기 
         new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraRoadAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraRoadAddr !== ''){
                       extraRoadAddr = ' (' + extraRoadAddr + ')';
                   }
                   // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                   if(fullRoadAddr !== ''){
                       fullRoadAddr += extraRoadAddr;
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                   document.getElementById('base_address').value = fullRoadAddr;
                   document.getElementById('detail_address').value = data.jibunAddress;

                   // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                   if(data.autoRoadAddress) {
                       //예상되는 도로명 주소에 조합형 주소를 추가한다.
                       var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                       document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                   } else if(data.autoJibunAddress) {
                       var expJibunAddr = data.autoJibunAddress;
                       alert(expJibunAddr);
                       document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                   } else {
                       document.getElementById('guide').innerHTML = '';
                   }
               }
           }).open();
      }
      
   </script>

  </head>
  <body>
   
      
    <form name="myform" id="myform" class="form-horizontal">
         <input type="hidden" name="idcheckyn" id="idcheckyn" value="N">
         <input type="hidden" name="emailcheckyn" id="emailcheckyn" value="N">
         <input type="hidden" name="mobilecheckyn" id="mobilecheckyn" value="N">
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
           <h1>회원가입</h1>
        </div>

        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputid">아이디</label>
           <div class="col-sm-6">
               <div class="input-group">
                  <input class="form-control" id="inputId" name="userid" placeholder="아이디">
                 
                 <span class="input-group-btn">
                    <button id="btnIdCheck" class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
                 </span>
                </div>    
                <span class="help-block" id="idcheckresult"></span>
           </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" name="userpw" type="password" placeholder="비밀번호">
        <p class="help-block">영문, 숫자, 특수문자 혼합하여 8자리~20자리 이내로 입력해주세요.</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" name="username" id="inputName" type="text" placeholder="이름">
          </div>
        </div>

        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                  <input type="tel" class="form-control" name="mobile" id="inputMobile" placeholder="- 없이 입력해 주세요" />
              </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
           <div class="col-sm-6">
               <div class="input-group">
                  <input class="form-control" id="inputEmail" name="email" type="email" placeholder="이메일">
                 
                 <span class="input-group-btn">
                    <button id="btnEmailCheck" class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
                 </span>
                </div>    
                <span class="help-block" id="emailcheckresult"></span>
           </div>
        </div>
        
        
        <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
          <div class="col-sm-6">
            <div class="input-group">
              <input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호">
              <span class="input-group-btn">
                <button class="btn btn-success" type="button" id="btnFindZipcode">우편번호찾기<i class="fa fa-edit spaceLeft"></i></button>
              </span>
            </div>
           </div>
        </div>
        
         <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">기본 주소</label>
          <div class="col-sm-6">
            
              <input class="form-control" id="base_address" name="roadAddr"  type="text" placeholder="기본주소">
              
             
           <div class="col-sm-6"> 
              <span id="guide" class="help-block" style="width:500px"></span>
           </div>
           </div>
        </div>
        
         <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">상세주소</label>
          <div class="col-sm-6">
           
              <input class="form-control" id="detail_address" name="detailedAddr"  type="text" placeholder="상세주소를 입력하세요">
          </div>
        </div>
        
        
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        
          <hr>
        </div>
      </article>
</form>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/tour/js/bootstrap.js"></script>
  </body>
</html>
<script>
$(function(){

   
    $("#btnIdCheck").click(idCheck);                                                         //btnIdcheck id 를 가진 태그를 클릭하면 idcheck 함수를 호출하겠다
    $("#btnFindZipcode").click(findZipCode);                                             //btnIdcheck id 를 가진 태그를 클릭하면 findZipCode 함수를 호출하겠다
    $("#btnEmailCheck").click(emailCheck);   
    

   
    
    
    $("#inputPassword").blur(function(){
       if(!chkPwd( $.trim($('#inputPassword').val()))){
          $('#inputPassword').val('');
          return false;
        }
    })
    
 
    
    $("#myform").submit(function(event){                                                   //myform이란 아이디를 가진 form에 있는 데이터들을 submit할거야
       var mobile = $("#inputMobile").val();
       var checkNum = /[0-9]/g;
    
    
       if($("#idcheckyn").val()=="N")                                                         //만약 idcheckyn아이디를 가진 태그의 값이 "N"이면
       {
          alert("아이디 중복체크를 하십시요");                                                //alert창을 띄우고
          event.preventDefault();                                                                  //submit되는 것을 막는다.
       }
    
       if(mobile.length != 11 || mobile == "" || !checkNum.test(mobile)){
          alert("핸드폰 번호가 잘 못 됐습니다.")
          event.preventDefault();
       }
       

       if( $("#inputPassword").val()!= $("#inputPasswordCheck").val())         //만약 inputPassword아이디를 가진 태그의 값이 inputPasswordCheck의 아이디를 가진 태그의 값과 같지 않다면
       {
          alert("비밀번호와 비밀번호확인이 일치하지 않습니다");                           //alert창을 띄우고
          event.preventDefault();                                                                  //submit되는 것을 막는다.
       }

       
       if($("#inputName").val()=="")                                                            //만약 inputName아이디를 가진 태그의 값이 공백과 같으면
       {
          alert("이름을 입력하세요");                                                             //alert창을 띄우고
          event.preventDefault();                                                               //submit되는 것을 막는다.
       }                                                               //interest id를 가진 태그의 값을 temp(1|0|0|1)로 지정한다.               
       
       if($("#inputEmail").val()=="N"){
          alert("이메일을 입력하세요");
          event.preventDefault();
       }
       
       
       $("#myform").prop("method", "post");                                                //myform id를 가진 form 태그의 속성 method를 post로 지정해주고
       $("#myform").prop("action", '<c:url value="/member/register"/>');
       alert("반갑습니다! 회원가입이 완료됐습니다.")
       
    });
});

function idCheck(event)                                                                              //idCheck 함수 event객체를 사용하기위해 event를 인수로 받았다.
{
   event.preventDefault();                                                                           //서버로 submit되는것을 막는다.
   if($("#inputId").val()==""){
      alert("id를 입력해주시기 바랍니다.");
      return false;
   }
   
   $.ajax({                                                                                                //ajax 통신을 할 것이다.(페이지 이동없이 컨트롤러에서 데이터만 받아 오기 위해)
      type:"POST",
      url:"/member/idCheck",                                             //${commonURL}/member/getIdCheck.mt과 통신할 것이다.
      data:{userid:$("#inputId").val()},                                                   //url로 넘길 data는 name은 email이고 inputEmail이란 id를 가진 태그의 값이다.
      dataType:"text",                                                                                 //넘겨받을 data의 형식은 String으로 받겟다.
      success:function(result){                                                                     //통신이 성공했을 경우 넘겨받은 데이터를 어떻게 해줄 것이냐 하면
         if( result=="ID_OK")                                                                              //만약 넘겨받은 값이 OK일 경우
         {
            
            $("#idcheckresult").html("사용가능한 아이디 입니다");                        //idcheckresult id를 가진 태그의 값을 "사용가능한 아이디 입니다."로 바꾼다.
            //css바꾸는거 찾아서 글자색 파란색으로 바꾸기
            $("#idcheckresult").css({color:'blue'});                                       //idcheckresult id를 가진 태그 값의 색을 파란색으로 바꾼다.
            $("#idcheckyn").val("Y");                                                               //idcheckyn id의 값을 Y로 바꾼다.
            
            $("#inputId").attr("readonly", true);                                       //inputEmail id를 가진 태그에 속성 readonly를 추가하고 값을 true로 변경한다.
            $("#inputId").prop("readonly", true);                                       //inputEmail id를 가진 태그에 속성 readonly를 추가하고 값을 true로 변경한다.
            
         }
         else                                                                                                //아니라면
         {
            $("#idcheckresult").html("이미 사용중인 아이디 입니다");                  //idcheckresult id를 가진 태그의 값을 "이미 사용중인 아이디 입니다"로 바꾼다.
            //css바꾸는거 찾아서 글자색 빨간색으로 바꾸기
            $("#idcheckresult").css({color:'red'});                                          //idcheckresult id를 가진 태그의 색을 빨간색으로 바꾼다.
         }
      },
      error: function(){                                                                              //통신이 안됐을 경우
         alert("서버와 연결 실패");                                                                //alert창을 띄운다.
      }
      
   });
}

function emailCheck(event)                                                                              //idCheck 함수 event객체를 사용하기위해 event를 인수로 받았다.
{
   event.preventDefault();                                                                           //서버로 submit되는것을 막는다.
   if($("#inputEmail").val()==""){
      alert("Email을 입력해주시기 바랍니다.");
      return false;
   }//서버로 submit되는것을 막는다.
   
   $.ajax({                                                                                                //ajax 통신을 할 것이다.(페이지 이동없이 컨트롤러에서 데이터만 받아 오기 위해)
      type:"POST",
      url:"/member/emailCheck",                                             //${commonURL}/member/getIdCheck.mt과 통신할 것이다.
      data:{email:$("#inputEmail").val()},                                                   //url로 넘길 data는 name은 email이고 inputEmail이란 id를 가진 태그의 값이다.
      dataType:"text",                                                                                 //넘겨받을 data의 형식은 String으로 받겟다.
      success:function(result){                                                                     //통신이 성공했을 경우 넘겨받은 데이터를 어떻게 해줄 것이냐 하면
         if( result=="EMAIL_OK")                                                                              //만약 넘겨받은 값이 OK일 경우
         {
            
            $("#emailcheckresult").html("사용가능한 이메일 입니다");                        //idcheckresult id를 가진 태그의 값을 "사용가능한 아이디 입니다."로 바꾼다.
            //css바꾸는거 찾아서 글자색 파란색으로 바꾸기
            $("#emailcheckresult").css({color:'blue'});                                       //idcheckresult id를 가진 태그 값의 색을 파란색으로 바꾼다.
            $("#emailcheckyn").val("Y");                                                               //idcheckyn id의 값을 Y로 바꾼다.
            
            $("#inputEmail").attr("readonly", true);                                       //inputEmail id를 가진 태그에 속성 readonly를 추가하고 값을 true로 변경한다.
            $("#inputEmail").prop("readonly", true);                                       //inputEmail id를 가진 태그에 속성 readonly를 추가하고 값을 true로 변경한다.
            
         }
         else                                                                                                //아니라면
         {
            $("#emailcheckresult").html("이미 사용중인 이메일 입니다");                  //idcheckresult id를 가진 태그의 값을 "이미 사용중인 아이디 입니다"로 바꾼다.
            //css바꾸는거 찾아서 글자색 빨간색으로 바꾸기
            $("#emailcheckresult").css({color:'red'});                                          //idcheckresult id를 가진 태그의 색을 빨간색으로 바꾼다.
         }
      },
      error: function(){                                                                              //통신이 안됐을 경우
         alert("서버와 연결 실패");                                                                //alert창을 띄운다.
      }
      
   });
}


function chkPwd(str){
    var pw = str;
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pw==""){
       return false;
    }
    
    if(pw.length < 8 || pw.length > 20){
     alert("8자리 ~ 20자리 이내로 입력해주세요.");
     return false;
    }

    if(pw.search(/₩s/) != -1){
     alert("비밀번호는 공백업이 입력해주세요.");
     return false;
    } 
    
    if(num < 0 || eng < 0 || spe < 0 ){
     alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
     return false;
    } 
    
    return true;
}
</script>


