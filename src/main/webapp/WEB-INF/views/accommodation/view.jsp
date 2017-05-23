<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박업소 정보</title>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>

	<div class="form-group">
	<img src="/meoui/images/${result.accommodation.accommodationImg}">
	</div><br>
	<div class="form-group"><h3>숙박시설이름:</h3>
	${result.accommodation.accommodationName }</div><br>
	<div class="form-group">
	<h3>대표전화:</h3>${result.accommodation.accommodationPhone }</div>
	<div class="form-group">
	<h3>시설위치:</h3>${result.accommodation.accommodationAddress }</div>
	<input type="hidden" value="${result.accommodation.ownerNo }" id="ownerNo">
	<div class="form-group">
	<a href="/meoui/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }">
	<button type="button" class="w3-button w3-block w3-white w3-border">객실정보 조회하기</button></a></div>
	<div class="form-group">
	<a href="/meoui/accommodaion/list?pageNo=1"><button type="button" class="w3-button w3-block w3-white w3-border">
	리스트로 이동</button></a></div>
	<hr>
	<div><h2>오시는길</h2></div><br>
	<div><img src="/meoui/images/${result.accommodation.accommodationDirections}"></div><br>
	<hr>
	<form action="/meoui/accommodationComment/insert" method="post">
		<div><textarea rows="5" cols="50" placeholder="댓글을 작성해 주세요." name="accommodationCommentContent"></textarea></div>
		<div class="form-group">
		<select class="form-control" name="accommodationCommentAvg">
			<option value="">선택</option>
			<option value="0">☆☆☆☆☆</option>
			<option value="1">★☆☆☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="3">★★★☆☆</option>
			<option value="4">★★★★☆</option>
			<option value="5">★★★★★</option>
		</select>
		</div>
		<div class="form-group">
		<button type="submit" class="w3-button w3-block w3-white w3-border">댓글작성</button>
		</div>
	</form>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
			<input type="hidden" id="memberNo" value="${comment.memberNo }">
			<div class="form-group">댓글번호: ${comment.accommodationCommentNo }</div>
			<div class="form-group">댓글내용: ${comment.accommodationCommentContent}</div>	
			<div class="form-group">평점: ${comment.accommodationCommentAvg}점</div>
			<div class="form-group">작성일: <fmt:formatDate value="${comment.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div>
			<div class="form-group">
			<a href="/meoui/accommodationComment/delete/${comment.accommodationCommentNo }">
			<button type="button" class="w3-button w3-block w3-white w3-border" id="deleteBtn">댓글 삭제하기</button>
			</a></div>
			<hr>
	</c:forEach>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
<script>
	$(document).ready(function() {
		var memberNo= "<%=session.getAttribute("memberNo")%>"
		var commentMemberNo= $("#memberNo").val();
		$("#deleteBtn").on("click", function() {
			if(memberNo===commentMemberNo)
				alert("댓글 삭제가 완료되었습니다.")
			else
				alert("댓글 작성자가 아닙니다.")
		})
	})
</script>
</html>