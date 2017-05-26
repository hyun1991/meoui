<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/ownernav.jsp" %>

	<div class="form-group"><img src="/meoui/images/${result.accommodation.accommodationImg}"></div><br>
	<div class="form-group"><h3>숙박시설이름:</h3>${result.accommodation.accommodationName }</div><br>
	<div class="form-group"><h3>대표전화:</h3>${result.accommodation.accommodationPhone }</div>
	<div class="form-group"><h3>시설위치:</h3>${result.accommodation.accommodationAddress }</div>
	<div class="form-group">
	<a href="#">
	<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">수정하기</button>
	</a>
	</div>
	<div class="form-group">
		<a href="/meoui/manage/room/join">
		<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">
		객실추가</button></a>
	</div>
	<div class="form-group">
		<a href="/meoui/menage/room/view/${result.accommodation.accommodationNo}">
		<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">
		객실정보</button></a>
	</div>
	<hr>
	<div class="form-group"><h2>오시는길</h2></div><br>
	<div><img src="/meoui/images/${result.accommodation.accommodationDirections}"></div><br>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
			<input type="hidden" id="memberNo" value="${comment.memberNo }">
			<div class="form-group">댓글번호: ${comment.accommodationCommentNo }</div>
			<div class="form-group">댓글내용: ${comment.accommodationCommentContent}</div>	
			<div class="form-group">평점: ${comment.accommodationCommentAvg}점</div>
			<div class="form-group">작성일: <fmt:formatDate value="${comment.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div>
			<div class="viewdelete">
	    	<a href ="/meoui/accommodationComment/delete/${comment.accommodationCommentNo }">
			<button type="button" class="w3-button w3-block w3-white w3-border" id="deleteBtn">댓글 삭제하기</button>
			</a></div>
			<hr>
	</c:forEach>
</body>
</html>