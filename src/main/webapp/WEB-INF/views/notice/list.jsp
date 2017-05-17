<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${result.list }" var="notice">
		<tr>
			<td><a href="/meoui/notice.jsp">${notice.noticeNo }</a></td>
			<td>${notice.usersNo }</td>
			<td>${notice.noticeTitle }</td>
			<td><fmt:formatDate value="${notic.noticeDate }" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
	</c:forEach>
</body>
</html>