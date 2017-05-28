<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>관광명소 페이지</title>
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
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<h1 id="headTitle" style="margin-top: 50px;" align="center">관광명소
			리스트</h1>
		<div class="row text-center">
			<hr>
			<c:forEach items="${result.list }" var="result">
				<div class="col-sm-3">
					<a href="/meoui/site/view/${result.siteNo}"> <img
						class="image-responsive" src="/meoui/images/${site.siteImg}"
						alt="알수없음" style="margin-bottom: 20px;">
					</a>
					<p>
						<a href="/meoui/site/view/${result.siteNo}"> <strong>${result.siteName}</strong>
						</a>
					</p>
					<p>
						<a href="/meoui/site/view/${result.siteNo}">
							${result.siteIntroduce}</a>
					</p>
					<p>
						<a href="${result.siteHomepage}"> ${result.siteHomepage}</a>
					</p>
					<div class="form-group">
						<a href="/meoui/site/details?siteNo=${result.siteNo}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">상세보기</button>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/site/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/site/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/site/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>

	</div>
	<%@include file="view.jsp" %>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
</html>