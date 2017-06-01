<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<h1>모임 수정</h1>
		<form id="memberMeeting" action="/meoui/membermeeting/update" method="POST" enctype="multipart/form-data">
	
			모임번호:<input type="text" name="meetingNo" id="meetingNo" readonly="readonly" value="${memberMeeting.meetingNo}"><br>
			모임명:<input type="text" name="meetingName" id="meetingName" value="${memberMeeting.meetingName}"><br>
			이미지:<input type="file" name="meetingImg" id="meetingImg" value="${memberMeeting.meetingImg}"><br>
			총인원수:<input type="text" name="meetingTotalname" id="meetingTotalName" readonly="readonly">${memberMeeting.meetingTotalNumber}<br>
			${memberMeeting.meetingName}
			<button id="commit" type="submit">수정하기</button>
		
		</form>
</body>
</html>