<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<title>공지사항</title>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">공지사항</h1>
	<hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${result.list }" var="notice">
				<tr>
					<td>${notice.noticeNo }</td>
					<td><a href="/meoui/admin/noview/${notice.noticeNo}">${notice.noticeTitle }</a></td>
					<td><fmt:formatDate value="${notice.noticeDate }"
							pattern="yyyy년MM월dd일" /></td>
					<td>${notice.noticeCnt }</td>
					<td><a href="/meoui/admin/notice/delete/${notice.noticeNo}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">삭제</button>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/admin/notice/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/admin/notice/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/admin/notice/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
	<div class="form-group">
		<a href="/meoui/admin/notice/join">
			<button type="button" class="w3-button w3-block w3-white w3-border">글작성</button>
		</a>
	</div>
</body>
</html>