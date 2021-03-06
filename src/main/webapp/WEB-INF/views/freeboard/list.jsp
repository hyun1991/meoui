<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
</head>
<body>
	<header> <%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<h2>자유게시판</h2>
		<br>
		<div class="row">
			<table class="table table-hover table-responsive">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result.list }" var="freeboard">
						<tr>
							<td><a
								href="/meoui/freeboard/view/${freeboard.freeboardNo }">${freeboard.freeboardNo }</a></td>
							<td><a
								href="/meoui/freeboard/view/${freeboard.freeboardNo }">${freeboard.freeboardTitle }</a></td>
							<td>${freeboard.freeboardCnt }</td>
							<td><fmt:formatDate value="${freeboard.freeboardDate }"
									pattern="yyyy년MM월dd일" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
			<a class="btn btn-default pull-right"
			href="/meoui/freeboard/join">글작성</a>
			<div class="row text-center">
				<ul class="pagination pagination-md">
					<li><c:if test="${result.pagination.prev>0 }">
							<a href="/meoui/freeboard/list?pageNo=${result.pagination.prev }">이전으로</a>
						</c:if></li>
					<li><c:forEach begin="${result.pagination.startPaging }"
							end="${result.pagination.lastPaging }" var="i">
							<a href="/meoui/freeboard/list?pageNo=${i }">${i }</a>
						</c:forEach></li>
					<li><c:if test="${result.pagination.next>0 }">
							<a href="/meoui/freeboard/list?pageNo=${result.pagination.next }">다음으로</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>