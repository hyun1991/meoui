<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/navbar.jsp"%>
	<div class="container">
		<h2>게시글 작성</h2>
		<br>
		<div class="form-group row">
			<div class="form-group col-md-6 col-md-offset-3">
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
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>