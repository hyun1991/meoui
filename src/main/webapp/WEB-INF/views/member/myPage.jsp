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
	<%@include file="/navbar.jsp"%>
	<div><h3>회원아이디:</h3>${result.accommodation.accommodationName }</div><br>
	<div><h3>이름:</h3>${result.accommodation.accommodationPhone }</div>
	<div><h3>연락처:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>주소지:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>이메일:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>직업:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>성별:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>가입일:</h3>${result.accommodation.accommodationAddress }</div>
	<div>작성일: <fmt:formatDate value="${result.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div>
	<div><h3>취미:</h3>${result.accommodation.accommodationAddress }</div>
	<input type="hidden" value="${result.accommodation.ownerNo }" id="ownerNo">
	<div><a href="/meoui/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }"><button>객실정보 조회하기</button></a></div>
	<div><a href="/meoui/accommodaion/list?pageNo=1"><button id="sessionBtn">리스트로 이동</button></a></div>
	<hr>
</body>
</html>