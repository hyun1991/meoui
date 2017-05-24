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
	<header>
	<%@include file="/nav/adminnav.jsp" %>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">숙박업주 전체리스트</h1>
	<hr>
		<table class="table table-striped table-bordered table-hover">
			<thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>연락처</th>
                <th>사업자번호</th>
                <th>가입일</th>
                <th>비고<th>
            </tr>
        	</thead>
        <tbody>
			<c:forEach items="${result.list }" var="owner">
				<tr>
					<td>${owner.ownerId }</td>
					<td>${owner.ownerName }</td>
					<td>${owner.ownerPhone }</td>
					<td>${owner.ownerBrn }</td>
					<td><fmt:formatDate value="${owner.ownerStartdate }" pattern="yyyy년MM월dd일"/></td>
					<td><a href="#"><button type="button" class="w3-button w3-block w3-white w3-border">
						추방</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
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