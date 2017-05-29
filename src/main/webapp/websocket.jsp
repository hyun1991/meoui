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
	<div class="col-xs-4">
		<textarea class="form-control col-sm-5" rows="20" id="content" readonly="readonly">
		</textarea>
		<br>
			<input type="text" size="37" id="msg">
		<button type="button" class="w3-button w3-block w3-white w3-border"
			id="send">전송</button>
		<button type="button" class="w3-button w3-block w3-white w3-border"
			id="connect">채팅연결</button>
		<button type="button" class="w3-button w3-block w3-white w3-border"
			id="exit">채팅종료</button>
	</div>
</body>
<script>
	var wsocket;
	$(document).ready(function() {
		$("#msg").hide();
		$("#send").hide();
		$("#exit").hide();
		$("#content").hide();
		$("#connect").on("click", function() {
			$("#connect").hide();
			$("#send").show();
			$("#exit").show();
			$("#msg").show();
			$("#content").show();
			wsocket = new WebSocket("ws://192.168.0.186:8087/meoui/handler1");
			wsocket.onmessage = function(event) {
				console.log(event.data)
				$("#content").append(event.data + "\r\n");
			}
			console.log("서버 연결");
		})
		$("#exit").on("click", function() {
			$("#send").hide();
			$("#exit").hide();
			$("#msg").hide();
			$("#content").hide();
			$("#connect").show();
			$("#content").html("").val()
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