<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${result.accommodation.accommodationName }</title>
<style>
header {
	margin-bottom: 50px;
}

#username {
	display: inline;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav/ownernav.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<h1>${result.accommodation.accommodationName }</h1>
		</div>
		<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md-2">
				<a
					href="/meoui/menage/room/view/${result.accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-white w3-border"
						id="messageBtn">객실정보</button>
				</a> <a href="/meoui/manage/accommodation/update">
					<button type="button" class="w3-button w3-white w3-border"
						id="messageBtn">수정하기</button>
				</a> <a href="/meoui/manage/room/join">
					<button type="button" class="w3-button w3-white w3-border"
						id="messageBtn">객실추가</button>
				</a>
			</div>
		</div>
		<div class="row">
			<img src="/meoui/images/${result.accommodation.accommodationImg}">
		</div>
		<div class="row">
			<h2>전화</h2>
			<h4>${result.accommodation.accommodationPhone }</h4>
		</div>
		<div class="row">
			<h2>위치</h2>
			<h4>${result.accommodation.accommodationAddress }</h4>
		</div>
		<div class="row">
			<h2>오시는길</h2>
		</div>
		<div>
			<img
				src="/meoui/images/${result.accommodation.accommodationDirections}">
		</div>
		<br>
		<hr>
		<h3>댓글리스트</h3>
		<div class="row">
			<c:forEach items="${result.comment }" var="comment">
				<div class="col-md-8">
					<input type="hidden" id="memberNo"
						value="${comment.accommodationCommentNo }">
					<h4 style="display: inline;">${comment.memberNo }:</h4>
					<h6>${comment.accommodationCommentContent}</h6>
					<fmt:formatDate value="${comment.accommodationCommentDate}"
						pattern="yyyy.MM.dd" />
					평점: ${comment.accommodationCommentAvg}점
				</div>
			</c:forEach>
		</div>
	<hr>
	<div class="form-group"><img src="/meoui/images/${result.accommodation.accommodationImg}"></div><br>
	<div class="form-group"><h3>숙박시설이름:</h3>${result.accommodation.accommodationName }</div><br>
	<div class="form-group"><h3>대표전화:</h3>${result.accommodation.accommodationPhone }</div>
	<div class="form-group"><h3>시설위치:</h3>${result.accommodation.accommodationAddress }</div>
	<div class="form-group">
	<a href="/meoui/manage/accommodation/update">
	<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">수정하기</button>
	</a>
	</div>
	<div class="form-group">
		<a href="/meoui/manage/room/join">
		<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">
		객실추가</button></a>
	</div>
	</div>
</body>
</html>