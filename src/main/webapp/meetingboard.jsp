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
		<h2>모임 게시판</h2>
		<br>
		<div class="row">
			<table class="table table-hover table-responsive">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>작성자</th>
						<th>글 제목</th>
						<th>작성 날짜/시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="/meoui/article.jsp">John</a></td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>

				</tbody>
			</table>
			<div class="row text-center">
				<ul class="pagination pagination-md">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
			<div class="row">
				<a href="/meoui/writearticle.jsp" class="btn btn-success">글 작성</a>
			</div>
		</div>
	</div>
</body>
</html>