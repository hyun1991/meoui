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
        <c:forEach items="${result.list }" var="freeboard">
        <tr>
			<td>게시글 번호</td><td>제목</td>
			<td>${freeboard.freeboardNo}</td><td>${freeboard.freeboardTitle}</td>
		</tr>
		<tr>
			<td>작성자</td><td>${freeboard.freeboardNo}</td><td>작성일</td><td>조회수</td>	
			<td><fmt:formatDate value="${freeboard.freeboardDate}" pattern="yyyy년 MM월 dd일" /></td><td>${freeboard.freeboardCnt}</td>
		</tr>
	    <tr>
			<td>내용</td>
			<td>${freeboard.freeboardContent}</td>
		</tr>
		</c:forEach>
		<hr>
	<form action="/meoui/freeBoardComment/insert" method="post">
		<div><textarea rows="5" cols="50" placeholder="댓글을 작성해 주세요." name="freeBoardCommentContent"></textarea></div>
		<input type="number" name="freeBoardCommentAvg" placeholder="평점을 숫자로만 입력해 주세요.">
		<input type="submit" value="댓글작성">
	</form>
	<hr>
	<c:forEach items="${result.freeboardcomment }" var="freeboardcomment">
			<div>${freeboardcomment.freeboardCommentNo }</div>
			<div>${freeboardcomment.freeboardCommentContent}</div><br>	
			<a href="/meoui/freeBoardComment/delete/${freeboardcomment.freeboardCommentNo }"><button>댓글 삭제하기</button></a>
			<div><fmt:formatDate value="${freeboardcomment.freeboardCommentDate}" pattern="yyyy년 MM월 dd일" /></div><br>
			<hr>
		</c:forEach>
	</table>
</body>
</html>