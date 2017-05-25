<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
img {
	width: 200px;
	height: 100px
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<head>
	<%@include file="/nav/navbar.jsp" %>
	</head>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">객실
		상세페이지</h1>
	<div class="container">
		<hr>
		<div class="row">
			<div class="col-md-4">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실이름</th>
							<th>예약금액</th>
							<th>숙박가능인원</th>
							<th colspan="3">객실이미지</th>
							<th>비고</th>
						</tr>
					</thead>
					<c:forEach items="${result.room }" var="room">
						<tr>
							<td>${room.roomName}</td>
							<td>${room.roomPrice }(원)</td>
							<td>${room.roomUseNumber}(명)</td>
							<c:forEach items="${result.roomImg }" var="roomImg">
								<c:if test="${room.roomNo eq roomImg.roomNo}">
									<td><img src="/meoui/images/${roomImg.roomImg}"></td>
								</c:if>
							</c:forEach>
							<td><a href="/meoui/reserve/join?roomNo=${room.roomNo }&roomPrice=${room.roomPrice}">
									<button type="button"
										class="w3-button w3-block w3-white w3-border">예약</button>
							</a></td>
					</c:forEach>
				</table>
				<div>
					<a href="/meoui/accommodation/list?pageNo=1">
					<button type="button" class="w3-button w3-block w3-white w3-border"
						id="btn">리스트 이동</button></a>
				</div>
				<div>
					<a href="/meoui/accommodation/view/<%=(Integer) session.getAttribute("accommodationNo")%>">
						<button type="button"
							class="w3-button w3-block w3-white w3-border">펜션정보</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function layer_open(el) {
		var temp = $('#' + el); //레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
			$('.layer').fadeIn();
		} else {
			temp.fadeIn(); //bg 클래스가 없으면 일반레이어로 실행한다.
		}
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut();
			} else {
				temp.fadeOut(); //'발송'버튼을 클릭하면 레이어가 사라진다.
				window.location.href="/meoui/";
			}
			e.preventDefault();
		});
		$('.layer .bg').click(function(e) {
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
</script>
</html>