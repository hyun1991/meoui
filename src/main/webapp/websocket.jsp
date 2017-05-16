<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="form-group">
    	<textarea class="form-control" id="content" rows="20" cols="30"></textarea>
  	</div>
  	<div class="form-group">
		<label for="usr">메세지</label><br> <input type="text" class="form-control" id="msg">
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" id="connect">연결</button>
		<button type="button" class="btn btn-default" id="send">전송</button>
		<button type="button" class="btn btn-default" id="exit">종료</button>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#send").hide();
		$("#exit").hide();
		$("#connect").on("click", function() {
			$("#send").show();
			$("#exit").show();
			$("#connect").hide();
		})
	})
</script>
<script>
	var wsocket;
	$(document).ready(function() {
		$("#connect").on("click", function() {
			wsocket= new WebSocket("ws://localhost:8087/web/chat");
			wsocket.onmessage= function(event){
				console.log(event.data)
				$("#content").append(event.data+"\r\n");
			}
			console.log("서버 연결");
		})
		$("#exit").on("click", function() {
			wsocket.close();
			console.log("연결 종료");
		})
		$("#send").on("click", function() {
			wsocket.send($("#msg").val());
			$("#msg").val("");
		})
	})
</script>
</html>