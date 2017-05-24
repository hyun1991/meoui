<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주를 부탁해</title>
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

nav {
	margin-bottom: 0;
}

header {
	background-image: url(/meoui/images/hareubang.jpg);
	background-size: 300 500;
	background-repeat: no-repeat;
}

#menu {
	font-family: 'Jeju Gothic', serif;
}

#text, p, header {
	color: black;
}
</style>
<body>

	<%@include file="/nav/navbar.jsp"%>
	<%@include file="index.jsp"%>
	<header> </header>
	<div class="container">
		<img src="/meoui/images/hareubang.jpg"></img>
		<hr style="border: 4px solid black; margin-bottom: 50px;">
	</div>


	<%@include file="/footer.jsp"%>
</body>
<script>
	$(window).bind('scroll', function() {
		if ($(window).scrollTop() > 50) {
			$('#menu').addClass('navbar-fixed-top');
		} else {
			$('#menu').removeClass('navbar-fixed-top');
		}
	});
</script>


</html>