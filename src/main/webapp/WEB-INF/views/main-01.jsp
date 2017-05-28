<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
  margin-top: 100px;
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
		<!-- /.row -->
	</div>
	<%@include file="/footer.jsp"%>
</body>
</body>

</html>