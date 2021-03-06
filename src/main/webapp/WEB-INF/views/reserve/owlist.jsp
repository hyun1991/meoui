<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/nav/ownernav.jsp"%>
	<div class="container">
		<h2>접수된 예약리스트</h2>
		<br>
		<div class="row">
			<div class="col-md-4">
				<c:forEach items="${result.list }" var="reserve">
					<label for="usr">숙박시설명:</label>${reserve.accommodationName }<br>
					<label for="usr">고객명:</label>${reserve.memberName }<br>
					<label for="usr">고객연락처:</label>${reserve.memberPhone }<br>
					<label for="usr">고객 주소:</label>${reserve.memberAddress }<br>
					<label for="usr">고객 메일:</label>${reserve.memberMail }<br>
					<label for="usr">예약인원:</label>${reserve.stayPeople }(명)<br>
					<label for="usr">예약금액:</label>${reserve.totalprice }(원)<br>
					<label for="usr">체크인:</label>
					<fmt:formatDate value="${reserve.checkIn}" pattern="yyyy년 MM월 dd일" />
					<br>
					<label for="usr">체크아웃:</label>
					<fmt:formatDate value="${reserve.checkOut}" pattern="yyyy년 MM월 dd일" />
					<br>
					<div class="form-group">
						<a
							href="/meoui/manage/reserve/delete?reserveNo=${reserve.reserveNo }&memberNo=${reserve.memberNo}"><button
								type="button" class="w3-button w3-block w3-white w3-border">
								예약취소</button></a>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>