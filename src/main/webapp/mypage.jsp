<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
footer {
	background-color: grey;
}
</style>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="container">
		<h2>마이페이지</h2>
		<br>
		<div class="row">
			<div class="col-md-4">
				<label for="usr">아이디</label> <br> <label for="usr">이름</label>
			</div>
			<a href="#" class="btn btn-success">쪽지함</a>
		</div>
		<h3>내 여행 도우미</h3>
		<br>
		<div class="btn-group row">
			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내가 예약한 숙박업소 확인</a> <a href="#"
						class="btn btn-success">내가 짠 코스 보기</a>
				</div>
			</div>
		</div>
		<div class="form-group row">

			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내 여행 일정 보기</a> <a href="#"
						class="btn btn-success">즐겨찾기 목록</a>
				</div>
			</div>
		</div>
		<h3>내 모임 도우미</h3>
		<br>
		<div class="btn-group row">
			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내가 가입한 모임</a> <a href="#"
						class="btn btn-success">내 친구 목록 확인</a>
				</div>
			</div>
		</div>
		<div class="form-group row">

			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">접속한 회원 목록 확인</a> <a href="#"
						class="btn btn-success">즐겨찾기 목록</a>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>