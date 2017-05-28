<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<%@include file="/nav/navbar.jsp" %>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">자유게시판 추가</h1>
	<hr>
	<form action="/meoui/freeboard/join" method="post" enctype="multipart/form-data">
		<hr>
		<div>
			<div class="form-group">
				<label>제목</label><input type="text" id="freeboardTitle" name="freeboardTitle" class="form-control">
			</div>
			<div class="form-group">
				<label>내용</label><br>
				<textarea class="form-control col-sm-5" rows="5"
					placeholder="댓글을 작성해 주세요." name="freeboardContent">
				</textarea>
			</div>
			<div class="form-group">
				<label>첨부파일</label><input type="file" name="img" id="freeboardImg" class="form-control">
			</div>
			<div class="btn-group">
				<input type="submit" value="자유게시판 추가" id="confirmBtn" class="btn btn-primary">
				<a href="/meoui/freeboard/list?pageNo=1"><input type="button" value="돌아가기" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	</form>
</body>
</html>