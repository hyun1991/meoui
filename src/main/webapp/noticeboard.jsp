<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
footer {
	background-color: grey;
}
</style>
<body>
	<header>
		<%@include file="/navbar.jsp"%>
	</header>
	<div class="container">
		<h2>공지사항</h2>
		<br>
		<div class="row">
			<table class="table table-hover table-responsive">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>작성자</th>
						<th>글 제목</th>
						<th>작성 날짜/시간</th>
						</tr>
				</thead>
				<tbody>
				<c:forEach items="${result.list }" var="notice">
					<tr>
						<td><a href="/meoui/notice.jsp">${notice.noticeNo }</a></td>
						<td>${notice.usersNo }</td>
				        <td>${notice.noticeTitle }</td>
						<td><td><fmt:formatDate value="${notic.noticeDate }" pattern="yyyy년 MM월 dd일"/></td></td>
					</tr>
					</c:forEach>
					<tr>
						<td><a href="/meoui/notice.jsp">John</a></td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>2017년 5월 11일 오후 7시 30분</td>
					</tr>

				</tbody>
			</table>
			<div class="row text-center">

				<ul class="pagination pagination-md">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
			<div class="row">
				<a href="/meoui/writenotice.jsp" class="btn btn-success">글 작성</a>
			</div>
		</div>
	</div>
	<footer>
		<h1>1 Follow Us Canada's New Passenger Bill of Rights Bans
			Removal in Cases of Overbooking https://t.co/K2aizs9IKo
			https://t.co/lb8fklloIp Twitter | 29 mins ago</h1>
	</footer>
</body>
</html>