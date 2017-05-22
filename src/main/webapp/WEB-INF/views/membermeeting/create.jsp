<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>신규 모임 생성</h1>
		<form id="memberMeetingForm" action="/meoui/membermeeting/create" method="POST" enctype="multipart/form-data">
		<table>
			<tr><td>모임명:</td><td><input type="text" name="meetingName" id="meetingName"></td><tr>
			<tr><td>이미지:</td><td><input type="file" name="Img" id="meetingName"></td></tr>
			<tr><td><button id="commit" type="submit">모임생성</button></td></tr>		
		</table>		
		</form>
</body>
</html>