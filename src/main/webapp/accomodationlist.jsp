<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<style>
footer {
	background-color: grey;
}
</style>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 text-center">
				<aside>
					<%@include file="/sideNavigation.jsp"%>
				</aside>
			</div>
			<div class="col-md-8">
				<div class="row">
					<hgroup style="margin-bottom: 50px;">
						<h1>카테고리 별 제주 숙박업소 노출</h1>
						<h2>카테고리별로 조회해보세요.</h2>
					</hgroup>
				</div>
				<div class="row">
					<h3 class="text-left" style="margin: 3%;">카테고리1</h3>
					<p id="accomodationList" align="center"></p>
				</div>
				<div class="row">
					<h3 class="text-left" style="margin: 3%;">카테고리1</h3>
					<p id="accomodationList" align="center"></p>
				</div>
			</div>
			<div class="col-md-2 text-center">
				<aside>
					<%@include file="/sideNavigation.jsp"%>
				</aside>
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
	for (var i = 0; i < 4; i++) {
		text += '<div class="col-md-3" style="padding: 5;"> <a href="/meoui/accomodationinfo.jsp">'
				+ '<img src="/meoui/images/jeju.jpg" alt="숙박업소" width="200" height="170"">' 
				+' <div class="caption"><p class="text-left">50000</p><p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("accomodationList").innerHTML = text;
</script>
</html>