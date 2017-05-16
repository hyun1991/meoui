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
#navbar {
	background-color: #f2f5f7;
}
</style>
</head>
<body>
	<%@include file="/signInAndUp.jsp"%>
	
		<nav class="navbar navbar-default row text-center" id="navbar">
			<div class="navbar-header col-md-12">
				<div class="col-md-1"></div>
				<a class="navbar-brand navbar-left"
					href="http://localhost:8087/meoui/" id="brand">제주를 부탁해</a>
				<ul class="nav navbar-nav navbar-right col-md-7">
				<li><a href=""><img src="icons/facebook_circle.svg"
						style="width: 25px; height: 25px;" /></a></li>
				<li><a href=""><img src="icons/twitter_circle.svg"
						style="width: 25px; height: 25px;" /></a></li>
				<li><a href=""><img src="icons/instagram-round-flat.svg"
						style="width: 25px; height: 25px;" /></a></li>
					<li class="pull-right" id="joinMenu"><a href="#" data-toggle="modal" data-target="#signUpForm">회원가입</a></li>
					<li class="col-md-1"></li>
					<li class="pull-right" id="loginMenu"><a href="#" data-toggle="modal" data-target="#signInForm">로그인</a></li>
					<li id="loginCheck"><%=session.getAttribute("memberId") %>님 환영합니다</li>
					<li>
						<a href="/meoui/member/logout"><button type="button" class="btn btn-default" id="logoutBtn">로그아웃</button></a>
						<button type="button" class="btn btn-default" id="deleteBtn">회원탈퇴</button>
					</li>
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
</body>
<script>
	$(document).ready(function() {
		var userId="<%=session.getAttribute("memberId")%>"
		$("#loginCheck").hide();
		$("#logoutBtn").hide();
		$("#deleteBtn").hide();
		if(userId=="null"){
			$("#joinMenu").show();
			$("#loginMenu").show();
		}
		else{
			$("#joinMenu").hide();
			$("#loginMenu").hide();
			$("#loginCheck").show();
			$("#logoutBtn").show();
			$("#deleteBtn").show();
		}
	})
	$(document).ready(function(){
		$("#deleteBtn").on("click", function() {
			$.ajax({
				type:"post",
				url: "/meoui/member/delete",
				success: function(result){
					console.log(result)
					if(result=="success"){
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