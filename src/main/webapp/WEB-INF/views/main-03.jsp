<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>제주를 부탁해</title>
</head>
<style>
#menu {
	background-color: white;
}

#googleMapBackground {
	background-color: EBF5FF;
	
}

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.container-fluid {
	font-family: 'Jeju Gothic', serif;
}
</style>

<body>
	<header>
	<%@include file="/nav/navbar.jsp" %>
	</header>
	<div class="container-fluid text-center">
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
				<div id="googleMap" style="height: 400px; width: 100%;" alt="구글 지도"></div>
			</div>
		</div>
		<div class="container">
		<h1 id="headTitle" style="margin-top: 50px;" align="center">추천숙박시설</h1>
		<div class="row text-center">
		<hr>
			<c:forEach items="${result.list }" var="accommodation">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
					<a href="/meoui/accommodaion/list?pageNo=1">
						<img class="image-responsive"
						src="/meoui/images/${accommodation.accommodationImg}"
						alt="알수없음" style="margin-bottom: 20px; height: auto; width: 260px">
					</a>
					<p>
						<a href="/meoui/accommodaion/list?pageNo=1">
							<strong>${accommodation.accommodationName}</strong>
						</a>
					</p>
					<p><a href="/meoui/accommodaion/list?pageNo=1">
							${accommodation.accommodationAddress}</a>
					</p>
				</div>
			</c:forEach>
		</div>
		<h1 id="headTitle" style="margin-top: 50px;" align="center">추천관광명소</h1>
		<div class="row text-center">
			<hr>
			<c:forEach items="${result2.list }" var="result">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
					<a href="/meoui/site/list?pageNo=1"> <img
						class="image-responsive" src="/meoui/images/${site.siteImg}"
						alt="알수없음" style="margin-bottom: 20px; height: auto; width: 260px;" >
					</a>
					<p>
						<a href="/meoui/site/list?pageNo=1"> <strong>${result.siteName}</strong>
						</a>
					</p>
					<p>
						<a href="/meoui/site/list?pageNo=1">
							${result.siteIntroduce}</a>
					</p>
					<p>
						<a href="${result.siteHomepage}"> ${result.siteHomepage}</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	<hr>
	<%@include file="/footer.jsp"%>
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
</html>