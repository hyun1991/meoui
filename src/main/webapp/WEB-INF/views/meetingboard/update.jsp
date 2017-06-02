<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 게시글 수정</title>
</head>
<body>

	
	<h1>게시글 수정</h1>
		<form id="memberMeeting" action="/meoui/meetingboard/update" method="POST" enctype="multipart/form-data">
	
			제목:<input type="text" name="meetingboardTitle" id="meetingboardTitle" value="${memberMeeting.meetingNo}"><br>
			내용:<input type="text" name="meetingboardContent" id="meetingboardContent" value="${memberMeeting.meetingName}"><br>
			이미지:<input type="file" name="img" id="meetingboardImg" value="${memberMeeting.meetingImg}"><br>
			<button id="commit" type="submit">수정하기</button>
		
		</form>
</body>
</html>