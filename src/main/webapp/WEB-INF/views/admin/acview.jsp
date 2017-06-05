<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박업소 정보</title>
<style>
		
</style>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/${result.accommodation.accommodationImg}">
			</div>
			<div>
				<h3>숙박시설이름</h3>${result.accommodation.accommodationName }
			</div>
			<div>
				<h3>대표전화</h3>${result.accommodation.accommodationPhone }
			</div>
			<div>
				<h3>시설위치</h3>${result.accommodation.accommodationAddress }
			</div>
			<div class="col-xs-4" style="margin-top: 100px">
				<a href="/meoui/admin/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }">
					<button type="button"
					class="w3-button w3-block w3-white w3-border">객실정보 조회하기</button></a>
			</div>
			<div class="col-xs-4">
				<a href="/meoui/admin/accommodaion/list?pageNo=1"><button
							type="button" class="w3-button w3-block w3-white w3-border">
							리스트로 이동</button></a>
			</div>
		</div>
		<hr>
		<input type="hidden"
					value="${result.accommodation.ownerNo }" id="ownerNo">
		<div align="center">
			<h2 style="margin-left: 10px">오시는길</h2>
		</div>
		<div class="row">
			<img src="/meoui/images/${result.accommodation.accommodationDirections}" style="margin-left: 10px">
		</div>
	</div>

	<hr>
	<h2 align="center">리스트</h2>
	<c:forEach items="${result.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="memberNo" value="${comment.memberNo }"
				class="form-control input-lg">
			<div class="form-group">${comment.accommodationCommentContent}
			</div>
			<c:forEach items="${result.member }" var="member">
				<div class="btn-r">작성자: ${member.memberId }</div>
			</c:forEach>
			<div class="form-group">${comment.byul }</div>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.accommodationCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a
						href="/meoui/accommodationComment/delete/${comment.accommodationCommentNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border" id="deleteBtn">댓글
							삭제하기</button>
					</a>
				</c:if>
			</div>
			<hr>
		</div>
	</c:forEach>
	
</body>
</html>