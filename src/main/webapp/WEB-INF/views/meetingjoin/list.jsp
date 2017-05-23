<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>	
<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
<body>
	
	<h2>나의 모임 게시판</h2>
	<hr>
	<c:forEach items="${result.list }" var="meeting">
		모임번호:<a href="/meoui/membermeeting/update/{meetingNo}">${meeting.meetingNo }</a><br>
		모임명: ${meeting.meetingName }<br>
		모임이미지:	<a
						href="/meoui/membermeeting/list/${meeting.meetingImg}">
						<img class="image-responsive"
						src="/meoui/images/${meeting.meetingImg}"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>
						<br>
		인원수: ${meeting.meetingTotalNumber }<br>
	</c:forEach>
</body>
</html>