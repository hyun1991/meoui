<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<header><h1>객실 상세페이지</h1></header>
		<div class="container">
			<c:forEach items="${result.room }" var="room">
				<div>객실이름:<input type="text" value="${room.roomName}" readonly="readonly"></div><br>
				<div>예약금액:<input type="text" id="roomPrice" value="${room.roomPrice }" readonly="readonly">원</div><br>
				<div>숙박가능인원:<input type="text" value="${room.roomUseNumber}" readonly="readonly">명</div>
				<div><button id="reserveBtn">예약하기</button></div>
			</c:forEach>
			<hr>
			<c:forEach items="${result.roomImg }" var="roomImg">
				<div><img src="/meoui/images/${roomImg.roomImg}"></div>
			</c:forEach>
		</div>
		<hr>
		<div class="reserve">
		<form action="/meoui/reserve/join" method="post">
		<div>체크인: <input type="text" id="datepicker1" name="checkIn"></div><br>
		<div>체크아웃: <input type="text" id="datepicker2" name="checkOut"></div><br>
		<div>예약금액: <input type="text" name="reservePrice" id="reservePriced" readonly="readonly"></div><br>
		<div>숙박인원: <select name="stayPeople" id="count">
							<option value="1" selected="selected">1</option>
							<option value="2" >2</option>
							<option value="3" >3</option>
							<option value="4" >4</option>
							<option value="5" >5</option>
							<option value="6" >6</option>
							<option value="7" >7</option>
							<option value="8" >8</option>
							<option value="9" >9</option>
							<option value="10">10</option>
						</select></div>
		<div><input type="submit" value="예약하기"></div>
		</form>
		</div>
		<div><button id="btn">리스트</button></div>
		<div><a href="/meoui/accommodation/view/<%=(Integer)session.getAttribute("accommodationNo")%>"><button>펜션정보</button></a></div>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
<script>
	$(document).ready(function() {
		$(".reserve").hide();
		$("#reserveBtn").on("click", function() {
			$(".reserve").show();
			var roomPrice= $("#roomPrice").val();
			sessionStorage.setItem("sessionPrice", roomPrice);
			$("#btn").on("click", function() {
				alert("감사합니다");
				location.replace("/meoui/accommodaion/list?pageNo=1");
			})
		})
	})
	$(document).ready(function() {
		$(".reserve").hide();
		$("#reserveBtn").on("click", function() {
			$(".reserve").show();
			var roomPrice= $("#roomPrice").val();
			sessionStorage.setItem("sessionPrice", roomPrice);
			var price= sessionStorage.getItem("sessionPrice");
			price = Number(price);
			$("#count").bind("change", function() {
				var index="";
				$("#count option:selected").each(function() {
					index+=$(this).text()+"";
				})
				$("#reservePriced").val(price*index+"(원)");
			})
			$("#count").change();
		})
	})
	$.datepicker.setDefaults({
        dateFormat: 'yy/mm/dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: ''
    });
  	$(function() {
    	$("#datepicker1, #datepicker2").datepicker();
  	});
</script>
</html>