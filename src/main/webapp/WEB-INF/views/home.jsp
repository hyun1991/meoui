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
nav{
	margin-bottom:0;
}
header {
	background-image: url(/meoui/images/sky.jpg);
	background-size: 100%;
	background-repeat: no-repeat;
}

#menu {
	font-family: 'Jeju Gothic', serif;
}

#text, p, header {
	color: black;
}

footer {
	background-color: #008769;
}
</style>
<body>
	<%@include file="/navbar.jsp"%>
	<header>
		<form class="form-inline">
			<div class="input-group" style="margin-bottom: 0;">
				<input type="search" class="form-control input-md" size="30"
					placeholder="목적지" required style="margin: 50px;">
				<div class="input-group-btn">
					<button type="button" class="btn btn-default btn-md"
						style="margin-left: 50px; color:white; background-color:#008769">검색</button>
				</div>
			</div>
		</form>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">뭐라도 써보자</h1>
		<h1 style="margin-left: 800px;">canvas자리</h1>
	</header>
	<div class="container-fluid text-center" id="navline">
		<div class="row">
			<ul class="nav nav-tabs" id="menu" style="display: inline-block;">
				<li><a
					data-toggle="tab" href="#allCategory" id="text">전체&nbsp<span
						class="badge">5</span>
				</a></li>
				<li><a data-toggle="tab"
					href="#leisure" alt="잠수함/유람선/레저" id="text">잠수함/유람선/레저&nbsp<span
						class="badge">5</span></a></li>
				<li><a data-toggle="tab"
					href="#theater" id="text">공연장/상영관/기타&nbsp<span class="badge" >5</span></a></li>
				<li><a data-toggle="tab"
					href="#musuem" id="text">테마공원/박물관&nbsp<span class="badge">5</span></a></li>
					<li><a data-toggle="tab"
					href="#spa" id="text">온천/스파&nbsp<span class="badge">5</span></a></li>
				<li><a data-toggle="tab"
					href="#restaurant" id="text">음식점&nbsp<span class="badge">5</span></a></li>
			</ul>
		</div>
	</div>
	<section>
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
	</section>
	<footer>
		<div id="contact" class="container">
			<div class="row">
				<div class="col-md-3">
					<p>Fan? Drop a note.</p>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span>Chicago, US
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span>Phone: +00
						1515151515
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>Email:
						mail@mail.com
					</p>
				</div>
				<div class="col-md-3">
					<ul class="nav navbar-nav">
						<li><a href=""><i class="fa fa-facebook"
								style="font-size: 50px"></i></a></li>
						<li><a href=""><i class="fa fa-twitter"
								style="font-size: 50px"></i></a></li>
						<li><a href=""><i class="fa fa-instagram"
								style="font-size: 50px"></i></a></li>
					</ul>
				</div>
				<div class="col-md-6">
					<h2>1 Follow Us Canada's New Passenger Bill of Rights Bans
						Removal in Cases of Overbooking https://t.co/K2aizs9IKo
						https://t.co/lb8fklloIp Twitter | 29 mins ago</h2>
				</div>
			</div>
			<div class="row text-center">
			
				<p>트래포트(주) Travelhow.com은 통신판매중개자로서 통신판매의 당사자가 아니며, 상품주문, 배송 및
					환불의 의무와 책임은 각각의 판매업체에 있습니다. 사업자등록번호 : 211-88-19164통신판매업 :
					제2011-서울금천-0150호대표이사 : 안경열개인정보관리책임자 : 김영권 사업자정보확인 주소 : 서울특별시 금천구
					가산디지털1로 145 에이스하이엔드타워 3차 604호 [08506]대표전화 : 1644-8668팩스번호 :
					02-2178-9393 Traport. Copyright (c) 2015 Traport..com Inc. All
					Rights Reserved.</p>
			</div>
		</div>
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
	for (var i = 0; i < 6; i++) {
		text += '<div class="col-md-4"> <a href="/meoui/accomodationinfo.jsp">'
				+ '	<video loop width="300" height="auto" autoplay> <source src="/meoui/videos/live1.mp4" type="video/mp4"> </video> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("attractionList").innerHTML = text;
</script>
</html>