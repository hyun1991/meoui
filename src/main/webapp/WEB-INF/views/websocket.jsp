<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
	<div>
    	<textarea class="form-control" id="content" rows="20" cols="30"></textarea>
    	<input type="text" class="form-control" id="msg">
  	</div>
	<div align="center">
		<button type="button" class="btn btn-default" id="connect">연결</button>
		<div>
			<button type="button" class="btn btn-default" id="send">전송</button>
			<button type="button" class="btn btn-default" id="exit">종료</button>
		</div>
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
		$("#exit").on("click", function() {
			$("#connect").show();
			$("#send").hide();
			$("#exit").hide();
		})
	})
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	var wsocket;
	$(document).ready(function() {
		$("#connect").on("click", function() {
			wsocket= new WebSocket("ws://192.168.0.186:8087/web/chat");
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
	
		<div id="followquick">
	<%@include file="websocket.jsp" %>
	</div>
	
	
	
		$(document).ready(function() {
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 180) {
			 scrollTop = 180;
			}
			$("#followquick").stop();
			$("#followquick").animate( { "top" : scrollTop });
			});
	})
</script>
</html>