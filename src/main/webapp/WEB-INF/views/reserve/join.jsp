<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").on("click", function() {
				alert("감사합니다");
				location.replace("/meoui/accommodation/list?pageNo=1");
		})
	})
	$(document).ready(function() {
		var price= <%=(Integer)session.getAttribute("roomPrice")%>
		$("#count").bind("change", function() {
			var index="";
			$("#count option:selected").each(function() {
				index+=$(this).text()+"";
			})
			$("#reservePrice").val(price+(index*30000)+"(원)");
		})
		$("#count").change();
	})
</script>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<h1>예약페이지</h1>
	<form action="/meoui/reserve/join" method="post">
		<div>체크인: <input type="date" name="checkIn"></div><br>
		<div>체크아웃: <input type="date" name="checkOut"></div><br>
		<div>예약금액: <input type="text" name="reservePrice" id="reservePrice"></div><br>
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
			<div><button id="btn">취소하기</button></div>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
</html>