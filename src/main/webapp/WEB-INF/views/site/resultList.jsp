<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>관광명소 페이지</title>
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

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container text-center">
	<div class="row" id="googleMapBackground">
		<div id="map" style="height: 400px; width: 100%;" alt="구글 지도"></div>
	</div>
	</div>
	<div class="container">
		<h1 id="headTitle" style="margin-top: 50px;" align="center">관광명소
			리스트</h1>
		<div class="row text-center">
			<hr>
			<c:forEach items="${result.list }" var="result">
				<div class="col-sm-3"
					style="overflow-x: hidden; overflow-y: hidden; width: 280px; height: 500px;">
					<a href="/meoui/site/detail/${result.siteNo}"> <img
						class="image-responsive" src="/meoui/images/${result.siteImg}"
						alt="알수없음"
						style="margin-bottom: 20px; width: 400px; height: 200px;">
					</a>
					<p>
						<a href="/meoui/site/detail/${result.siteNo}"> <strong>${result.siteName}</strong>
						</a>
					</p>
					<p id="selector">
						<a href="#"> ${result.siteOpenTime }~${result.siteCloseTime }까지</a>
					</p>
					<p style="text-overflow: ellipsis; width: 280px; overflow: hidden;white-space: nowrap;
					text-overflow: ellipsis;">
						<a href="${result.siteHomepage}"> ${result.siteHomepage}</a>
					</p>
					<div class="form-group">
						<a href="/meoui/site/detail/${result.siteNo}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">상세보기</button>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/site/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/site/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/site/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
	<hr>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<script>
function initMap() {

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 10,
	    center: {lat: 33.3850285, lng: 126.62044279999998}
	  });
		
	  	
	  // Create an array of alphabetical characters used to label the markers.
	  var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

	  // Add some markers to the map.
	  // Note: The code uses the JavaScript Array.prototype.map() method to
	  // create an array of markers based on a given "locations" array.
	  // The map() method here has nothing to do with the Google Maps API.
	  var markers = locations.map(function(location, i) {
	    return new google.maps.Marker({
	      position: location,
	      label: labels[i % labels.length]
	    });
	  });

	  // Add a marker clusterer to manage the markers.
	  var markerCluster = new MarkerClusterer(map, markers,
	      {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
	}
	var locations = [
		{lat: 33.3850285, lng: 126.62044279999998},
		{lat: 33.2889802, lng: 126.37013490000004},
		{lat: 33.4235416, lng: 126.92932659999997},
		{lat: 33.45805600000001, lng : 126.9425},
		{lat: 33.2486522, lng: 126.41243740000004},
		{lat: 33.246944, lng: 126.55441700000006},
		{lat: 33.2448521, lng: 126.57180319999998},
		{lat: 33.1994444, lng: 126.29055560000006},
		{lat: 33.2410682, lng: 126.31344669999999},
		{lat: 33.231847, lng: 126.31464099999994},
		{lat: 33.26854, lng: 126.49990100000002},
		{lat: 33.2525446, lng: 126.6235206},
		{lat: 33.305894, lng: 126.28942000000006},
		{lat: 33.4316207, lng: 126.6900058},
		{lat: 33.451638, lng: 126.49000000000001},
		{lat: 33.393962, lng:126.23909839999999},
		{lat: 33.5559836,lng: 126.79622810000001},
		{lat: 33.5434231, lng: 126.6697752},
		{lat: 33.5161459, lng: 126.5118814},
		{lat: 33.5064851, lng: 126.53161499999999},
		{lat: 33.4729129, lng: 126.93424570000002},
		{lat: 33.528486, lng: 126.771481},
		{lat: 33.4875808, lng: 126.80806159999997},
		{lat: 33.4887415, lng: 126.80095140000003},
		{lat: 33.4599676, lng: 126.83147699999995},
		{lat: 33.5252938, lng: 126.86111170000004}
	]
	
    
	</script>
	  <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
	    </script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQhKWycyWtScR72Jxc_E-FKHq4-F2b4CM&callback=initMap"></script>
</html>