<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<style>
table.type08 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}

table.type08 thead th {
    padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
		<h1 id="headTitle" style="margin-top: 50px;" align="center">자유게시판</h1>
		<hr>
	<table class="type08">
    	<thead>
    	<tr>
        	<th scope="cols">글번호</th>
        	<th scope="cols">제목</th>
        	<th scope="cols">조회수</th>
        	<th scope="cols">작성일</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${result.list }" var ="freeboard">
    	<tr>
        	<th scope="row">${freeboard.freeboardNo }</th>
        	<td><a href="#">${freeboard.freeboardTitle }</a></td>
        	<th scope="row">${freeboard.freeboardCnt }</th>
        	<td><fmt:formatDate value="${freeboard.freeboardDate }" pattern="yyyy년MM월dd일"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
	</table>
	<div class="row text-center">
		<ul class="pagination pagination-md">
		<li><c:if test="${result.pagination.prev>0 }">
			<a href="/meoui/freeboard/list?pageNo=${result.pagination.prev }">이전으로</a>
		</c:if></li>
		<li><c:forEach begin="${result.pagination.startPaging }" end="${result.pagination.lastPaging }" var="i" >
			<a href="/meoui/freeboard/list?pageNo=${i }">${i }</a>
		</c:forEach></li>
		<li><c:if test="${result.pagination.next>0 }">
			<a href="/meoui/freeboard/list?pageNo=${result.pagination.next }">다음으로</a>
		</c:if></li>
		</ul>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>