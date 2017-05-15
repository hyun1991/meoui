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
	<link rel="stylesheet" type="text/css" href="css/hanjoon.css">
	<link rel="stylesheet" type="text/css" href="css/sejin.css">
<title>Main Page</title>
</head>
<body>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-2">
				<%@include file="/sideNavigation.jsp"%>
			</div>
			<div class="col-md-10">
				<div class="row">
					<form class="form-inline pull-right">
						<div class="input-group">
							<input type="search" class="form-control" size="50"
								placeholder="검색" required>
							<div class="input-group-btn">
								<button type="button" class="btn btn-success">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="row">
					<br>
					<h3>카테고리 별 제주 관광명소 노출</h3>
					<br>
					<p id="attractionList" align="center"></p>
				</div>
			</div>
		</div>

	</div>


	<script>
		var text = "";
		for (var i = 0; i < 20; i++) {
			text += '<div class="col-md-3"> <a href="/meoui/attractioninfo.jsp">'
					+ '<img class="img-responsive" src="/meoui/images/jeju.jpg" alt="attraction" width="250" height="170"> <div class="caption"> <p>Lorem ipsum...</p></div></a></div>';
		}
		document.getElementById("attractionList").innerHTML = text;
	</script>

</body>
</html>