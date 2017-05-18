<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
        <h3>게시글 </h3>
        <table>
        <c:forEach items="${result.list }" var="notice">
        <tr>
			<td>게시글 번호</td><td>제목</td>
			<td>${notice.noticeNo}</td><td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td>작성자</td><td>${notice.usersNo}</td><td>작성일</td><td>조회수</td>	
			<td><fmt:formatDate value="${notice.noticeDate}"
					pattern="yyyy년 MM월 dd일" /></td><td>${notice.noticeCnt}</td>
		</tr>
	    <tr>
			<td>내용</td>
			<td>${notice.noticeContent}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>