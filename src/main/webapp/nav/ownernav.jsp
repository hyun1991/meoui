<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Navigation Bar</title>
</head>
<body>
	<nav class="navbar navbar-default row text-center" id="navbar">
		<ul class="nav navbar-nav col-md-12">
			<li class="col-md-2"><a href="/meoui/manage/accommodaion/list?pageNo=1" id="menu">숙박시설관리</a></li>
			<li class="col-md-2"><a href="#" id="menu">예약관리</a></li>
			<li class="col-md-2"><a href="#" id="menu">회원관리</a></li>
			<li class="col-md-2"><a href="#" id="menu">통계</a></li>
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