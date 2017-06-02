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
		<div id="googleMap" style="height: 400px; width: 100%;" alt="구글 지도"></div>
	</div>
	</div>
	<div class="container">
		<h1 id="headTitle" style="margin-top: 50px;" align="center">서귀포시 관광명소
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
					<p>
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
	function myMap() {
		var myCenter = new google.maps.LatLng(33.282656, 126.546191);
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