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
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li>카테고리별 조회</li>
					<li>&nbsp</li>
					<li class="active"><a href="#">카테고리1</a></li>
					<li><a href="#">카테고리2</a></li>
					<li><a href="#">카테고리3</a></li>
					<li><a href="#">카테고리4</a></li>
					<li>&nbsp</li>
					<li>지역별 조회</li>
					<li>&nbsp</li>
					<li><a href="#">지역 1</a></li>
					<li><a href="#">지역 2</a></li>
					<li><a href="#">지역 3</a></li>
				</ul>
			</div>
			<div class="col-md-10">
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
			<div class="col-md-9">
				<br>
				<h3>카테고리 별 제주 관광명소 노출</h3>
				<br>	
			</div>
		</div>
		
	</div>
	
	
	

</body>
</html>