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
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<h2>상세 뷰</h2>
	<div class="row text-center">
		<div class="col-sm-3">
			<a href="/meoui/membermeeting/view/${meeting.meetingNo}"> <img
				class="image-responsive" src="/meoui/images/${meeting.meetingImg}"
				alt="skinscuber" style="margin-bottom: 20px;">
			</a>

			<p>
				<a href="/meoui/membermeeting/view/${meeting.meetingNo}"> <strong>${meeting.meetingName }</strong>
				</a>
			</p>
			<p>
				<a href="/meoui/membermeeting/view/${meeting.meetingNo}">
					${meeting.meetingTotalNumber }명</a>
			</p>
			
			<form action="/meoui/membermeeting/post" method=post>
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">회원 가입하기</button>
			</form>
			<c:if test="${meeting.meetingAdminNo eq memberNo }">
			<a href="/meoui/membermeeting/update">
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">모임수정하기</button></a>
			</c:if>
			<c:if test="${meeting.meetingAdminNo eq memberNo }">
			<form action="/meoui/membermeeting/delete" method=post>
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">모임 삭제하기</button>
			</form>
			</c:if>
			
			<a href="/meoui/meetingboard/list/${meeting.meetingNo}"
						style="color: #424242;"><span class="glyphicon glyphicon-heart"
							style="color: #f76ce4;"></span> 모임게시판 </a>
							
							
				
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<script>
	
</script>
</html>