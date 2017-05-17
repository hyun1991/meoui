<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<style>
footer{
	background-color: grey;
}
</style>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-2">
				<%@include file="/sideNavigation.jsp"%>
			</div>
			<div class="col-md-9">
				<hgroup style="margin: 50px;">
					<h1>카테고리 별 제주 숙박업소 노출</h1>
					<h2>카테고리별로 조회해보세요.</h2>
				</hgroup>
				<p id="accomodationList" align="center"></p>
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
	for (var i = 0; i < 12; i++) {
		text += '<div class="col-md-4"> <a href="/meoui/accomodationinfo.jsp">'
				+ '<img class="img-responsive" src="/meoui/images/jeju.jpg" alt="숙박업소" width="250" height="170"> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("accomodationList").innerHTML = text;
</script>
</html>