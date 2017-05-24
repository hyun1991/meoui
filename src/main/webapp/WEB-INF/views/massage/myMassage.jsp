<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<head>
	<%@include file="/nav/navbar.jsp" %>
	</head>
		<h1 id="headTitle" style="margin-top: 50px;" align="center">나의 쪽지함</h1>
	<hr>
		<table class="table table-striped table-bordered table-hover">
			<thead>
            <tr>
                <th>번호</th>
                <th>쪽지제목</th>
                <th>발신인아이디</th>
                <th>보낸날짜</th>
                <th>확인여부</th>
                <th>비고<th>
            </tr>
        	</thead>
        <tbody>
			<c:forEach items="${result.message }" var="message">
				<tr>
					<td>${message.messageNo }</td>
					<td>${message.messageTitle }</td>
					<td>${message.messageSendId }</td>
					<td><fmt:formatDate value="${message.messageDate }" pattern="yyyy년MM월dd일"/></td>
					<c:forEach items="${result.list }" var="message">
						<td>${message.check }</td>
					</c:forEach>
					<td><a href="/meoui/admin/member/delete/${member.memberId }"><button type="button" class="w3-button w3-block w3-white w3-border">
						삭제</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<div>
			<a href="#"><button type="button" class="w3-button w3-block w3-white w3-border">
			쪽지발송하기</button></a>
		</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/admin/member/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/admin/member/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/admin/member/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>