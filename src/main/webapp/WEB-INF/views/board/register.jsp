<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.ckeditor.com/ckeditor5/10.1.0/classic/ckeditor.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript" src="/resources/js/upload.js"></script>

</head>
<body>
<%@ include file="../include/newHeader.jsp" %>
<%@ include file="../include/tourHeader.jsp" %>
<%@ include file="../include/mainmenu.jsp" %>
<%@ include file="../include/breadCromb.jsp" %>
<div class="rapid-section section_50">
	<div class="container">
		<form role="form" method="post" id="registerForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목: </label>
				<input type="text" id="title" name="title" class="form-control" placeholder="Enter Title" />
			</div>
			<div class="form-group">
				<label for="writer">작성자: </label>
				<input type="text" name="writer" class="form-control" value="${userVO.userid }" readonly />
			</div>
			<div class="form-group">
				<label for="editor">내용: </label>
				<textarea id="editor" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="ipAddr">ip주소: </label>
				<input type="text" id="ipAddr" name="ipAddr" class="form-control" value="${userVO.ipAddr }" readonly />
			</div>
			<hr>
			
			<button type="submit" class="btn btn-primary">작성</button>
			<button type="submit" class="btn btn-warning">취소</button>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>

<script>
	$(document).ready(function() {
		$("#registerForm").submit(function(event) {
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			
			$(".image img").each(function(index) {
				str += "<input type='hidden' name=files[" + index + "]' value='" + $(this).attr("src") + "'>";
			});
			
			that.append(str);
			
			that.get(0).submit();
		}); 
		
		$(".btn-warning").on("click", function(event) {
			event.preventDefault();
			self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
		$(document).on("click", "#editor", function(event) {
			console.log("dd");
			/* window.open($(this).attr("src"), '_blank', 'width=500, height=500'); */
		});
	});
</script>

<script>

</script>

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
		console.log( editor );
	} )
	.catch( error => {
		console.error( error );
	} );
</script>