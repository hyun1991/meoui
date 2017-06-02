<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map-canvas, #map_canvas {
	height: 100%;
}

@media print {
	html, body {
		height: auto;
	}
	#map_canvas {
		height: 650px;
	}
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}
</style>
</head>
<body>
<body>
	<div id="panel">
		<b>출발지: </b> <input type="text" id="start" /> <b>도착지: </b> <input
			type="text" id="end" />
		<div>
			<strong>이용방법:</strong> <select id="mode">
				<option value="DRIVING">자동차(작동불가)</option>
				<option value="WALKING">걷기(작동불가)</option>
				<option value="BICYCLING">자전거(작동불가)</option>
				<option value="TRANSIT">대중교통</option>
			</select> <input type="button" value="길찾기" onclick="Javascript:calcRoute();" />
		</div>
	</div>
	<div id="map-canvas"></div>
</body>
</body>

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var jejudo = new google.maps.LatLng(33.510664, 126.489551);
		var mapOptions = {
			zoom : 7,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : jejudo
		}
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : jejudo
		});
		directionsDisplay.setMap(map);
	}
	

	function calcRoute() {
		var start = document.getElementById('start').value;
		var end = document.getElementById('end').value;
		var mode = document.getElementById('mode').value;

		var request = {
			origin : start,
			destination : end,
			travelMode : eval("google.maps.DirectionsTravelMode." + mode)
		};
		directionsService.route(request, function(response, status) {
			alert(status); // 확인용 Alert..미사용시 삭제
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
			}
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</html>