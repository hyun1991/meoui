<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/hanjoon.css">
	<link rel="stylesheet" type="text/css" href="css/sejin.css">
<title>Insert title here</title>
</head>
<body>
	<%@include file="adminNavbar.jsp"%>
	<div class="container">
		<h2>일반회원관리</h2>
		<br>
		<div class="row">
			<table class="table table-hover table-responsive" width="100%">
 
  <tr>
    <th width="30%">일반회원번호</th>
    <th>Savings</th>
  </tr>
  <tr>
    <td width="30%">이름</td>
    <td>$100</td>
  </tr>
  <tr>
    <td width="30%">주소</td>
    <td>$80</td>
  </tr>
  <tr>
    <td width="30%">성별</td>
    <td>$80</td>
  </tr>
  <tr>
    <td width="30%">핸드폰번호</td>
    <td>$80</td>
  </tr>
			</table>
			<div class="row text-center">
			
				<ul class="pagination pagination-md">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
			<div class="row">
				<a href="/meoui/writenotice.jsp" class="btn btn-success">수정</a>
				<a href="/meoui/writenotice.jsp" class="btn btn-success">삭제</a>
			</div>
	
	</div>
</body>
</html>