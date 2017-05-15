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
<title>Navigation Bar</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.navbar {
	font-family: 'Jeju Gothic', serif;
}

#brand {
	font-family: 'Jeju Hallasan', serif;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	<div class="container-fluid">
		<nav class="navbar navbar-default row text-center">
			<div class="navbar-header col-md-12">
				<div class="col-md-1"></div>
				<a class="navbar-brand navbar-left"
					href="http://localhost:8087/meoui/" id="brand">제주를 부탁해</a>
				<ul class="nav navbar-nav navbar-right col-md-3">
					<li><a href="#" data-toggle="modal" data-target="#signUpForm">회원가입</a></li>
					<li class="col-md-1"></li>
					<li><a href="#" data-toggle="modal" data-target="#signInForm">로그인</a></li>
				</ul>
			</div>
			<ul class="nav navbar-nav col-md-12">
				<li class="col-md-2"><a href="/meoui/attractionlist.jsp">제주
						관광명소 소개</a></li>
				<li class="col-md-2"><a href="/meoui/directions.jsp">길 찾기</a></li>
				<li class="col-md-2"><a href="/meoui/accomodationlist.jsp">숙박
						시설</a></li>
				<li class="col-md-2"><a href="/meoui/meetingboard.jsp">모임
						게시판</a></li>
				<li class="col-md-2"><a href="/meoui/noticeboard.jsp">공지사항</a></li>
				<li class="col-md-2"><a href="/meoui/mypage.jsp">마이페이지</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>