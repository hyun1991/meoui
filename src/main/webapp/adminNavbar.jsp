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
	
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" type="text/css" href="css/hanjoon.css">
	<link rel="stylesheet" type="text/css" href="css/sejin.css">
<title>Navigation Bar</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
.navbar{
	font-family: 'Jeju Gothic', serif;
}
#brand {
	font-family: 'Jeju Hallasan', serif;
}
</style>
</head>
<style>
#colornavbar{
	background-color: #c7ed52;
}
#hob:hover {
    background-color: #d6fa45;
}
	
}
</style>
<body>
	
	<%@include file="/signInAndUp.jsp"%>
	
	<nav class="navbar navbar-default row text-center">
		<div class="navbar-header col-md-12">
			<div class="col-md-1"></div>
			<a class="navbar-brand navbar-left" href="http://localhost:8087/meoui/" id="brand">제주를
				부탁해</a>
			<ul class="nav navbar-nav navbar-right col-md-3">
				<li><a href="#" data-toggle="modal" data-target="#signUpForm">회원가입</a></li>
				<li class="col-md-1"></li>
				<li><a href="#" data-toggle="modal" data-target="#signInForm">로그인</a></li>
			</ul>
		</div>
		<ul class="nav navbar-nav col-md-12">
			<li class="col-md-2"><a href="/meoui/admin_manage.jsp">회원관리</a></li>
			<li class="col-md-2"><a href="/meoui/directions.jsp">숙박관리</a></li>
			<li class="col-md-2"><a href="/meoui/accomodationlist.jsp">관광정보관리</a></li>
			<li class="col-md-2"><a href="/meoui/meetingboard.jsp">예약관리</a></li>
			<li class="col-md-2"><a href="/meoui/noticeboard.jsp">게시판관리</a></li>
			<li class="col-md-2"><a href="/meoui/mypage.jsp">모임/쪽지함관리</a></li>
		</ul>
	</nav>

	
</body>
</html>