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
		<h1 id="headTitle" style="margin-top: 50px;" align="center">관리자 추가</h1>
	<hr>
	<form action="/meoui/admin/join" method="post" >
		<div>
			<div class="form-group">
				<label>아이디</label><input type="text" id="username" name="username" class="form-control">
				<span id="idcheck"></span>
			</div>
			<div class="form-group">
				<label>비밀번호</label><input type="password" name="password" id="adminpw" class="form-control">
			</div>
			<div class="btn-group">
				<input type="submit" value="관리자 추가하기" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
</html>