<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header>
	<%@include file="/nav/navbar.jsp" %>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">자유게시판 수정</h1>
	<form action="/meoui/freeboard/update" method="post" enctype="multipart/form-data">
	<hr>
		<div>
			<div class="form-group">
				<label>제목</label><input type="text" id="freeboardTitle" name="freeboardTitle" class="form-control">
			</div>
			<div class="form-group">
				<label>내용</label><br>
				<textarea class="form-control col-sm-5" rows="5"
				 name="freeboardContent">
				</textarea>
			</div>
			<div class="form-group">
				<label>첨부파일</label><input type="file" name="img" id="freeboardImg" class="form-control">
			</div>
			<div class="btn-group">
				<input type="submit" value="자유게시판 수정" id="confirmBtn" class="btn btn-primary">
				<a href="/meoui/freeboard/list?pageNo=1"><input type="button" value="돌아가기" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	
	</form>
</body>
</html>