<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>모임게시판 글 생성하기</h1>
		<form id="meetingboard" action="/meoui/meetingboard/create" method="POST" enctype="multipart/form-data">
		<table>
			<tr><td>제목:</td><td><input type="text" name="meetingboardTitle" id="meetingboardTitle"></td><tr>
			<tr><td>이미지:</td><td><input type="file" name="Img" id="meetingboardImg"></td></tr>
			<tr><td>내용</td><td><input type="text" name="meetingboardContent" id="meetingboardContent"></td></tr>
			
			
			<tr><td><button id="commit" type="submit">글 쓰기</button></td></tr>		
		
		</table>		
		
		</form>
</body>
</html>