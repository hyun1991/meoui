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
		<%@include file="/navbar.jsp"%>
	</header>
	<div><img src="/meoui/images/${result.accommodation.accommodationImg}"></div><br>
	<div><h3>숙박시설이름:</h3>${result.accommodation.accommodationName }</div><br>
	<div><h3>대표전화:</h3>${result.accommodation.accommodationPhone }</div>
	<div><h3>시설위치:</h3>${result.accommodation.accommodationAddress }</div>
	<div><a href="/meoui/room/view/${result.accommodation.accommodationNo }"><button>객실정보 조회하기</button></a></div>
	<hr>
	<div><h2>오시는길</h2></div><br>
	<div><img src="/meoui/images/${result.accommodation.accommodationDirections}"></div><br>
	<hr>
	<form action="/meoui/accommodationComment/insert" method="post">
	<div><textarea rows="5" cols="50" placeholder="댓글을 작성해 주세요." name="accommodationCommentContent"></textarea></div>
	<input type="number" name="accommodationCommentAvg" placeholder="평점을 숫자로만 입력해 주세요.">
	<input type="submit" value="댓글작성">
	</form>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
			<div>${comment.accommodationCommentContent}</div><br>	
			<div><fmt:formatDate value="${comment.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div><br>
	</c:forEach>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
</html>