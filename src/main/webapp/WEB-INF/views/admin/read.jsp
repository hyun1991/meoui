<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<%@include file="/nav/adminnav.jsp" %>
	</div>
	<div id="main">
		���̵�:${users.username}<br>
		<a href="/meoui/admin/update?username=${users.username}">������Ʈ �ϱ�</a>
		<form action="/meoui/admin/delete"	method="post">
			<input type="hidden" name="username" value="${users.username }">
			<input type="submit" id="delete" value="����">   
		</form>
	</div>
</body>
</html>