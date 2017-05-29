<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
img {
	width: 200px;
	height: 100px
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<head>
<%@include file="/nav/ownernav.jsp"%>
</head>
<h1 id="headTitle" style="margin-top: 50px;" align="center">객실
	상세페이지</h1>
<div class="container">
	<hr>
	<div class="row text-center">
		<table class="table table-striped table-bordered table-hover"
			style="width: auto;">
			<thead>
				<tr>
					<th>객실이름</th>
					<th>예약금액</th>
					<th>숙박가능인원</th>
					<th colspan="3">객실이미지</th>
					<th>비고</th>
				</tr>
			</thead>
			<c:forEach items="${result.room }" var="room">
				<tr>
					<td>${room.roomName}</td>
					<td>${room.roomPrice }(원)</td>
					<td>${room.roomUseNumber}(명)</td>
					<c:forEach items="${result.roomImg }" var="roomImg">
						<c:if test="${room.roomNo eq roomImg.roomNo}">
							<td><img src="/meoui/images/${roomImg.roomImg}"></td>
						</c:if>
					</c:forEach>
					<td><a
						href="/meoui/manage/room/delete?roomNo=${room.roomNo }&accommodationNo=${room.accommodationNo}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">삭제</button>
					</a></td>
			</c:forEach>
		</table>
		<div>
			<a href="/meoui/manage/accommodation/list?pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border"
					id="btn">리스트 이동</button>
			</a>
		</div>
		<div>
			<a
				href="/meoui//manage/accommodation/view/<%=(Integer) session.getAttribute("accommodationNo")%>">
				<button type="button" class="w3-button w3-block w3-white w3-border">펜션정보</button>
			</a>
		</div>
	</div>
</div>
</body>
</html>