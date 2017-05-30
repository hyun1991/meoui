<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/navbar.jsp"%>
	<div class="container">
		<h2>마이페이지</h2>
		<hr>
		<br>
		<div class="row">
			<div class="col-md-4">
				<c:forEach items="${result.ac }" var="accommodation">
					<c:forEach items="${result.room }" var="room">
						<c:forEach items="${result.list }" var="reserve">
							<c:if test="${accommodation.accommodationNo eq room.accommodationNo and accommodation.ownerNo eq reserve.ownerNo}">
								<label for="usr">객실명:</label>${room.roomName } <br> 
								<label for="usr">예약인원:</label>${reserve.stayPeople }(명)<br>
								<label for="usr">예약금액:</label>${reserve.reservePrice }(원)<br>
								<label for="usr">체크인:</label>
								<fmt:formatDate value="${reserve.checkIn}" pattern="yyyy년 MM월 dd일" /><br>
								<label for="usr">체크아웃:</label>
								<fmt:formatDate value="${reserve.checkOut}" pattern="yyyy년 MM월 dd일" /><br>
								<label for="usr">숙박시설명:</label>${accommodation.accommodationName }<br>
								<label for="usr">주소:</label>${accommodation.accommodationAddress }<br>
								<label for="usr">연락처:</label>${accommodation.accommodationPhone }<br>	
								<div class="form-group">
								<a href="/meoui/reserve/delete/${reserve.reserveNo }"><button type="button" class="w3-button w3-block w3-white w3-border">
								예약취소</button></a>
								</div>
								<hr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<a href="/meoui/"><button type="button" class="w3-button w3-block w3-white w3-border">
			홈으로</button></a>
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>