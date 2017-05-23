<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 추가페이지</title>
</head>
<body>
	<%@include file="/nav/ownernav.jsp" %>
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
				<label>객실이미지 파일1</label><input type="file" name="img" id="img" class="form-control" placeholder="이미지 업로드 해주세요">
			</div>
			<div class="form-group">
				<label>객실이미지 파일2</label><input type="file" name="img2" id="img2" class="form-control" placeholder="이미지 업로드 해주세요">
			</div>
			<div class="form-group">
				<label>객실이미지 파일3</label><input type="file" name="img3" id="img3" class="form-control" placeholder="이미지 업로드 해주세요">
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