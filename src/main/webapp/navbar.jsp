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
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.navbar-header {
	margin-left: 5%;
	margin-right: 2.5%;
	color: black;
}

span {
	margin-right: 5px;
}

.navbar {
	background-color: white;
	margin-bottom: 0;
	font-family: 'Jeju Gothic', serif;
}

#brand {
	color: black;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	<nav class="navbar navbar-default text-center" id="navbar">
		<div class="container">
			<div class="navbar-header">
				<span class="glyphicon glyphicon-sunglasses"
					style="font-size: 24px; margin-right: 70px;"></span> <a
					class="navbar-brand navbar-left"
					href="http://localhost:8087/meoui/" id="brand">제주를 부탁해</a>
			</div>
			<div class="row">
				<ul class="nav navbar-nav">
					<li class="navMenu"><a href="/meoui/attractionlist.jsp"
						style="color: black;"><span
							class="glyphicon glyphicon glyphicon-grain" style="color: green;"></span>
							관광 명소</a></li>
					<li class="navMenu"><a href="/meoui/directions.jsp"
						style="color: black;"> <span class="glyphicon glyphicon-road"
							style="color: blue;"></span> 길 찾기
					</a></li>
					<li class="navMenu"><a href="/meoui/accommodaion/list?pageNo=1"
						style="color: black;"><span class="glyphicon glyphicon-home"
							style="color: orange;"></span> 숙박 시설</a></li>
					<li class="navMenu"><a href="/meoui/meetingboard.jsp"
						style="color: black;"><span class="glyphicon glyphicon-heart"
							style="color: #f76ce4;"></span> 모임 </a></li>
					<li class="navMenu"><a href="/meoui/noticeboard.jsp"
						style="color: black;"><span
							class="glyphicon glyphicon-bullhorn" style="color: red;"></span>
							공지사항</a></li>
					<li class="navMenu"><a href="/meoui/noticeboard.jsp"
						style="color: black;"><span
							class="glyphicon glyphicon-pencil" style="color: purple;"></span>
							게시판</a></li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li><a href="#" data-toggle="modal" data-target="#signUpForm"
						id="signUp" style="color: black;">회원가입</a></li>
					<li><a href="#" data-toggle="modal" data-target="#signInForm"
						id="signIn" style="color: black;">로그인</a></li>
					<li class="dropdown" id="loginCheck"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" style="color: black;">
						<%=session.getAttribute("memberId")%><span
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
<script>
	$(document).ready(function() {
		var memberId= "<%=session.getAttribute("memberId")%>"
		if(memberId=="null")
			$("#loginCheck").hide();
		else
			$("#loginCheck").show();
	})
</script>
</html>