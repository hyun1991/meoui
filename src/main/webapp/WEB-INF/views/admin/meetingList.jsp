<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>
@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity




:


 


0
}
50%{
opacity




:




1
}
}
#headTitle, .step {
	font-family: 'Jeju Gothic', serif;
}

@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity






:






0
}
50%{
opacity






:






1
}
}
.glyphicon-home {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<h2>모임 리스트</h2>
	<hr>
	<div class="row text-center">
			<c:forEach items="${result.list }" var="meeting">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
					<a href="/meoui/membermeeting/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${meeting.meetingImg}"
						alt="알수없음" style="margin-bottom: 20px;">
					</a>
					<p><a href="/meoui/membermeeting/view/${meeting.meetingNo}">
							<strong>${meeting.meetingName }</strong>
						</a>
					</p>
					<p><a href="/meoui/membermeeting/view/${meeting.meetingNo}">
						${meeting.meetingTotalNumber }명</a>
					</p>
					<div class="form-group">
						<a href="/meoui/accommodation/view/${accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button></a>
				</div>
				</div>
			</c:forEach>
	</div>
	<div class="form-group">
		<a href="#">
			<button type="button" class="w3-button w3-block w3-white w3-border">모임등록</button>
		</a>
	</div>
</body>
</html>