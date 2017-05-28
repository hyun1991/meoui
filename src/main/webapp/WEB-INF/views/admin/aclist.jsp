<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>숙박업소 리스트</title>
<style>
@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity
:
 
0
}
50%{
opacity
:
1
}
}
#headTitle, .step {
	font-family: 'Jeju Gothic', serif;
}

@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity


:


0
}
50%{
opacity


:


1
}
}
.glyphicon-home {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
</head>
<body>
	<header>
	<%@include file="/nav/adminnav.jsp" %>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">등록된 숙박시설 리스트</h1>
	<hr>
		<div class="container">
			<c:forEach items="${result.list }" var="accommodation">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
				<a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<img class="image-responsive" src="/meoui/images/${accommodation.accommodationImg}"
					alt="알수없음" style="margin-bottom: 20px;">
				</a>
				<p><a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<strong>${accommodation.accommodationName}</strong></a></p>
				<p>${accommodation.accommodationAddress}</p>
				<div class="form-group">
				<a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button></a>
				</div>
				</div>
			</c:forEach>
		</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/admin/accommodaion/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/admin/accommodaion/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/admin/accommodaion/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>