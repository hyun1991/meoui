<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<%@include file="/nav/adminnav.jsp" %>
	<h1>관광지 추가</h1>
	<hr>
	<form action="/meoui/site/join" method="post" enctype="multipart/form-data">
		<hr>
		<div>
			<div class="form-group">
				<label>관광지명</label><input type="text" id="siteName" name="siteName" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 전화번호</label><input type="text" name="sitePhone" id="sitePhone" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 이용대상</label><input type="text" name="siteObject" id="siteObject" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 소개</label><input type="text" name="siteIntroduce" id="siteIntroduce" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 홈페이지</label><input type="text" name="siteHomepage" id="siteHomepage" class="form-control">
			</div>
			<div class="form-group">
				<label>관광지 이미지</label><input type="file" name="img" id="accommodationImg" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 개장시간</label><input type="text" name="siteOpenTime" id="siteOpenTime" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 폐장시간</label><input type="text" name="siteCloseTime" id="siteCloseTime" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 주차유무</label><input type="text" name="sitePark" id="siteOpenPark" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 야간개장유무</label><input type="text" name="siteNightOpen" id="siteNightOpen" class="form-control">
			</div>
			<div class="form-group">
				<label>광관지 야간폐장시간</label><input type="text" name="siteNightCloseTime" id="siteNightCloseTime" class="form-control">
			</div>
			<div class="form-group">
				<label>상세주소</label><input type="text" name="detailsAddress" id="detailsAddress" class="form-control">
			</div>		
			<div class="form-group">
					<select class="form-control input-lg" name="areaName">
					<option value="">선택</option>
					<option value="1">제주</option>
					<option value="2">서귀포</option>
				</select>
			</div>
			
			<div class="btn-group">
				<input type="submit" value="관광지 추가" id="confirmBtn" class="btn btn-primary">
				<input type="button" value="돌아가기" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	</form>
</body>
</html>