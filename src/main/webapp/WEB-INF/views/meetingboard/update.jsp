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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<body>
	<header> <%@include file="/nav/navbar.jsp"%>
	</header>
<body>

<!-- 

	<h1>게시글 수정</h1>
	<form id="memberMeeting" action="/meoui/meetingboard/update"
		method="POST" enctype="multipart/form-data">

		제목:<input type="text" name="meetingboardTitle" id="meetingboardTitle"
			value="${memberMeeting.meetingNo}"><br> 내용:<input
			type="text" name="meetingboardContent" id="meetingboardContent"
			value="${memberMeeting.meetingName}"><br> 
			이미지:
			<input type="file" name="img" id="meetingboardImg"
			value="${memberMeeting.meetingImg}">
			<br><button id="commit" type="submit">수정하기</button>

	</form>
 -->



	<div class="container">
		<h1>게시글 수정하기</h1>
		<form id="memberMeeting" action="/meoui/meetingboard/update"
		method="POST" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="exampleInputEmail1">글 제목</label> <input type="text"
					class="form-control" id="exampleInputEmail1"
					name="meetingboardTitle" placeholder="title" value="${memberMeeting.meetingNo}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">글 내용</label>
				<textarea class="form-control" rows="5" id="comment"
			name="meetingboardContent" placeholder="contents" value="${memberMeeting.meetingName}">
			</textarea>
			
				<input type="file" name="img" id="meetingboardImg"
					class="form-control" value="등록">
			</div>
			<input type="button" class="btn btn-default pull-right" value="취소"
				onclick=" history.back(-1);">
			<button type="submit" class="btn btn-default pull-right">수정하기</button>


		</form>

	</div>







	<footer> <%@include file="/footer.jsp"%>
	</footer>



</body>
</html>