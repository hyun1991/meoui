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
#menu {
	background-color: white;
}

#googleMapBackground {
	background-color: #51b0ff;
}
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.container-fluid {
	font-family: 'Jeju Gothic', serif;
}
</style>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="container-fluid text-center">
		<div class="row">
			<ul class="nav nav-tabs" id="menu">
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-2"><a data-toggle="tab" href="#allCategory">카테고리
						전체&nbsp<span class="badge">5</span>
				</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#leisure"
					alt="잠수함/유람선/레저" id="레저">잠수함/유람선/레저&nbsp<span class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#theater">공연장/상영관/기타&nbsp<span
						class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#musuem">테마공원/박물관&nbsp<span
						class="badge">5</span></a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#restaurant">음식점&nbsp<span
						class="badge">5</span></a></li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
			</ul>
		</div>

		<div class="row">
			<form class="form-inline">
				<div class="input-group">
					<input type="search" class="form-control input-lg" size="40"
						placeholder="목적지" required style="margin: 50px;">
					<div class="input-group-btn">
						<button type="button" class="btn btn-info btn-lg">검색</button>
					</div>
				</div>
			</form>
		</div>

		<div class="container text-center">
			<div class="row" id="googleMapBackground">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div id="googleMap" style="height: 400px; width: 100%;" alt="구글 지도"></div>
				</div>
			</div>

			<div class="tab-content">
				<div id="allCategory" class="tab-pane fade in active">
					<h3 class="text-left" style="margin: 50px;">카테고리</h3>
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
	<%@include file="/websocket.jsp"%>
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
	function myMap() {
		var myCenter = new google.maps.LatLng(33.386581, 126.558209);
		var mapProp = {
			center : myCenter,
			zoom : 10,
			scrollwheel : false,
			draggable : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
		var marker = new google.maps.Marker({
			position : myCenter
		});
		marker.setMap(map);
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQhKWycyWtScR72Jxc_E-FKHq4-F2b4CM&callback=myMap"></script>

<script>
	var text = "";
	for (var i = 0; i < 12; i++) {
		text += '<div class="col-md-3"> <a href="/meoui/accomodationinfo.jsp">'
				+ '<img class="img-responsive" src="/meoui/images/jeju.jpg" alt="attraction" width="300" height="550"> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
	}
	document.getElementById("attractionList").innerHTML = text;
</script>
</html>