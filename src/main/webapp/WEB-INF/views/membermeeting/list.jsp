<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<style>
footer{
	background-color: grey;
}
</style>
<body>
	<div class="container">
		<h2>모임 게시판</h2>
		<br>
		<div>
		<table>
   		<tr><th>번호</th><th>모임명</th><th>인원</th></tr>

		<c:forEach items="${result.list }" var ="result">
			<tr>	
				<td>${result.meetingNo }</td>
				<td>${result.meetingName }</td>
				<td>${result.meetingTotalNumber }</td>
			</tr>
		</c:forEach>
		</table>			
		</div>
	</div>
</body>
</html>