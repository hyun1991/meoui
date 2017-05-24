<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	
	<c:forEach items="${result.list }" var="result">
	<div><img src="/meoui/images/${result.siteImg}"></div><br>
	<div>
		<h3>${result.siteName }</h3>
		<h4>전화번호:${result.sitePhone }</h4>
		<h4>홈페이지:${result.siteHomepage }</h4>
		<h4>이용시간:${result.siteOpenTime }~ ${result.siteCloseTime}</h4>
		<h4>주차가능여부: ${result.sitePark }</h4>
		<h4>야간개장여부:${result.siteNightOpen } </h4>
		<h4>야간폐장시간:${result.siteNightCloseTime }</h4>
		<h4>상세주소:${result.detailsAddress }</h4>
	</div><br>

	
	</c:forEach>
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
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>

</html>