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
			<li class="col-md-2"><a href="/meoui/manage/home" id="menu">홈</a></li>
			<li class="col-md-2"><a href="/meoui/manage/accommodation/list?pageNo=1" id="menu">숙박시설관리</a></li>
			<li class="col-md-2"><a href="/meoui/manage/reserve/list/<%=session.getAttribute("ownerNo")%>" id="menu">예약관리</a></li>
			<li class="dropdown pull-right"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" id="loginCheck"><%=session.getAttribute("ownerId")%>님
					환영합니다<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/meoui/manage/logout" id="logoutBtn">로그아웃</a></li>
					<li><a id="deleteBtn">회원탈퇴</a></li>
				</ul></li>
		</ul>
	</nav>
</body>
<script>
	$(document).ready(function() {
		$("#deleteBtn").on("click", function() {
			$.ajax({
				type : "post",
				url : "/meoui/manage/delete",
				success : function(result) {
					console.log(result)
					if (result == "success") {
						alert("회원탈퇴 되었습니다.")
						window.location.href = "/meoui/manage/login";
					}
				}
			})
		})
	})
</script>
</html>