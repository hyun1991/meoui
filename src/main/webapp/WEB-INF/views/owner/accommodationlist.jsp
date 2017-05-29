<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>등록된 숙박업소 리스트</title>
</head>
<style>
body {
	font-family: 'Jeju Gothic', serif;
}
img{
	width: 260px;
	height: auto;
}
</style>
<body>
	<header>
	<%@include file="/nav/ownernav.jsp" %>
	</header>
	<div class="container">
		<h1 id="headTitle" style="margin-top: 50px;">등록된 숙박시설 리스트</h1>
	<hr>
	<div class="row"  style="margin-bottom: 50px;">
		<div class="col-md-10">
		</div>
		<div class="form-group">
		<a href="/meoui/manage/accommodation/join"><button type="button" class="w3-button  w3-white w3-border">
		숙박업소 추가하기</button></a>
	</div>
	</div>	
			<c:forEach items="${result.list }" var="accommodation">
				<div class="col-sm-3">
				<a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<img class="image-responsive" src="/meoui/images/${accommodation.accommodationImg}"
					alt="알수없음" style="margin-bottom: 20px;">
				</a>
				<p><a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<strong>${accommodation.accommodationName}</strong></a></p>
				<p>${accommodation.accommodationAddress}</p>
				<div class="form-group">
				<a href="/meoui/manage/accommodation/view/${accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-white w3-border">
					상세보기</button></a>
				</div>
				<div class="form-group">
				<a href="/meoui/manage/accommodation/delete/${accommodation.accommodationNo}">
					<button type="button" class="w3-button w3-white w3-border">
					삭제하기</button></a></div><br>
				</div>
			</c:forEach>
		</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/notice/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/notice/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/notice/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>



</body>
</html>