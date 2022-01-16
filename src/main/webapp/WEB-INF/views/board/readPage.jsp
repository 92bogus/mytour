<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.ckeditor.com/ckeditor5/10.1.0/classic/ckeditor.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
.right {
	float: right;
}
</style>
</head>
<body>
<%@ include file="../include/newHeader.jsp" %>
<%@ include file="../include/tourHeader.jsp" %>
<%@ include file="../include/mainmenu.jsp" %>
<%@ include file="../include/breadCromb.jsp" %>

<form role="form" action="modifyPage" method="post">
	<input type="hidden" name="bno" value="${boardVO.bno }" />
	<input type="hidden" name="page" value="${cri.page }" />
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
	<input type="hidden" name="searchType" value="${cri.searchType }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
</form>

<section class="rapid-section section_50">
	<div class="container">
		<div class="form-group">
			<label for="title">제목: </label>
			<input type="text" id="title" name="title" class="form-control" value="${boardVO.title }" readonly/>
		</div>
		<div class="form-group">
			<label for="writer">작성자: </label>
			<input type="text" id="writer" name="writer" class="form-control" value="${boardVO.writer }" readonly/>
		</div>
		<div class="form-group">
			<label for="editor">내용: </label>
			<textarea name="content" id="editor">${boardVO.content }</textarea>
		</div>
	
		
		<c:if test="${userVO.userid == boardVO.writer}">
			<button type="submit" class="btn btn-warning modifyBtn">수정</button>
			<button type="submit" class="btn btn-danger removeBtn">삭제</button>
		</c:if>
			<button type="submit" class="btn btn-primary goListBtn">목록으로</button>	
		
		<hr>
		
		<ul class="timeline">
			<li id="repliesDiv"> 
				<font color="red">댓글&nbsp;&nbsp;<small id="replycntSmall"></small></font>
				&nbsp;<font color="gray">|</font>&nbsp;&nbsp;조회수<font color="black"><small id="viewcntSmall">${boardVO.viewcnt }</small></font>
			</li>
		</ul>
		
		<h3>댓글 추가하기</h3>
			
		<c:if test="${not empty userVO }">
		<div class="form-group">
			<label for="newReplyWriter">작성자: </label>
			<input type="text" class="form-control" id="newReplyWriter" value="${userVO.userid }" readonly />
		</div>
		
		<div class="form-group">
			<label for="newReplyText">내용: </label>
			<input type="text" class="form-control" placeholder="Reply Text" id="newReplyText">
		</div>
			<button type="submit" class="btn btn-primary" id="replyAddBtn">댓글 달기</button>
		</c:if>
		
		<c:if test="${empty userVO }">
			<p>[로그인 후 이용가능합니다]</p>
		</c:if>
		
		<div>
			<ul id="pagination"></ul>
		</div>
		
	</div>
			
</section>

<!-- The Modal S-->
<div class="modal fade" id="modifyModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
		   
		   	<input type="hidden" id="replyRno" />
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">댓글 수정&삭제하기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div> 
			
			<!-- Modal body -->
			<div class="modal-body">
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-default" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" id="replyCloseBtn">닫기</button>
			</div>
		  
		</div>
	</div>
</div>
<!-- The Modal E -->

<%@ include file="../include/footer.jsp" %>

</body>
</html>

<!-- 게시물 버튼 핸들러 -->
<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$(".modifyBtn").on("click", function(event) {
		event.preventDefault();
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".removeBtn").on("click", function(event) {
		event.preventDefault();
		
		if(confirm("삭제하시겠습니까?")) {
			var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g, "");
			
			if(replyCnt > 0) {
				alert('댓글이 달린 게시물을 삭제할 수 없습니다.');
				return;
			}
			
			var arr = [];
			
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});
			
			if(arr.length > 0) {
				$.post("/deleteAllFiles", {files:arr}, function() {
					
				})
			}
			
			formObj.attr("action", "/board/removePage"); //POST 방식
			formObj.submit();
		} else {
			return false;
		}
		
	});
	
	$(".goListBtn").on("click", function(event) {
		event.preventDefault();
		formObj.attr("method", "get");
		formObj.attr("action", "/board/list");
		formObj.submit();
	});
	
});

</script>

<!-- upload.js -->
<script type="text/javascript" src="/resources/js/upload.js"></script>

<!-- handlebars.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>

<!-- 파일첨부 소스 -->
<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src='{{fullName}}'>
		<img src="{{imgsrc}}" alt="Attachment">
		<div class="aaa">
			<a href="{{getLink}}">{{fileName}}</a>
		</div>
	</li>
</script>

<!-- 파일첨부 클릭 핸들러1 -->
<script>
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html()); //templateAttach 코드 컴파일
	
	$.getJSON("/board/getAttach/" + bno, function(list) {
		
		$.each(list, function(index, entry) {
			/* entry example: /2018/05/31/61588d5e-c754-4a20-92ec-6705c50aec54_click_cal.js */
			console.log("entry: " + entry);
			var fileInfo = getFileInfo(entry); //fileInfo: 파일 명, 주소 등을 갖고있는 객체
			var html = template(fileInfo);	//templateAttach로 부터 fileInfo 객체를 넘겨서 완성된 html코드를 받아옴 
			
			$(".uploadedList").append(html);
			
		});
		
	});
