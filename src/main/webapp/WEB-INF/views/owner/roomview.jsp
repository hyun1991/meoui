<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<%@include file="/nav/ownernav.jsp" %>
		<div class="container">
			<c:forEach items="${result.room }" var="room">
				<div>객실이름:${room.roomName}</div><br>
				<div>예약금액:${room.roomPrice }원</div><br>
				<div>숙박가능인원:${room.roomUseNumber}명</div>
			</c:forEach>
			<hr>
			<c:forEach items="${result.roomImg }" var="roomImg">
				<div><img src="/meoui/images/${roomImg.roomImg}"></div>
			</c:forEach>
		</div>
		<div><button>수정하기</button></div>
</body>
</html>