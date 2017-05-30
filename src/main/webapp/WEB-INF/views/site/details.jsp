<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<style>
</style>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/${result.siteImg}">
			</div>
			<div>
				<h3>${result.siteName }</h3>
			</div>
			<div>
				<h3>대표전화</h3>${result.sitePhone }
			</div>
			<div>
				<h3>주소</h3>${result.detailsAddress }
			</div>
			<div>
				<h3>이용대상</h3>${result.siteObject }
			</div>
			<div>
				<h3>주차</h3>${result.sitePark }
			</div>
			<div>
				<h3>이용시간</h3>${result.siteOpenTime }~${result.siteCloseTime }
			</div>
			<div>
				<h3>야간개장여부</h3>${result.siteNightOpen }
			</div>
			<div>
				<h3>야간개장 시 폐장시간</h3>${result.siteNightCloseTime }
			</div>
			<div>
			<h3>입장료</h3>
			<c:forEach items="${result1.list }" var="result1">
				<table>
					<tr>
						<td>${result1.ticketStandard } : ${result1.ticketPrice }</td>
					</tr>
				</table>
			</c:forEach>
			</div>
		
			<div class="col-xs-4">
					<a href="/meoui/site/update">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">관광지 수정</button>
						</a>
							<a href="/meoui/ticket/insert">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 추가</button>
						</a>
							<a href="/meoui/ticket/update">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 수정</button>
						</a>
						<a
						href="/meoui/site/delete/${result.siteNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border" id="deleteBtn">
							삭제하기</button>
						</a>
				<a href="/meoui/admin/site/list?pageNo=1"><button
							type="button" class="w3-button w3-block w3-white w3-border">
							리스트로 이동</button></a>
			</div>
		</div>
		
	</div>

	
	
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>

</html>