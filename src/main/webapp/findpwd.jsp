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
	<link rel="stylesheet" type="text/css" href="css/hanjoon.css">
	<link rel="stylesheet" type="text/css" href="css/sejin.css">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<h2>계정정보찾기(아이디/비밀번호)</h2>
			<br>
		</div>

		<div class="row">
			<ul class="nav nav-pills">
				<li><a data-toggle="pill" href="#findId">아이디찾기</a></li>
				<li class="active"><a data-toggle="pill" href="#findPwd">비밀번호
						찾기</a></li>
			</ul>
			<br>
			<div class="tab-content">
				<div id="findId" class="tab-pane fade in active">
					<form>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이름</label> <input type="email"
									class="form-control" id="email">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email">

							</div>
							<div class="form-group">
								<label for="email"></label>
								<button type="submit" class="btn btn-default">조회</button>
							</div>
						</div>
					</form>
				</div>
				<div id="findPwd" class="tab-pane fade">
					<form>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이름</label> <input type="email"
									class="form-control" id="email">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email">

							</div>
							<div class="form-group">
								<label for="email"></label>
								<button type="submit" class="btn btn-default">조회</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




</body>
</html>