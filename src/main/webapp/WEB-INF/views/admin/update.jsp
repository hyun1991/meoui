<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<form:form action="/meoui/admin/update" method="post" commandName="users">
			<input type="hidden" name="username" value="${users.username}"/><br>	
			<input type="password" name="password" placeholder="비밀번호"/><br>
			<form:errors path="password" /><br>
			<input type="submit" name="btn" value="가입"/><br>
	</form:form>
	</div>
</body>
</html>