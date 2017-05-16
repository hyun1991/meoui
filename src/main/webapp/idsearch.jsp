<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div id="findId" class="tab-pane fade in active">
		<div class="form-group row">
			<div class="form-group col-md-6">
				<label for="email">이름</label> <input type="email"
				class="form-control" id="email" name="memberName">
			</div>
		</div>
		<div class="form-group row">
			<div class="form-group col-md-6">
				<label for="email">이메일</label> <input type="email"
				class="form-control" id="email" name="memberMail">
			</div>
			<div class="form-group">
				<label for="email"></label>
				<button type="submit" class="btn btn-default">조회</button>
			</div>
		</div>
	</div>	
</body>
</html>