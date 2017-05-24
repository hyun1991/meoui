<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Main Page</title>
</head>
<style>
body, div.row {
	width: 100%;
	height: 100%;
	color:#424242;
}

#mapContainer {
	width: 75%;
	height: 100%;
}

@keyframes menuBlink {
	0% {opacity: 0}
	49%{opacity: 0}
	50% {opacity: 1}
}
.glyphicon-road {animation: menuBlink 1s infinite;}

</style>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
	<div class="row">
		<div class="col-md-9" id=mapContainer>
			<div id="googleMap" style="width: 100%; height: 800px;"></div>
		</div>
		<div class="col-md-3">
			<div class="row text-center">
				<h4>길찾기</h4>
				<br>
			</div>
			<div class="row">
				<form>
					<div class="form-group">
						<label for="email">출발지</label> <input type="email"
							class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="email">도착지</label> <input type="email"
							class="form-control" id="email">
					</div>
					<div class="form-group text-center">
						<label for="email"></label>
						<button type="submit" class="btn btn-default">조회</button>
					</div>
				</form>
			</div>
			<div class="row">
				<label for="usr">이동 거리</label><br>
				<p>장기백</p>
				<br> <label for="usr">소요 시간</label><br>
				<p>장기백</p>
				<br> <label for="usr">출발 시간</label><br>
				<p>장기백</p>
				<br> <label for="usr">도착 시간</label>
				<p>장기백</p>
				<br> <label for="usr">자세한 위치 정보</label>
				<p>장기백 : 말했잖아 지금 왜 듣질않아 왜 듣지도 않고 그러냐 뭘 ㅋㅋㅋㅋㅋㅋ 근데 아 알았어 음...언제 한
					줄 끝나</p>
			</div>
		</div>
	</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>

<script>
	function myMap() {
		var myCenter = new google.maps.LatLng(33.4953846, 126.5285386);
		var mapProp = {
			center : myCenter,
			zoom : 13,
			scrollwheel : true,
			draggable : true,
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
</html>