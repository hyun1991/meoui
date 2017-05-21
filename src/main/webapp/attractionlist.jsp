<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>숙박시설</title>
<style>

#base{
	background-image: url(/meoui/images/buddah.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
}


#headTitle, navline {
	font-family: 'Jeju Gothic', serif;
}

@keyframes menuBlink { 0% {
	opacity: 0
}
49%{
opacity:0}
50%{opacity:1}
}
.glyphicon-grain {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: green;
	margin: 30px;
}
</style>
</head>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>

<div class="container" id="base">
	<form class="form-inline">
		<div class="input-group" style="margin-bottom: 0;">
			<input type="search" class="form-control input-md" size="30"
				placeholder="목적지" required style="margin: 50px;" style="opacity:1;">
			<div class="input-group-btn">
				<button type="button" class="btn btn-default btn-md"
					style="margin-left: 50px; color: white; background-color: #008769">검색</button>
			</div>
		</div>
	</form>
	<div class="container-fluid text-center" id="navline">
		<div class="row">
			<ul class="nav nav-tabs" id="menu" style="display: inline-block;">
				<li><a data-toggle="tab" href="#allCategory" id="text">전체&nbsp<span
						class="badge">5</span>
				</a></li>
				<li><a data-toggle="tab" href="#leisure" alt="잠수함/유람선/레저"
					id="text">잠수함/유람선/레저&nbsp<span class="badge">5</span></a></li>
				<li><a data-toggle="tab" href="#theater" id="text">공연장/상영관/기타&nbsp<span
						class="badge">5</span></a></li>
				<li><a data-toggle="tab" href="#musuem" id="text">테마공원/박물관&nbsp<span
						class="badge">5</span></a></li>
				<li><a data-toggle="tab" href="#spa" id="text">온천/스파&nbsp<span
						class="badge">5</span></a></li>
				<li><a data-toggle="tab" href="#restaurant" id="text">음식점&nbsp<span
						class="badge">5</span></a></li>
			</ul>
		</div>
	</div>
		<div class="container">
			<div class="tab-content">
				<div id="allCategory" class="tab-pane fade in active">
					<h4 class="text-left" style="margin: 50px;">
						<i class="fa fa-map" style="font-size: 24px; margin-right: 10px;"></i>카테고리
					</h4>
					<p id="attractionList" align="center"></p>
				</div>
				<div id="leisure" class="tab-pane fade">
					<h3>westJeju 1</h3>
					<p>Some content in westJeju 1.</p>

					<div id="framewrap">
						<iframe src="/meoui/websocket.jsp" height="200" width="300"
							style="border: none;"></iframe>
					</div>
				</div>
				<div id="theater" class="tab-pane fade">
					<h3>westJeju 2</h3>
					<p>Some content in westJeju 2.</p>
				</div>
				<div id="musuem" class="tab-pane fade">
					<h3>westJeju 3</h3>
					<p>Some content in westJeju 2.</p>
				</div>
				<div id="spa" class="tab-pane fade">
					<h3>westJeju 4</h3>
					<p>Some content in westJeju 2.</p>
				</div>
				<div id="restaurant" class="tab-pane fade">
					<h3>westJeju 4</h3>
					<p>Some content in westJeju 2.</p>
				</div>
			</div>
		</div>
		</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<script>
	var text = "";
	for (var i = 0; i < 6; i++) {
		text += '<div class="col-md-4"> <a href="/meoui/accomodationinfo.jsp">'
				+ '	<video loop width="300" height="auto" autoplay> <source src="/meoui/videos/live1.mp4" type="video/mp4"> </video> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("attractionList").innerHTML = text;
</script>
</html>