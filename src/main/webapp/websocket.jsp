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
		<textarea class="form-control col-sm-5" id="content" rows="12" readonly="readonly">
		</textarea>
		<br>
		<input type="text" id="msg">
		<button type="button" class="btn btn-default"
			id="send" onkeyup="enterkey()">전송</button>
		<input type="image" id="connect" src="/meoui/images/talk.jpg">
		<button type="button" class="btn btn-default"
			id="exit">채팅종료</button>
	</div>
</body>
<script> 
	var wsocket;
	var memberId= "<%=session.getAttribute("memberId")%>";
	var content= $("#content").val();
	$(document).ready(function() {
		$("#msg").hide();
		$("#send").hide();
		$("#exit").hide();
		$("#content").hide();
		$("#connect").on("click", function() {
			$("#content").append("채팅에 참여하였습니다"+ "\r\n");
			$("#connect").hide();
			$("#send").show();
			$("#exit").show();
			$("#msg").show();
			$("#content").show();
			wsocket = new WebSocket("ws://192.168.0.186:8087/meoui/handler1");
			wsocket.onmessage = function(event) {
				console.log(event.data)
				$("#content").append(memberId+":"+event.data + "\r\n");
				content.scrollTop= content.scrollHeight;
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
		//     엔터키를 통해 send함
   		 function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        	}
    	}
	})
</script>
</html>