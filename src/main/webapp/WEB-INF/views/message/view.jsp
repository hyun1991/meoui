<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/nav/navbar.jsp"%>
	<div class="container">
		<hr>
		<div class="row">
			<div class="col-md-4">
				<label for="usr">발신인 아이디 </label><br>
				${result.messageSendId } <br> 
				<label for="usr">제목 </label><br>
				${result.messageTitle }<br>
				<label for="usr">내용: </label><br>
				${result.messageContent }<br>
				<label for="usr">보낸날짜: </label><br>
				<fmt:formatDate value="${result.messageDate}" pattern="yyyy년 MM월 dd일" /><br><br>
				<div class="form-group">
				<a href="/meoui/message/list?messageReceiveId=<%=session.getAttribute("memberId") %>&pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border">
				쪽지리스트</button></a><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>