</script>

<!-- 파일첨부 클릭 핸들러2 -->
<script>
 	$(".uploadedList").on("click", ".aaa a", function(event) {
		var fileLink = $(this).attr("href");
		
		 if(checkImageType(fileLink)) {
			event.preventDefault();
			
			window.open(fileLink, '_blank', 'width=500, height=500');
		} 
	});

</script>

<!-- 댓글 소스 -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
			<div>
				<span>{{replyer}} </span>
				<div class="right">
					{{#eqReplyer replyer}}
						<font size="2" color="gray"><a href="#" data-toggle="modal" data-target="#modifyModal">수정 | 삭제</a></font>	
					{{/eqReplyer}}
				</div>
				<font color="gray">
					<span>
						{{prettifyDate regdate}}
					</span>
				</font>
				<div class="timeline-body">{{replytext}}</div>
			</div>
			<hr>
		</li>
	{{/each}}
</script>

<script>
	
/* Handlebars helper 등록 */
	
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date =dateObj.getDate();
	
	return year + "/" + month + "/" + date;
});

Handlebars.registerHelper("eqReplyer", function(replyer, block) {
	var accum = "";
	if(replyer == "${userVO.userid}") {
		accum = block.fn();
	}
	
	return accum;
});

/* 댓글 출력 */

function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#repliesDiv"), $("#template"));
		printPaging(data.pageMaker, $(".pagination"));
		
		$("#modifyModal").modal("hide");
		$("#replycntSmall").html(data.pageMaker.totalCount);
	});
}

var printData = function(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}	

var printPaging = function(pageMaker, target) {
	
	var str = "";
	
	if(pageMaker.prev) {
		str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'>&laquo;</a></li>";
	}
	
	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
		var strClass = pageMaker.cri.page == i? 'active' : '';
		str += "<li class='page-item " + strClass + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
	}
	
	if(pageMaker.next) {
		str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'>&raquo;</a></li>";
	}
	
	target.html(str);
}
	
</script>
	
<script>
var replyPage = 1;

getPage("/replies/" + bno + "/1");

$(".pagination").on("click", "li a", function(event) {
	event.preventDefault();
	replyPage = $(this).attr("href");
	getPage("/replies/" + bno + "/" + replyPage);
});

$("#replyAddBtn").on("click", function() {
	var replyObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	
	var replyer = replyObj.val();
	var replytext = replytextObj.val();
	
	$.ajax({
		type: "post",
		url: "/replies/",
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "post"
		},
		dataType: "text",
		data: JSON.stringify({
			bno: bno, replyer: replyer, replytext: replytext
		}),
		success: function(result) {
			if(result == "SUCCESS") {
				alert("등록 되었습니다.");
				replyPage = 1;
				getPage("/replies/" + bno + "/" + replyPage);
				replytextObj.val("");
			}
		},
		error: function() {
			alert("서버와 통신이 원활하지 않습니다.");
		}
	});
});
</script>

<!-- 댓글 클릭 이벤트 처리 -->
<script>
$(".timeline").on("click", ".replyLi", function(event) {
	var reply = $(this);
	
	$("#replytext").val(reply.find(".timeline-body").text());
	$("#replyRno").val(reply.attr("data-rno"));
});

</script>

<!-- 수정과 삭제의 처리 -->
<script>
$("#replyModBtn").on("click", function() {
	var rno = $("#replyRno").val();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type: "put",
		url: "/replies/" + rno,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "put"
		},
		data: JSON.stringify({replytext: replytext}),
		dataType: "text",
		success: function(result) {
			console.log("result: " + result);
			if(result == "SUCCESS") {
				alert("수정되었습니다.");
				getPage("/replies/" + bno + "/" + replyPage);
			}
		}
	});
});

/* 댓글 삭제버튼 핸들러 */
$("#replyDelBtn").on("click", function() {
	var rno = $("#replyRno").val();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type: "delete",
		url: "/replies/" + rno,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "DELETE"
		},
		dataType: "text",
		success: function(result) {
			if(result == "SUCCESS") {
				alert("삭제 되었습니다.");
				getPage("/replies/" + bno + "/" + replyPage);
			}
		},
		error: function() {
			alert("서버와 통신이 원활하지 않습니다.");
		}
	});
});
</script>

<!-- CKEditor5 -->
<script>
ClassicEditor
	.create( document.querySelector( '#editor' ), {
       ckfinder: {
         uploadUrl: '/uploadAjax'
       },
       image: {
           // You need to configure the image toolbar, too, so it uses the new style buttons.
           toolbar: [ 'imageTextAlternative', '|', 'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight', 'imageStyle:full' ],
           styles: [
               // This option is equal to a situation where no style is applied.
               'full',
               // This represents an image aligned to the left.
               'alignLeft',
               // This represents an image aligned to the right.
               'alignRight',
               // This represents an image aligned to the center.
               'alignCenter'
           ]
       }
     } )
     
	.then( editor => {
		editor.isReadOnly = 'true';
		console.log( editor );
	} )
	.catch( error => {
		console.error( error );
	} );

</script>