<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<h1>객실 추가페이지</h1>
	<hr>
	<form action="/meoui/manage/room/join" method="post" enctype="multipart/form-data">
		<div>
			<div class="form-group">
				<label>객실종류명</label><input type="text" id="roomName" name="roomName" class="form-control">
			</div>
			<div class="form-group">
				<label>객실예약금액</label><input type="number" name="roomPrice" id="roomPrice" class="form-control"
				min="1" max="100000000">
			</div>
			<div class="form-group">
				<label>숙박가능인원</label><input type="number" name="roomUseNumber" id="roomUseNumber" class="form-control"
				min="1" max="100000000">
			</div>
			<div class="form-group">
				<label>객실이미지 파일명</label><input type="file" name="img" id="img" class="form-control">
			</div>
			<br>
			<div class="btn-group">
				<input type="submit" value="객실정보 추가" id="confirmBtn" class="btn btn-primary">
				<a href="/meoui/manage/home"><input type="button" value="돌아가기" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	</form>
</body>
</html>