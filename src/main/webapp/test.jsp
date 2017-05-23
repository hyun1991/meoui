<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/navbar.jsp"%>
	<div class="container">
		<h2>JavaScript Loops</h2>

		<div id="demo"></div>
	</div>
</body>
<script>
	var planets = [ "planet1", "planet2", "Saab", "Ford", "Fiat", "Audi" ];
	var text = "";
	var i;
	for (i = 0; i < planets.length; i++) {
		text += "<br> <img id='planet' src='/meoui/images/planets/"+ planets[i] 
		+".png' class='img-responsive' alt='" + planets[i] + "  style='width:104px; height:128px;'>";
	}
	document.getElementById("demo").innerHTML = text;
</script>
</html>