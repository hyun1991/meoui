<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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
<head>
<meta charset="UTF-8">
<title>모임 목록</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<body>
<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="row text-center">
			<c:forEach items="${result.list }" var="meeting">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
					<a
						href="/meoui/membermeeting/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${meeting.meetingImg}"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>

					<p>
						<a
							href="/meoui/membermeeting/view/${meeting.meetingNo}">
							<strong>${meeting.meetingName }</strong>
						</a>
					</p>
					<p>
						<a
							href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${meeting.meetingTotalNumber }명</a>
					</p>
					<div class="form-group">
						<a href="/meoui/membermeeting/view/${meeting.meetingNo}">
					<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button></a>
																		
				</div>
				</div>
			</c:forEach>
		</div>
	
	
	
<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>