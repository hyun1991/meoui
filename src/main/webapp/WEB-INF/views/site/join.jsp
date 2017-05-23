<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>관광지 추가를 해봅시다</title>

</head>
<body>
	<form action="/meoui/site/join" method="post" enctype="multipart/form-data">
		<div>
			<div class="form-group">
				<label>관광지 번호</label><input type="number" id="siteNo" name="siteNo" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 이름</label><input type="text" id="siteName" name="siteName" class="form-control">
			</div>
			<div class="form-group">
				<label>주차 유무</label><input type="number" id="sitePark" name="sitePark" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 전화번호</label><input type="text" id="sitePhone" name="sitePhone" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 홈페이지</label><input type="text" id="sitePhone" name="sitePhone" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 소개</label><input type="text" id="siteIntroduce" name="siteIntroduce" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 이용대상</label><input type="text" id="siteObject" name="siteObject" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 이미지</label><input type="file" name="siteImg" id="siteImg" class="form-control" placeholder="이미지 업로드 해주세요">
			</div>
			<div class="form-group">
				<label>개장시간</label><input type="text" id="siteOpenTime" name="siteOpenTime" class="form-control">
			</div>
			<div class="form-group">
				<label>폐장시간</label><input type="text" id="siteCloseTime" name="siteCloseTime" class="form-control">
			</div>
			<div class="form-group">
				<label>야간개장 유무</label><input type="text" id="siteNightOpen" name="siteNightOpen" class="form-control">
			</div>
			<div class="form-group">
				<label>야간개장 시 폐장시간</label><input type="text" id="siteNightCloseTime" name="siteNightCloseTime" class="form-control">
			</div>
			<div class="form-group">
				<label>관리자 번호</label><input type="number" id="usersNo" name="usersNo" class="form-control">
			</div>
			<div class="form-group">
				<label>지역 번호</label><input type="number" id="areaNo" name="areaNo" class="form-control">
			</div>
			<div class="form-group">
				<label>지역 이름</label><input type="text" id="areaName" name="areaName" class="form-control">
			</div>
			<div class="form-group">
				<label>상세주소</label><input type="text" id="areaDetailsAddress" name="areaDetailsAddress" class="form-control">
			</div>
			<div class="form-group">
				<label>연령대</label><input type="number" id="agegroupStandared" name="agegroupStandared" class="form-control">
			</div>
			<div class="form-group">
				<label>티켓</label><input type="number" id="TicketPrice" name="TicketPrice" class="form-control">
			</div>
			<div class="btn-group">
				<input type="submit" value="관광지 추가" id="confirmBtn" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
</html>