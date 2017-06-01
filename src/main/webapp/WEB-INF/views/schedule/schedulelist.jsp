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
	<%@include file="/nav/navbar.jsp"%>
	<div class="form-group" style="margin-left: auto">
	<div class="col-xs-4">
		<a href="/meoui/schedule/mylist?memberNo=<%=session.getAttribute("memberNo")%>">
		<button type="button" class="w3-button w3-block w3-white w3-border">
		일정 달력으로 조회</button></a>
	</div>
	</div>
	<br><br>
	<div class="container">
		<h2>나의일정보기</h2>
		<hr>
		<br>
		<div class="row">
			<div class="col-md-4">
				<c:forEach items="${result.list }" var="schedule">
						<label for="usr">일자:</label>
						<fmt:formatDate value="${schedule.travlescheduleDate }" pattern="yyyy년 MM월 dd일" />
						<br>
						<label for="usr">관광명소명:</label>${schedule.siteName }<br>
						<label for="usr">스케줄내용:</label>${schedule.schedule }<br>
						<div class="form-group">
							<a href="/meoui/schedule/delete/${schedule.travlescheduleNo }"><button
									type="button" class="w3-button w3-block w3-white w3-border">
									스케줄삭제</button></a>
						</div>
						<hr>
				</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<a href="/meoui/"><button type="button"
					class="w3-button w3-block w3-white w3-border">홈으로</button></a>
		</div>
	</div>
		<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/schedule/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/schedule/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/schedule/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>