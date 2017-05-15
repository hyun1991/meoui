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
<title>Insert title here</title>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="container">
		<h2>게시글 작성</h2>
		<br>
		<div class="form-group row">
			<div class="form-group col-md-3"></div>
			<div class="form-group col-md-6">
				<div class="form-group">
					<label for="usr">아이디</label>
				</div>
				<div class="form-group">
					<label for="usr">글 제목</label><input type="text"
						class="form-control" id="usr">
				</div>
				<div class="form-group">
					<label for="usr">내용</label>
					<textarea class="form-control" rows="15" id="comment"></textarea>
				</div>
				<a href="#" class="btn btn-success pull-right">글 작성</a>
			</div>
		</div>
	</div>
</body>
</html>