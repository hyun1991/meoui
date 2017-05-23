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
@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity
:
 
0
}
50%{
opacity
:
1
}
}
#headTitle, .step {
	font-family: 'Jeju Gothic', serif;
}

@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity


:


0
}
50%{
opacity


:


1
}
}
.glyphicon-home {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<div class="row text-center">
			<div class="col-md-1">
				<h4 class="step" style="margin-top: 80px">STEP 1</h4>
				<hr style="border: 10px solid orange; margin-bottom: 50px;">
				<h6 class="step" style="margin-top: 20px">지역</h6>
			</div>
			<div class="col-md-4">
				<div id="map" style="width: 100%; height: 250px;"></div>
			</div>
			<div class="col-md-1">
				<h4 class="step" style="margin-top: 80px">STEP 2</h4>
				<hr style="border: 10px solid orange; margin-bottom: 50px;">
				<h6 class="step" style="margin-top: 20px">가격</h6>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-1">
				<h4 class="step" style="margin-top: 80px">STEP 3</h4>
				<hr style="border: 10px solid orange; margin-bottom: 50px;">
				<h6 class="step" style="margin-top: 20px">옵션</h6>
			</div>
		</div>
		<h1 id="headTitle" style="margin-top: 50px;">숙박시설 리스트</h1>
		<div class="row text-center">
			<c:forEach items="${result.list }" var="accommodation">
				<div class="col-sm-3">
					<a
						href="/meoui/accommodation/view/${accommodation.accommodationNo}">
						<img class="image-responsive"
						src="/meoui/images/${accommodation.accommodationImg}"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>

					<p>
						<a
							href="/meoui/accommodation/view/${accommodation.accommodationNo}">
							<strong>${accommodation.accommodationName}</strong>
						</a>
					</p>
					<p>
						<a
							href="/meoui/accommodation/view/${accommodation.accommodationNo}">
							${accommodation.accommodationAddress}</a>
					</p>
					<div class="form-group">
						<a href="/meoui/accommodation/view/${accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button></a>
				</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/notice/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/notice/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/notice/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new daum.maps.LatLng(33.3700000, 126.5450000),
		draggable : false,
		level : 11
	};

	var map = new daum.maps.Map(container, options);

	function setZoomable(zoomable) {
		map.setZoomable(zoomable);
	}

	var jejuCity = [
			new daum.maps.LatLng(33.560035108105060, 126.67059381623066),
			new daum.maps.LatLng(33.505086291544086, 126.43263296172184),
			new daum.maps.LatLng(33.349682513554554, 126.41321034054742),
			new daum.maps.LatLng(33.388346760004206, 126.64035740081413) ];

	var seoguipoCity = [
			new daum.maps.LatLng(33.230035108105060, 126.69059381623066),
			new daum.maps.LatLng(33.215086291544086, 126.39863296172184),
			new daum.maps.LatLng(33.349682513554554, 126.41321034054742),
			new daum.maps.LatLng(33.388346760004206, 126.64035740081413) ];

	var jejuWest = [
			new daum.maps.LatLng(33.505086291544086, 126.43263296172184),
			new daum.maps.LatLng(33.215086291544086, 126.39863296172184),
			new daum.maps.LatLng(33.155086291544086, 126.25563296172184),
			new daum.maps.LatLng(33.259682513554554, 126.16821034054742),
			new daum.maps.LatLng(33.359682513554554, 126.15121034054742),
			new daum.maps.LatLng(33.480346760004206, 126.32035740081413), ];

	var jejuEast = [
			new daum.maps.LatLng(33.560035108105060, 126.67059381623066),
			new daum.maps.LatLng(33.388346760004206, 126.64035740081413),
			new daum.maps.LatLng(33.230035108105060, 126.69059381623066),
			new daum.maps.LatLng(33.300682513554554, 126.84121034054742),
			new daum.maps.LatLng(33.509882513554554, 126.99021034054742),
			new daum.maps.LatLng(33.569346760004206, 126.84835740081413), ];

	var jejuArea = new daum.maps.Polygon({
		path : jejuCity, // 그려질 다각형의 좌표 배열입니다
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#424242', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : 'orange', // 채우기 색깔입니다
		fillOpacity : 0.7
	// 채우기 불투명도 입니다
	});

	var seoguipoArea = new daum.maps.Polygon({
		path : seoguipoCity, // 그려질 다각형의 좌표 배열입니다
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#424242', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : 'orange', // 채우기 색깔입니다
		fillOpacity : 0.7
	// 채우기 불투명도 입니다
	});

	var westArea = new daum.maps.Polygon({
		path : jejuWest, // 그려질 다각형의 좌표 배열입니다
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#424242', // 선의 색깔입니다
		strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : 'orange', // 채우기 색깔입니다
		fillOpacity : 0.7
	// 채우기 불투명도 입니다
	});

	var eastArea = new daum.maps.Polygon({
		path : jejuEast, // 그려질 다각형의 좌표 배열입니다
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#424242', // 선의 색깔입니다
		strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : 'orange', // 채우기 색깔입니다
		fillOpacity : 0.7
	// 채우기 불투명도 입니다
	});

	eastArea.setMap(map);
	westArea.setMap(map);
	jejuArea.setMap(map);
	seoguipoArea.setMap(map);
</script>
</html>