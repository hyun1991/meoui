<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<title>The Big Picture - Start Bootstrap Template</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/the-big-picture.css" rel="stylesheet">
<style>
#box-right {
  flex: 1;
  text-align: right;
}

</style>
</head>
<body>
<body>
	<!-- Navigation -->
	<header>
	<%@include file="/nav/navbar.jsp" %>
	</header>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/cool3.jpg">
			</div>
			<div id='box-right'>
				<%@include file="/websocket.jsp" %>
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
		<!-- /.row -->
	</div>
	<%@include file="/footer.jsp"%>
</body>
</body>

</html>