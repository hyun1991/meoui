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
	<textarea id="content" rows="20" cols="40"></textarea><br>
	<input type="text" id="msg">
	<button id="send">전송</button><br>
	<button id="connect">연결</button>
	<button id="exit">종료</button>
</body>
<script>
	var wsocket;
	$(document).ready(function() {
		$("#msg").hide();
		$("#send").hide();
		$("#exite").hide();
		$("#connect").on("click", function() {
			$("#connect").hide();
			$("#send").show();
			$("#exite").show();
			$("#msg").show();
			wsocket= new WebSocket("ws://localhost:8087/meoui/handler1");
			wsocket.onmessage= function(event){
				console.log(event.data)
				$("#content").append(event.data+"\r\n");
			}
			console.log("서버 연결");
		})
		$("#exit").on("click", function() {
			$("#send").hide();
			$("#exite").hide();
			$("#msg").hider();
			$("#connect").show();
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