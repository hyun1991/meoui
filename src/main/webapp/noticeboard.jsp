<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>자유게시판</title>
</head>
<style>
#title, #type {
	font-size: 30px;
	margin: 20px;
}

#noticeTitle {
	border-bottom: none;
}

h4 {
	font-size: 30px;
	display: inline;
}

#headTitle {
	font-family: 'Jeju Gothic', serif;
}

@keyframes menuBlink {
	0% {opacity: 0}
	49%{opacity: 0}
	50% {opacity: 1}
}
.glyphicon-eye-open {
	animation: menuBlink 1s infinite;
}

.universe {
	background-image: url(/meoui/images/universe.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container universe">
		<div class="row">
			<div class="col-md-2 text-center">
				<h2 id="headTitle" style="margin-top: 80px; color: white;">워프게이트</h2>
				<hr style="border: 4px solid purple; margin-bottom: 50px;">
				<div>
					<button type="submit" class="btn btn-default">#인기 관광지</button>
					<button type="submit" class="btn btn-default">#높은 인구수</button>
					<button type="submit" class="btn btn-default">#낮은 인구수</button>
					<button type="submit" class="btn btn-default">#가장 발전된</button>
					<button type="submit" class="btn btn-default">#새로 태어난</button>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row text-center" style="height: 700px;" id="universe">
					<div class="col-md-2">
						<a href="/meoui/writenotice.jsp" class="btn btn-default">글 작성</a>
					</div>
					<ul class="pagination pagination-md">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
				<div class="row"></div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>	
</html>