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
<body>

	<%@include file="/WEB-INF/views/navbar.jsp"%>

	<div class="container-fluid text-center">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div id="googleMap" style="height: 400px; width: 100%;"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-2 active"><a data-toggle="tab"
					href="#allCategory">카테고리 전체</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#leisure">잠수함/유람선/레저()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#theater">공연장/상영관/기타()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#musuem">테마공원/박물관()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#restaurant">음식점()</a></li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-1">
					<p>&nbsp</p>
				</li>
				<li class="col-md-2"><a data-toggle="tab" href="#allRegion">지역별
						전체()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#jejuCity">제주시()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#seogwipo">서귀포시/중문()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#seogwipo">제주
						동부()</a></li>
				<li class="col-md-2"><a data-toggle="tab" href="#seogwipo">제주
						서부()</a></li>

			</ul>
		</div>

		<div class="container text-center">
			<div class="row">
				<form class="form-inline">
					<div class="input-group">
						<input type="search" class="form-control" size="50"
							placeholder="검색" required>
						<div class="input-group-btn">
							<button type="button" class="btn btn-success">검색</button>
						</div>
					</div>
				</form>
			</div>

			<div class="jumbotron">
				<h4>카테고리 별 제주 관광명소 노출</h4>
			</div>
		</div>

		<div class="tab-content">
			<div id="allCategory" class="tab-pane fade in active">
				<h3>카테고리</h3>
				<p>Some content.</p>
			</div>
			<div id="leisure" class="tab-pane fade">
				<h3>westJeju 1</h3>
				<p>Some content in westJeju 1.</p>
			</div>
			<div id="theater" class="tab-pane fade">
				<h3>westJeju 2</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="musuem" class="tab-pane fade">
				<h3>westJeju 3</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="restaurant" class="tab-pane fade">
				<h3>westJeju 4</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="allRegion" class="tab-pane fade">
				<h3>westJeju 5</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="jejuCity" class="tab-pane fade">
				<h3>westJeju 2</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="seogwipo" class="tab-pane fade">
				<h3>westJeju 2</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="eastJeju" class="tab-pane fade">
				<h3>westJeju 2</h3>
				<p>Some content in westJeju 2.</p>
			</div>
			<div id="westJeju" class="tab-pane fade">
				<h3>westJeju 2</h3>
				<p>Some content in westJeju 2.</p>
			</div>
		</div>
	</div>

</body>
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