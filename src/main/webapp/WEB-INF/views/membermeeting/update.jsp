<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> 

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>


	<h1>모임 수정</h1>
	<form id="memberMeeting" action="/meoui/membermeeting/update"
		method="POST" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="exampleInputEmail1">모임명</label> 			
			
			<input type="text"
				class="form-control" id="exampleInputEmail1" name="meetingName" value="${result.meetingName}"
				placeholder="모임명을 적어주세요">
		</div>		
		<div class="form-group">		
			<label for="exampleInputPassword1">이미지</label>
			 <input type="file"	name="img" id="meetingimg" class="form-control">
		</div>		
		<input type="button" class="btn btn-default pull-right" value="취소"
			onclick=" history.back(-1);">
		<button type="submit" class="btn btn-default pull-right">수정하기</button>
	</form>


















</body>
</html>