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
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div class="container">
		<h2>게시글 보기</h2>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-2">
					<label for="usr">글 번호</label>
				</div>
				<div class="col-md-6">
					<p>1</p>
				</div>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-2">
					<label for="usr">작성자</label>
				</div>
				<div class="col-md-6">
					<p>장기백</p>
				</div>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-2">
					<label for="usr">글 제목</label>
				</div>
				<div class="col-md-6">
					<p>1</p>
				</div>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-2">
					<label for="usr">내용</label>
				</div>
				<div class="col-md-8">
					<p>Just wanted to add that you shouldn't use href attribute on
						a tr, since it's not a valid attribute for this element. Use data
						attributes instead: data-url="{linkurl}" and in js code:
						$(this).data('url') – Maksim Vi. Jan 17 '14 at 19:57 8 You can
						avoid using a class on each row, and decorate the table with a
						class name of clickable_row (CamelCase is against HTML standards
						and should be lower case (I had issues with cross browser a few
						times with this)) and then the jQuery is $('.clickable_row
						tr').click(function ... But really you should be using data- to
						hold data, instead of href since that is the specification for
						custom data. data-url and jquery will access it like
						$(this).data(url); – ppumkin Apr 14 '14 at 19:58 18 Not a big fan
						of this solution because users don't see the link URL at the
						bottom of the browser when hovering, and more importantly can't
						wheel-click on the link to open it in a new tab. Inserting an a
						tag with display: block; inside each cell is a bit annoying but it
						seems like the most usable way to solve this issue. – Maxime
						Rossini Dec 4 '14 at 10:18</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div class="col-md-2">
					<label for="usr">변은지</label>
				</div>
				<div class="col-md-8">
					<p>Just wanted to add that you shouldn't use href attribute ona
						tr, since it's not a valid attribute for this element. Use data
						attributes instead: data-url="{linkurl}" and in js code:
						$(this).data('url') – Maksim Vi. Jan 17 '14 at 19:57 8 You can
						avoid using a class on each row, and decorate the table with a
						class name of clickable_row (CamelCase is against HTML standards
						and should be lower case (I had issues with cross browser a few
						times with this)) and then the jQuery is $('.clickable_row</p>
				</div>
				<br>
			</div>
		</div>
		<div class="form-group row">
			<div class="form-group col-md-2"></div>
			<div class="form-group col-md-8">
				<div class="form-group">
					<label for="usr">댓글</label>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="4" id="comment"></textarea>
				</div>
				<a href="/meoui/meetingboard.jsp" class="btn btn-success pull-left">게시판으로</a>
				<a href="#" class="btn btn-success pull-right">댓글 작성</a>
			</div>
		</div>
	</div>
</body>
</html>