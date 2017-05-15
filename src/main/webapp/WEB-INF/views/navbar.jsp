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
.navbar{
	font-family: 'Jeju Gothic', serif;
}
#logo {
	font-family: 'Jeju Hallasan', serif;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default row text-center">

		<div class="navbar-header col-md-11">
			<div class="col-md-1"></div>
			<a class="navbar-brand" href="http://localhost:8087/meoui/" id="logo">제주를
				부탁해</a>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" data-toggle="modal" data-target="#joinForm">회원가입</a></li>
				<li class="col-md-1"></li>
				<li><a href="#" data-toggle="modal" data-target="#loginForm">로그인</a></li>
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
	
	<div id="joinForm" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원가입</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="usr">아이디</label><br> <input type="text"
							class="form-control" id="usr">
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">주민번호</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">주소</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">연락처</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">이름</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">성별</label><br>
						<div class="radio">
							<label><input type="radio" name="optradio">남자</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio">여자</label>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd">계좌번호</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">직업</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default">회원 가입</button>
				</div>
			</div>
		</div>
	</div>


	<div id="loginForm" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원가입</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="usr">아이디</label><br> <input type="text"
							class="form-control" id="usr">
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<div class="form-group">
						<label for="pwd">주민번호</label><br> <input type="password"
							class="form-control" id="pwd">
					</div>
					<button type="button" class="btn btn-default">로그인</button>
					<a href="/meoui/findid.jsp" class="btn btn-default">아이디 찾기</a> <a
						href="/meoui/findpwd.jsp" class="btn btn-default">비밀번호 찾기</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default">회원 가입</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>