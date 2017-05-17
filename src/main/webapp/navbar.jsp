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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Navigation Bar</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.navbar {
	font-family: 'Jeju Gothic', serif; #
	color: #0061ff;
}

#brand {
	font-family: 'Jeju Hallasan', serif;
	color: black;
}

#signUp, #signIn, #menu {
	color: black;
}

#navbar {
	background-color: #f7ff14;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	<nav class="navbar navbar-default row text-center" id="navbar">
		<div class="navbar-header col-md-12">
			<div class="col-md-1"></div>
			<a class="navbar-brand navbar-left"
				href="http://localhost:8087/meoui/" id="brand"><p>제주를</p>
				<p>부탁해</p></a>
			<ul class="nav navbar-nav navbar-right col-md-7">
				<li><a href=""><i class="fa fa-facebook"
						style="font-size: 24px"></i></a></li>
				<li><a href=""><i class="fa fa-twitter"
						style="font-size: 24px"></i></a></li>
				<li><a href=""><i class="fa fa-instagram"
						style="font-size: 24px"></i></a></li>
				<li class="col-md-4"></li>
				<li><a href="#" data-toggle="modal" data-target="#signUpForm"
					id="signUp"></a>회원가입</li>
				<li id="loginCheck"><%=session.getAttribute("memberId")%></li>
				<li class="col-md-1"></li>
				<li><a href="#" data-toggle="modal" data-target="#signInForm"
					id="signIn">로그인</a></li>
				<li><a href="/meoui/member/logout" id="logoutBtn">로그아웃</a></li>
				<li><a href="#" data-toggle="modal" data-target="#signInForm"
					id="deleteBtn">회원탈퇴</a></li>
			</ul>

		</div>
		<ul class="nav navbar-nav col-md-12">
			<li class="col-md-2"><a href="/meoui/attractionlist.jsp"
				id="menu">제주 관광명소 소개</a></li>
			<li class="col-md-2"><a href="/meoui/directions.jsp" id="menu">길
					찾기</a></li>
			<li class="col-md-2"><a href="/meoui/accomodationlist.jsp"
				id="menu">숙박 시설</a></li>
			<li class="col-md-2"><a href="/meoui/meetingboard.jsp" id="menu">모임
					게시판</a></li>
			<li class="col-md-2"><a href="/meoui/noticeboard.jsp" id="menu">공지사항</a></li>
			<li class="col-md-2"><a href="/meoui/mypage.jsp" id="menu">마이페이지</a></li>
		</ul>
	</nav>
</body>
<script>
	$(document).ready(function() {
		var userId='<%=session.getAttribute("memberId")%>';
		if (userId == "null") {
		$("#loginCheck").remove();
		$("#logoutBtn").remove();
		$("#deleteBtn").remove();
		}
		else{
			$("#signUp").remove();
			$("#singIn").remove();
		}
	})
	$(document).ready(function() {
		$("#deleteBtn").on("click", function() {
			$.ajax({
				type : "post",
				url : "/meoui/member/delete",
				success : function(result) {
					console.log(result)
					if (result == "success") {
						alert("회원탈퇴 되었습니다.")
						$("#loginCheck").hide();
						$("#logoutBtn").hide();
						$("#deleteBtn").hide();
						$("#joinMenu").show();
						$("#loginMenu").show();
					}
				}
			})
		})
	})
</script>
</html>