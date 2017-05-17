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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Navigation Bar</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.navbar-header {
	margin-left: 5%;
	margin-right: 2.5%
}

span {
	margin-right: 5px;
}

.navbar {
	font-family: 'Jeju Gothic', serif;
	#
}

#brand {
	font-family: 'Jeju Hallasan', serif;
	color: black;
}

#navbar {
	background-color:#ffff00;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	<nav class="navbar navbar-default text-center" id="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="glyphicon glyphicon-sunglasses"
					style="font-size: 24px; margin-right: 70px;"></span> <a
					class="navbar-brand navbar-left"
					href="http://localhost:8087/meoui/" id="brand">제주를 부탁해</a>
			</div>
			<div class="row">
				<ul class="nav navbar-nav">
					<li class="navMenu"><a href="/meoui/attractionlist.jsp"><span
							class="glyphicon glyphicon glyphicon-grain"></span> 관광 명소</a></li>
					<li class="navMenu"><a href="/meoui/directions.jsp"> <span
							class="glyphicon glyphicon-road"></span> 길 찾기
					</a></li>
					<li class="navMenu"><a href="/meoui/accomodationlist.jsp"><span
							class="glyphicon glyphicon-home"></span>숙박 시설</a></li>
					<li class="navMenu"><a href="/meoui/meetingboard.jsp"><span
							class="glyphicon glyphicon-pencil"></span>모임 게시판</a></li>
					<li class="navMenu"><a href="/meoui/noticeboard.jsp"
						style="margin-right: 70px;"><span
							class="glyphicon glyphicon-bullhorn"></span>공지사항</a></li>
					<li><a href="#" data-toggle="modal" data-target="#signUpForm"
						id="signUp"><span class="glyphicon glyphicon-road"></span>회원가입</a></li>
					<li><a href="#" data-toggle="modal" data-target="#signInForm"
						id="signIn">로그인</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" id="loginCheck"><%=session.getAttribute("memberId")%><span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/meoui/mypage.jsp" id="menu">마이페이지</a></li>
							<li><a href="/meoui/member/logout" id="logout">로그아웃</a></li>
							<li><a href="#" id="deleteId">회원탈퇴</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>