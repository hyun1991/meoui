<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/meoui/js/packed.js"></script>
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>document</title>
<style>
@keyframes slidy {
0% { left: 0%; }
20% { left: 0%; }
25% { left: -100%; }
45% { left: -100%; }
50% { left: -200%; }
70% { left: -200%; }
75% { left: -300%; }
95% { left: -300%; }
100% { left: -400%; }
}
body { margin: 0; }
div#slider { overflow: hidden; }
div#slider figure img { width: 20%;  float: left; }
div#slider figure {
position: relative;
width: 500%;
height:50%;
margin: 0;
top:0;
left: 0;
text-align: left;
font-size: 0;
-webkit-animation: 20s slidy ease-in-out infinite;
animation: 20s slidy ease-in-out infinite;
}
</style>
</head>
<body>
<div id="slider">
	<figure>
	<img src="/meoui/images/hanra.jpg" alt="">
	<img src="/meoui/images/hanra.jpg" alt="">
	<img src="/meoui/images/hanra.jpg" alt="">
	<img src="/meoui/images/hanra.jpg" alt="">
	<img src="/meoui/images/hanra.jpg" alt="">
	</figure>
	</div>
</body>
</html>