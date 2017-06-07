<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/nav/ownernav.jsp" %>
	<h1>관광지 수정페이지</h1>
	<hr>
	<form action="/meoui/admin/site/update" method="post" enctype="multipart/form-data">
		<hr>
		<div>
			<div class="form-group">
				<label>관광지명</label><input type="text" id="siteName" name="siteName" class="form-control">
			</div>
				<div class="form-group">
				<label>광관지 주차유무</label>
				<select class="form-control input-lg" name="sitePark" id="sitePark">
					<option value="">선택</option>
					<option value="1">주차가능</option>
					<option value="2">주차불가능</option>
				</select>
			</div>
			<div class="form-group">
				<label>이용대상</label><input type="text" id="siteObject" name="siteObject" class="form-control">
			</div>
			
			<div class="form-group">
				<label>홈페이지</label><input type="text" id="siteHomepage" name="siteHomepage" class="form-control">
			</div>
			<div class="form-group">
				<label>개장시간</label><input type="text" id="siteOpenTime" name="siteOpenTime" class="form-control">
			</div>
			<div class="form-group">
				<label>폐장시간</label><input type="text" id="siteCloseTime" name="siteCloseTime" class="form-control">
			</div>
			<div class="form-group">
				<label>야간개장 여부</label><input type="text" id="siteNightOpen" name="siteNightOpen" class="form-control">
			</div>
			<div class="form-group">
				<label>야간개장 시 폐장시간</label><input type="text" id="siteNightCloseTime" name="siteNightCloseTime" class="form-control">
			</div>
				<div class="form-group">
				<label>상세주소</label><input type="text" id="detailsAddress" name="detailsAddress" class="form-control">
			</div>
			<div class="form-group">
				<label>전화번호</label><input type="text" name="sitePhone" id="sitePhone" class="form-control"
				placeholder="대표전화를 입력해 주세요.">
			</div>
			
			<div class="btn-group">
				<input type="submit" value="관광지 수정" id="confirmBtn" class="btn btn-primary">
				<a href="/meoui/admin/site/list?pageNo=1"><input type="button" value="리스트로" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	</form>
</body>
</html>