<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>숙박업소 리스트</title>
</head>
<body>
	<%@include file="/nav/ownernav.jsp" %>
		<div class="container">
			<c:forEach items="${result.list }" var="accommodation">
				<div><a href="/meoui/accommodation/view${accommodation.accommodationNo}"><img src="/meoui/images/${accommodation.accommodationImg}"></a></div>
				<div><a href="/meoui/accommodation/view${accommodation.accommodationNo}">${accommodation.accommodationName}</a></div><br>
			</c:forEach>
		</div>
		<div style="width:300px; margin:0 auto;">
		<c:if test="${result.pagination.prev>0 }"><a href="/meoui/accommodation/list?pageNo=${result.pagination.prev}">이전으로</a></c:if>
		<c:forEach var="i" begin="${result.pagination.startPaging}" end="${result.pagination.lastPaging}">
			<a href="/meoui/accommodation/list?pageNo=${i}">${i} </a>
		</c:forEach>
		<c:if test="${result.pagination.next>0 }"><a href="/meoui/accommodation/list?pageNo=${result.pagination.next}">다음으로</a></c:if>
	</div>
	<div>
		<a href="/meoui/manage/accommodation/join"><button type="button" class="form-control btn btn-primary">숙박업소 추가하기</button></a>
	</div>
</body>
</html>