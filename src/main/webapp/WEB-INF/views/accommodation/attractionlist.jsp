<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
footer {
	background-color: grey;
}
</style>
</head>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>
		<div class="container">
				<div class="row">
					<hgroup style="margin-bottom: 50px;">
						<h1>카테고리 별 제주 숙박업소 노출</h1>
						<h2>카테고리별로 조회해보세요.</h2>
					</hgroup>
				</div>

			<c:forEach items="${result.list }" var="accommodation">
				<div><a href="/meoui/accommodation/view${accommodation.accommodationNo}"><img src="/meoui/images/${accommodation.accommodationImg}"></a></div>
				<div><a href="/meoui/accommodation/view${accommodation.accommodationNo}">${accommodation.accommodationName}</a></div><br>
			</c:forEach>
		</div>
		<div style="width:300px; margin:0 auto;">
		<c:if test="${result.pagination.prev>0 }"><a href="/meoui/accommodation/list?pageNo=${result.pagination.prev}">이전으로</a></c:if>
		<c:forEach var="i" begin="${result.pagination.startPaging}" end="${result.pagination.lastPaging}">
			<a href="/meoui/accommodation/list?pageNo=${i}">${i} </a>
		</c:forEach>
		<c:if test="${result.pagination.next>0 }"><a href="/meoui/accommodation/list?pageNo=${result.pagination.next}">다음으로</a></c:if>
	</div>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
</html>