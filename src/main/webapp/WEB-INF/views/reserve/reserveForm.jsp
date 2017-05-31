<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<style>
table.type06 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type06 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
}
table.type06 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type06 .even {
    background: #efefef;
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
<body>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">객실
		상세페이지</h1>
	<div class="container">
		<hr>
		<div>
			<div>
				<input type="hidden" value="<%=session.getAttribute("roomNo") %>" 
				name="roomNo" id="roomNo">
				<table class="type06" style="margin-left: 350px;">				
					<tr><th scope="row">체크인: </th><td class="even"><input type="text" id="datepicker1" name="checkIn">
					</td></tr>
					<tr><th scope="row">체크아웃: </th><td><input type="text" id="datepicker2" name="checkOut">
					</td></tr>
					<tr><th scope="row">기본 예약금액: </th><td class="even"><input type="text" name="reservePrice" id="reservePrice"
					value="<%=session.getAttribute("roomPrice") %>" readonly="readonly">(원)</td></tr>
					<tr><th scope="row">숙박인원</th><td><input type="number" name="stayPeople" id="count"></td></tr>
				</table>
				<div>
					<button id="confirmBtn" style="margin-left: 460px;">결제</button>
					<a href="/meoui/accommodaion/list?pageNo=1"><button>리스트</button></a>
				</div>
			</div>
		</div>
	</div>
	<div>
	</div>
	<div style="margin-top: 200px;">
	<c:forEach items="${result.list }" var="res">
			<hr>
			<p align="center">****님께서<fmt:formatDate value="${res.checkIn }" pattern="yyyy년MM월dd일"/>에 ${res.stayPeople }명이 예약되었습니다.</p>
	</c:forEach>
	</div>
</body>
<script>
	$(document).ready(function() {
		$(".reserve").hide();
		$("#reserveBtn").on("click", function() {
			$(".reserve").show();
			var roomPrice = $("#roomPrice").val();
			sessionStorage.setItem("sessionPrice", roomPrice);
			$("#btn").on("click", function() {
				alert("감사합니다");
				location.replace("/meoui/accommodaion/list?pageNo=1");
			})
		})
		$("#btn").on("click", function() {
			alert("감사합니다");
			location.replace("/meoui/accommodaion/list?pageNo=1");
		})
	})
	$(document).ready(function() {
		$("#confirmBtn").on("click", function() {
			var checkIn = $("#datepicker1").val();
			var checkOut = $("#datepicker2").val();
			var reservePrice = $("#reservePrice").val();
			var roomNo = $("#roomNo").val();
			var stayPeople = $("#count").val();
			$.ajax({
				type : "post",
				url : "/meoui/reserve/join",
				data : {
					checkIn : checkIn,
					checkOut : checkOut,
					reservePrice : reservePrice,
					roomNo : roomNo,
					stayPeople : stayPeople
				},
				success : function(result) {
					console.log(result)
					if (result == "success") {
						alert("결제페이지로 이동합니다.")
						window.location.href = "/meoui/reserve/event/cash";
					} else {
						alert("예약이 실패했습니다.")
					}
				}
			})
		})
	})
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : ''
	});
	$(function() {
		$("#datepicker1, #datepicker2").datepicker();
	});
</script>
</html>