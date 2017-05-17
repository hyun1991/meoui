<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
footer{
	background-color: grey;
}
</style>
</head>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-2">
				<%@include file="/sideNavigation.jsp"%>
			</div>
			<div class="col-md-10">
				<div class="row">
					<br>
					<h3>카테고리 별 제주 관광명소 노출</h3>
					<br>
					<p id="attractionList" align="center"></p>
				</div>
			</div>
		</div>

	</div>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
<script>
	var text = "";
	for (var i = 0; i < 20; i++) {
		text += '<div class="col-md-3"> <a href="/meoui/attractioninfo.jsp">'
				+ '<img class="img-responsive" src="/meoui/images/jeju.jpg" alt="attraction" width="250" height="170"> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("attractionList").innerHTML = text;
</script>
</html>