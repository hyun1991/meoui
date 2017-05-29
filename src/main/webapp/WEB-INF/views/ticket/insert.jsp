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
	<form action="/meoui/ticket/insert" method="post" >
		<hr>
		<div>
			<div class="form-group">
				<select class="form-control input-lg" id="agegroupStandard" name="agegroupStandard">
					<option value="">선택</option>
					<option value="성인">성인</option>
					<option value="청소년">청소년</option>
					<option value="소인">소인</option>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control input-lg" id="agegroupStandardNo" name="agegroupStandardNo">
					<option value="">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
			</div>
			<div class="form-group">
				<label>티켓 가격</label><input type="text" name="ticketPrice" id="ticketPrice" class="form-control">
			</div>
		
			
			<div class="btn-group">
				<input type="submit" value="티켓 추가" id="confirmBtn" class="btn btn-primary">
				<input type="button" value="돌아가기" id="confirmBtn" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
</html>