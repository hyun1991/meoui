<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>사이드 네비게이션</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
#sideNavigation{
	font-family: 'Jeju Gothic', serif;
	margin: 20px;
}
</style>
</head>
<body>
	<ul class="nav nav-pills nav-stacked" id="sideNavigation">
		<li>카테고리별 조회</li>
		<li>&nbsp</li>
		<li class="active"><a href="#">카테고리11</a></li>
		<li><a href="#">카테고리2</a></li>
		<li><a href="#">카테고리3</a></li>
		<li><a href="#">카테고리4</a></li>
		<li>&nbsp</li>
		<li>가격별 조회</li>
		<li>&nbsp</li>
		<li><a href="#">지역 1</a></li>
		<li><a href="#">지역 2</a></li>
		<li><a href="#">지역 3</a></li>
	</ul>
</body>
</html>