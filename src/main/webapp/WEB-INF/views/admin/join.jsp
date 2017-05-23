<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">  
<link rel="stylesheet" href="/web/css/main.css">
<title>회원 가입</title>
</head>
<body>
	<div id="header">
		<%@include file="/nav/adminnav.jsp" %>
	</div>
	<div id="main">
		<form:form action="/meoui/admin/join" method="post" commandName="users">
			<input type="text" name="username" placeholder="아이디"/><br>	
			<form:errors path="username" /><br>
			<input type="password" name="password" placeholder="비밀번호"/><br>
			<form:errors path="password" /><br>
			<input type="submit" name="btn" value="가입"/><br>
	</form:form>
	</div>
</body>
</html>