<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/navbar.jsp"%>
	<h2>모임 리스트</h2>
	<hr>
	<c:forEach items="${result.list }" var="meeting">
		이엘뷰 모임번호:<a href="/meoui/membermeeting/view/${meeting.meetingNo}">${meeting.meetingNo }</a><br>
		모임명: ${meeting.meetingName }<br>
		모임이미지:<img src="/meoui/images/${meeting.meetingImg}"><br>
		인원수: ${meeting.meetingTotalNumber }<br>
	</c:forEach>
	

</body>
</html>