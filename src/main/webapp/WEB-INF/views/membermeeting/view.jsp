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
	<h2>모임 보기</h2>
	<div><h3>모임번호:</h3>${result.membermeeting.meetingNo}</div><br>
	<div><h3>모임이름:</h3>${result.membermeeting.meetingName }</div>
	<div><h3>모임사진:</h3>${result.membermeeting.meetingImg }</div>
	<div><h3>모임인원:</h3>${result.membermeeting.meetingToTalNumber }</div>
	<hr>
</body>
</html>