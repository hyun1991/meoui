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
	<%@include file="/nav/ownernav.jsp" %>

	<div><img src="/meoui/images/${result.accommodation.accommodationImg}"></div><br>
	<div><h3>숙박시설이름:</h3>${result.accommodation.accommodationName }</div><br>
	<div><h3>대표전화:</h3>${result.accommodation.accommodationPhone }</div>
	<div><h3>시설위치:</h3>${result.accommodation.accommodationAddress }</div>
	<div><button>수정하기</button></div>
	<hr>
	<div><h2>오시는길</h2></div><br>
	<div><img src="/meoui/images/${result.accommodation.accommodationDirections}"></div><br>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
			<div>${comment.accommodationCommentContent}</div><br>	
			<div><fmt:formatDate value="${comment.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div><br>
	</c:forEach>
</body>
</html>