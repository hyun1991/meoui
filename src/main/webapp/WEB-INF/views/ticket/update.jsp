<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/nav/adminnav.jsp" %>
	<h1>티켓 수정페이지</h1>
	<hr>
	<form action="/meoui/admin/ticket/update" method="post" >
		<hr>
		<div>
			<div class="form-group">
				<select class="form-control input-lg"  id="ticketStandard" name="ticketStandard">
					<option value="">선택</option>
					<option value="성인">성인</option>
					<option value="청소년">청소년</option>
					<option value="소인">소인</option>
				</select>
			</div>
			<div class="form-group">
				<label>티켓 가격</label><input type="text" name="ticketPrice" id="ticketPrice" class="form-control">
			</div>
			<div class="btn-group">
				<input type="submit" value="티켓 가격 수정" id="confirmBtn" class="btn btn-primary">
				<a href="/meoui/admin/site/list?pageNo=1"><input type="button" value="리스트로" id="confirmBtn" class="btn btn-primary"></a>
			</div>
		</div>
	</form>
</body>
</html>