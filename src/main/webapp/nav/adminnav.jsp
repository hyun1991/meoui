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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Navigation Bar</title>
</head>
<body>
	<nav class="navbar navbar-default row text-center" id="navbar">
		<ul class="nav navbar-nav col-md-12">
			<li class="col-md-2"><a href="#" id="menu">관광명소관리</a></li>
			<li class="col-md-2"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="board">
			회원관리</a>
				<ul class="dropdown-menu">
					<li><a href="#" id="#">일반회원</a></li>
					<li><a href="#" id="#">업주회원</a></li>
					<li><a href="#" id="#">관리자</a></li>
				</ul></li>
			<li class="col-md-2"><a href="#" id="menu">숙박시설관리</a></li>
			<li class="col-md-2">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="board">
			게시판관리</a>
			<ul class="dropdown-menu">
				<li><a href="#" id="#">공지사항</a></li>
				<li><a href="#" id="#">자유게시판</a></li>
			</ul></li>
			<li class="col-md-2"><a href="#" id="menu">모임관리</a></li>
			<li class="dropdown pull-right"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" id="#"><%=session.getAttribute("ownerId")%>님
					환영합니다<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#" id="#">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>
</body>
</html>