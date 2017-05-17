<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주를 부탁해</title>
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

header {
	background-image: url(/meoui/images/sky.jpg);
	background-repeat: no-repeat;
}

#menu {
	font-family: 'Jeju Gothic', serif;
}

#text, p, header {
	color: black;
}
footer{
	background-color: grey;
}
</style>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
		<form class="form-inline">
			<div class="input-group">
				<input type="search" class="form-control input-lg" size="30"
					placeholder="목적지" required style="margin: 50px;">
				<div class="input-group-btn">
					<button type="button" class="btn btn-default btn-lg"
						style="margin-left: 50px; background-color: #f7ff14;">검색</button>
				</div>
			</div>
		</form>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">canvas자리</h1>

	</header>
	<div class="container-fluid text-center">
		<div class="row">
			<ul class="nav nav-tabs" id="menu">
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-2"><a data-toggle="tab" href="#allCategory"
					id="text">카테고리 전체&nbsp<span class="badge">5</span>
				</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#leisure"
					alt="잠수함/유람선/레저" id="text">잠수함/유람선/레저&nbsp<span class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#theater"
					id="text">공연장/상영관/기타&nbsp<span class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#musuem"
					id="text">테마공원/박물관&nbsp<span class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#restaurant"
					id="text">음식점&nbsp<span class="badge">5</span></a></li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
			</ul>
		</div>
		<div class="container">
			<div class="tab-content">
				<div id="allCategory" class="tab-pane fade in active">
					<h4 class="text-left" style="margin: 50px;" style="color: white;">카테고리</h4>
					<p id="attractionList" align="center"></p>
				</div>
				<div id="leisure" class="tab-pane fade">
					<h3>westJeju 1</h3>
					<p>Some content in westJeju 1.</p>
					<p id="attractionList" align="center"></p>
				</div>
				<div id="theater" class="tab-pane fade">
					<h3>westJeju 2</h3>
					<p>Some content in westJeju 2.</p>
					<p id="attractionList" align="center"></p>
				</div>
				<div id="musuem" class="tab-pane fade">
					<h3>westJeju 3</h3>
					<p>Some content in westJeju 2.</p>
					<p id="attractionList" align="center"></p>
				</div>
				<div id="restaurant" class="tab-pane fade">
					<h3>westJeju 4</h3>
					<p>Some content in westJeju 2.</p>
					<p id="attractionList" align="center"></p>
				</div>
			</div>
		</div>
	</div>
	<div id="framewrap">
		<iframe src="/meoui/websocket.jsp" height="200" width="300"
			style="border: none;"></iframe>
	</div>
	<footer>
<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
		Removal in Cases of Overbooking https://t.co/K2aizs9IKo
		https://t.co/lb8fklloIp Twitter | 29 mins ago </h1>
	</footer>


</body>
<script>
	$(window).bind('scroll', function() {
		if ($(window).scrollTop() > 50) {
			$('#menu').addClass('navbar-fixed-top');
		} else {
			$('#menu').removeClass('navbar-fixed-top');
		}
	});
</script>
<script>
	$(function() {
		$("#framewrap").resizable().draggable();
	});
</script>
<script>
	var text = "";
	for (var i = 0; i < 16; i++) {
		text += '<div class="col-md-3"> <a href="/meoui/accomodationinfo.jsp">'
				+ '<img class="img-responsive" src="/meoui/images/jeju.jpg" alt="attraction" width="300px" height="450px"> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("attractionList").innerHTML = text;
</script>
</html>