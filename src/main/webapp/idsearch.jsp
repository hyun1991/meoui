<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
				아이디:${result.memberId }입니다.
			</div>
		</div>
	</div>	
</body>
</html>