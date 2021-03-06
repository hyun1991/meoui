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
	color: #424242;
}

span {
	margin-right: 5px;
}

.navbar {
	background-color: white;
	border-color:white;
	margin-bottom: 0;
	font-family: 'Jeju Gothic', serif;
}

#brand {
	color: #424242;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	<nav class="navbar navbar-default text-center" id="navbar">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand navbar-left"
					href="http://106.243.194.226:5001/meoui/" id="brand">
					<img alt="알수없음" src="/meoui/images/jejulogo3.png"> </a>
			</div>
			<div class="row" style="margin-top: 100px;">
				<ul class="nav navbar-nav">
					<li class="navMenu">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="board">
						<span class="glyphicon glyphicon glyphicon-grain" style="color: green;"></span>
						관광명소 소개</a>
						<ul class="dropdown-menu">
							<li><a href="/meoui/site/list?pageNo=1">전체보기</a></li>
							<li><a href="/meoui/site/list/jeju?pageNo=1" id="#">제주시별</a></li>
							<li><a href="/meoui/site/list/seoguipo?pageNo=1" id="#">서귀포시별</a></li>
						</ul>
					</li>
				<!-- 
					<li class="navMenu"><a href="/meoui/site/list?pageNo=1"
						style="color: #424242;"><span
							class="glyphicon glyphicon glyphicon-grain" style="color: green;"></span>
							관광 명소</a></li>
							-->
					<li class="navMenu"><a href="/meoui/directions.jsp"
						style="color: #424242;"><span class="glyphicon glyphicon-road"
							style="color: blue;"></span> 길 찾기
					</a></li>
					<li class="navMenu"><a
						href="/meoui/accommodaion/list" style="color: #424242;"><span
							class="glyphicon glyphicon-home" style="color: orange;"></span>
							숙박</a></li>
							<!-- 
								<li class="navMenu"><a
						href="/meoui/accommodaion/listTest" style="color: #424242;"><span
							class="glyphicon glyphicon-home" style="color: orange;"></span>
							테스트</a></li>
							 -->
					<li class="navMenu"><a href="/meoui/membermeeting/list"
						style="color: #424242;"><span class="glyphicon glyphicon-heart"
							style="color: #f76ce4;"></span> 모임 </a></li>
					<li class="navMenu"><a href="/meoui/notice/list"
						style="color: #424242;"><span
							class="glyphicon glyphicon-bullhorn" style="color: red;"></span>
							공지사항</a></li>
							<!-- 
					<li class="navMenu"><a href="/meoui/noticeboard.jsp"
						style="color: #424242;"><span
							class="glyphicon glyphicon-eye-open" style="color: purple;"></span>
							자유게시판</a></li>
					<li class="navMenu"><a href="/meoui/test.jsp"
						style="color: #424242;"><span class="glyphicon glyphicon-eye-open"
							style="color: purple;"></span>테스트</a></li>
							 -->
					<li class="navMenu"><a href="/meoui/freeboard/list?pageNo=1"
						style="color: #424242;"><span class="glyphicon glyphicon-pencil"
							style="color: grey;"></span>자유게시판</a></li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li id="joinFm"><a href="#" data-toggle="modal" data-target="#signUpForm"
						id="signUp" style="color: #424242;">회원가입
						<span class="caret"></span></a></li>
					<li id="loginFm"><a href="#" data-toggle="modal" data-target="#signInForm"
						id="signIn" style="color: #424242;">로그인
						<span class="caret"></span></a></li>
					<li class="dropdown" id="loginCheck"><a
						class="dropdown-toggle" data-toggle="dropdown" href="#"
						style="color: #424242;">ID: <%=session.getAttribute("memberId")%><span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/meoui/member/view/<%=session.getAttribute("memberId")%>" id="menu">마이페이지</a></li>
							<li><a href="/meoui/message/list?messageReceiveId=<%=session.getAttribute("memberId") %>&pageNo=1" id="menu">쪽지함</a></li>
							<li><a href="/meoui/member/logout" id="logout">로그아웃</a></li>
						</ul></li>	
				</ul>
			</div>
		</div>
	</nav>
</body>
<script>
	$(document).ready(function() {
		var memberId= "<%=session.getAttribute("memberId")%>"
		
		if (memberId == "null")
			$("#loginCheck").hide();
		else{
			$("#loginCheck").show();
			$("#joinFm").hide();
			$("#loginFm").hide();
		}
	})
</script>
</html>