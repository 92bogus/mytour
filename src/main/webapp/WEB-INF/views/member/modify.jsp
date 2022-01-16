<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원정보 수정</title>

<%@include file="../include/newHeader.jsp" %>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h1>회원정보 수정</h1>
		</div>
		
		<form name="myform" id="myform" class="form-horizontal">
			<input type="hidden" name="idcheckyn" id="idcheckyn" value="N">
			<input type="hidden" name="emailcheckyn" id="emailcheckyn" value="N">
			<input type="hidden" name="mobilecheckyn" id="mobilecheckyn" value="N">
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputid">아이디</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="inputId" name="userid" value="${memberVO.userid }" readonly>
					</div>    
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPassword">현재 비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPassword_now" type="password" placeholder="현재 비밀번호">
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
					<input type="text" class="form-control" id="inputName" name="username" value="${memberVO.username }" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
				<div class="col-sm-6">
					<input type="tel" class="form-control" name="mobile" id="inputMobile" value="${memberVO.mobile }" />
				</div>
			</div>
			      
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="inputEmail" name="email" type="email" value="${memberVO.email }" readonly />
					</div>    
				</div>
			</div>
			      
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호" value="${memberVO.zipcode }">
						<span class="input-group-btn">
							<button class="btn btn-success" type="button" id="btnFindZipcode">우편번호찾기<i class="fa fa-edit spaceLeft"></i></button>
						</span>
					</div>
				</div>
			</div>
			      
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumberCheck">기본 주소</label>
				<div class="col-sm-6">  
					<input class="form-control" id="base_address" name="roadAddr"  type="text" placeholder="기본주소" value="${memberVO.roadAddr }">
					<div class="col-sm-6"> 
						<span id="guide" class="help-block" style="width:500px"></span>
					</div>
				</div>
			</div>
			      
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumberCheck">상세주소</label>
				<div class="col-sm-6">   
					<input class="form-control" id="detail_address" name="detailedAddr"  type="text" placeholder="상세주소를 입력하세요" value="${memberVO.detailedAddr }">
				</div>
			</div>
			 
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
					<button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
				</div>
			</div>
		</form>
	</div>
</article>
<hr>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/tour/js/bootstrap.js"></script>

</body>
</html>
<script>
$(document).ready(function() {
	$("#btnFindZipcode").click(findZipCode);                                             
	
	$("#inputPassword").blur(function() {
		if(!chkPwd($.trim($('#inputPassword').val()))) {
			$('#inputPassword').val('');
			return false;
		}
	});
   
    $("#myform").submit(function(event) {                                                   
    	event.preventDefault();
    	
    	$.ajax({
    		url: ""
    	});
    	
    	var that = $(this);
        that.attr("method", "post");                                                
	    that.attr("action", "/member/modify");
    	
    	var mobile = $("#inputMobile").val();
	    var checkNum = /[0-9]/g;
	 
	    if(mobile.length != 11 || mobile == "" || !checkNum.test(mobile)) {
	       	alert("핸드폰 번호가 잘 못 됐습니다.")
	       	return false;
	    }
	
	    if($("#inputPassword").val() != $("#inputPasswordCheck").val()) {
	       	alert("비밀번호와 비밀번호확인이 일치하지 않습니다");                           
	    	return false;                                                             
	    }                                                              
	
	    if(confirm("수정하시겠습니까?")) {
	    	that.get(0).submit();
	    }
       
    });
});

function chkPwd(str) {
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw == "") {
		return false;
	}
	
	if(pw.length<8 || pw.length>20) {
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		return false;
	}
	
	if(pw.search(/₩s/) != -1) {
		alert("비밀번호는 공백업이 입력해주세요.");
		return false;
	} 
	
	if(num<0 || eng<0 || spe<0) {
		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		return false;
	} 
	
	return true;
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function findZipCode(event) {
	event.preventDefault();
	
	new daum.Postcode({
	     oncomplete: function(data) {
	         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	         // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	         var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	         var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	             extraRoadAddr += data.bname;
	         }
	         // 건물명이 있고, 공동주택일 경우 추가한다.
	         if(data.buildingName !== '' && data.apartment === 'Y') {
	            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	         }
	         // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	         if(extraRoadAddr !== '') {
	             extraRoadAddr = ' (' + extraRoadAddr + ')';
	         }
	         // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	         if(fullRoadAddr !== '') {
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


