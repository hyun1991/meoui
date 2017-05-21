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

	<div>회원 수정</div>
	<c:forEach items="${result.list }" var="meeting">
		번호<input type="text" name="meetingNo" value="${meeting.meetingNo}"
			id="articleId" />
		모임명<input type="text" name="meetingName" value="${meeting.meetingName}" />
		인원<input name="text" value="${meeting.meetingTotalNumber}" />
	</c:forEach>
</body>
</html>