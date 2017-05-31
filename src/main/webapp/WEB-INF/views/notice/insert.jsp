<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 작성</h1>
<form id="NoticeFrom" action="/meoui/admin/notice/join" method="post">
<table>
<tr><td>제목</td><td><input type="text" name="noticeTitle" id="noticeTitle" ></td></tr>
<tr><td>내용</td><td><textarea name="noticeContent" id="noticeContent"></textarea></td></tr>
</table>
<button id="insert">글 작성</button>
</a>
</form>
</body>
</html>