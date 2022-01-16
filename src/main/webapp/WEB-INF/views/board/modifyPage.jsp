<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	.fileDrop {
		width: 100%;
		height: 100px;
		border: 1px dotted gray;
		background-color: lightslategrey;
		margin: auto;
	}
</style>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>

<form role="form" method="post">
	
	<input type="hidden" name="page" value="${cri.page }" />
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
	<input type="hidden" name="searchType" value="${cri.searchType }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	
	<div class="box-body" >
		<div class="form-group" >
			<label for="exampleInputEmail1">BNO</label>
			<input type="text" name="bno" class="form-control" value="${boardVO.bno }" readonly="readonly" />
		</div>
		
		<div class="form-group" >
			<label for="exampleInputEmail1">TITLE</label>
			<input type="text" name="title" class="form-control" value="${boardVO.title }" />
		</div>
		
		<div class="form-group" >
			<label for="exampleInputPassword1">Content</label>
			<textarea name="content" class="form-control" rows="3" >${boardVO.content }</textarea>
		</div>
		
		<div class="form-group" >
			<label for="exampleInputEmail1">Writer</label>
			<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">File Drop Here</label>
			<div class="fileDrop"></div>
		</div>
	</div>
	
	<div class="box-footer">
	
		<div>
			<hr>
		</div>
		
		<ul class="mailbox-attachments clearfix uploadedList"></ul>	
		
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>
</form>

<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src='{{fullName}}'>
		<img src="{{imgsrc}}" alt="Attachment">
		<div class="aaa">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		</div>
		<a href="{{fullName}}" class="delbtn">삭제</a>
	</li>
</script>

<script>
	var template = Handlebars.compile($("#templateAttach").html());
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
	
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url: "/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data) {
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	});
</script>

<script>
		var formObj = $("form[role='form']");
		
		/* btnSave handler */
		$(".btn-primary").on("click", function(event) {
			if(confirm("수정하시겠습니까?")) {
				//formObj.submit();
				event.preventDefault();
				
				for(var i=0; i<deletedFileName.length; i++) {
					$.post("/deleteFile", {fileName:deletedFileName[i]}, function() {
						
					});
				}
				
				//var that = $(this);
				
				var str = "";
				
				$(".uploadedList .delbtn").each(function(index) {
					str += "<input type='hidden' name=files[" + index + "]' value='" + $(this).attr("href") + "'>";
				});
				
				formObj.append(str);
				
				formObj.submit();
			} else {
				return false;
			}
		});
		
		/* btnCancel handler */
		$(".btn-warning").on("click", function(event) {
			event.preventDefault();
			self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
		var index = 0;
		var deletedFileName = [];
		
		/* file-delbtn handler */
		$(document).on("click", ".delbtn", function(event) {
			event.preventDefault();
			//var temp = $(this).attr("href");
			var temp = $(this).val();
			
			deletedFileName[index] = temp;
			index++;
			
			$(this).closest('li').remove();
			
			/* $.post("/deleteFile", {fileName:temp}, function() {
				
			}); */
			
		});
</script>

<script>
	/* get Attached Files List */
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html()); //templateAttach 코드 컴파일
	
	$.getJSON("/board/getAttach/" + bno, function(list) {
		
		$.each(list, function(index, entry) {
			/* entry example: /2018/05/31/61588d5e-c754-4a20-92ec-6705c50aec54_click_cal.js */
			
			var fileInfo = getFileInfo(entry); //fileInfo: 파일 명, 주소 등을 갖고있는 객체
			var html = template(fileInfo);	//templateAttach로 부터 fileInfo 객체를 넘겨서 완성된 html코드를 받아옴 
			
			$(".uploadedList").append(html);
		});
		
	});
</script>

<script>
 	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event) {
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)) {
			event.preventDefault();
			
			window.open(fileLink, '_blank', 'width=500, height=500');
			/* var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
			
			$(".popup").show('slow');
			
			imgTag.addClass("show"); */
		} 
	});
	
	/* $("#popup_img").on("click", function() {
		$(".popup").hide("slow");
	});  */
</script>