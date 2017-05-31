<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
body{
	color:#424242;
}
</style>
<body>
	<footer>
		<div id="contact" class="container">
			<div class="row" style="margin-left: 0;">
				<div class="col-md-3">
					<p>(주)MEOUI</p>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span>Incheon, Korea
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span>Phone: +00
						032-888-8282
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>Email:
						mail@mail.com
					</p>
				</div>
				<div class="col-md-3" style="margin-left: 100px;margin-right: 85px;margin-top: 10px">
					<ul class="nav navbar-nav">
						<li><a href="http://www.facebook.com"><i class="fa fa-facebook"
								style="font-size: 50px"></i></a></li>
						<li><a href="http://www.twitter.com"><i class="fa fa-twitter"
								style="font-size: 50px"></i></a></li>
						<li><a href="http://www.instagram.com"><i class="fa fa-instagram"
								style="font-size: 50px"></i></a></li>
					</ul>
				</div>
				<div align="right">
					<%@include file="/websocket.jsp" %>
					<p id="chatStart">채팅에 참여 하시려면 클릭해 주세요</p>
				</div>
			</div>
			<div class="row">
				<hr>
			</div>
			<!-- <div class="row text-center">
				<div class="col-md-8 col-md-offset-2">
					<p>트래포트(주) Travelhow.com은 통신판매중개자로서 통신판매의 당사자가 아니며, 상품주문, 배송 및
						환불의 의무와 책임은 각각의 판매업체에 있습니다. 사업자등록번호 : 211-88-19164통신판매업 :
						제2011-서울금천-0150호대표이사 : 안경열개인정보관리책임자 : 김영권 사업자정보확인 주소 : 서울특별시 금천구
						가산디지털1로 145 에이스하이엔드타워 3차 604호 [08506]대표전화 : 1644-8668팩스번호 :
						02-2178-9393 Traport. Copyright (c) 2015 Traport..com Inc. All
						Rights Reserved.</p>
				</div>
			</div> -->
		</div>
	</footer>
</body>
</html>