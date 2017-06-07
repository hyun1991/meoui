<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove rounded borders from list */
.list-group-item:first-child {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.list-group-item:last-child {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

/* Remove border and add padding to thumbnails */
.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail p {
	margin-top: 15px;
	color: #555;
}

/* Black buttons with extra padding and without rounded borders */
.btn {
	padding: 10px 20px;
	background-color: #333;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}

/* On hover, the color of .btn will transition to white with black text */
.btn:hover, .btn:focus {
	border: 1px solid #333;
	background-color: #fff;
	color: #000;
}
</style>
</head>
<header>
	<%@include file="/nav/navbar.jsp"%>
</header>
<body>


	<!-- Container (TOUR Section) -->
	<h2>나의 모임 목록</h2>
	<hr>
	<c:forEach items="${result.list }" var="meeting">

		<div class="row text-center" style="width: 90%; height: 0px;">
			<div class="col-sm-4" style="padding-right: 5px; padding-left: 5px;">
				<div class="thumbnail">

					<a href="/meoui/membermeeting/list/${meeting.meetingImg}"> <img
						src="/meoui/images/${meeting.meetingImg}" alt="Paris" width="400"
						height="300">
					</a>

					<p>
						<strong>${meeting.meetingName }</strong>
					</p>


					<p>회원 인원 :${meeting.meetingTotalNumber }</p>





					<a href="/meoui/meetingboard/list/${meeting.meetingNo}"
						>
						<span class="btn" >모임게시판</span></a>
					
					<c:if test="${meeting.meetingAdminNo eq memberNo }">
						<a href="/meoui/membermeeting/update">
							<button id="commit" type="submit"
								class="btn">모임수정하기</button>
						</a>

						<form action="/meoui/membermeeting/delete" method=post>
							<button id="commit" type="submit"
								class="btn" >모임 삭제하기</button>
						</form>
					</c:if>
					<c:if test="${meeting.meetingAdminNo != memberNo }">	
					<form action="/meoui/membermeeting/view/bye" method=get>
						<button class="btn" id="commit" type="submit">모임 탈퇴하기</button>
					</form></c:if>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>