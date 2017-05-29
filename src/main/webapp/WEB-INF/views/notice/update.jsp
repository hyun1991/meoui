<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 수정</h1>
<form id="UpdateNoticeFrom" action="/meoui/notice/update" method="post">
<table>
<tr><td>제목</td><td><input type="text" name="noticeTitle" id="noticeTitle"><td>${noticeTitle}</td></tr>
<tr><td>내용</td><td><textarea name="noticeContent" id="noticeContent">${noticeContent}</textarea></td></tr>
</table>
<a href="/meoui/notice/update">
<button id="update">수정 완료</button>
</a>
</form>
</body>
</html>