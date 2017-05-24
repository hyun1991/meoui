<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<%@include file="/nav/ownernav.jsp" %>
	</header>
	<!-- 
	private int memberNo;					//	회원번호(PK)
	private String memberId;				//	회원아이디
	private String memberPassword;			//	패스워드
	private String memberName;				//	이름
	private String memberPhone;				//	연락처
	private String memberAddress;			//	주소지
	private String memberMail;				//	이메일
	private String memberJob;				//	직업
	private String memberGender;			//	성별
	private Date memberStartdate;			//	가입일
	private String memberHobby;				//	취미
		 -->
	<h1 id="headTitle" style="margin-top: 50px;" align="center">회원 전체리스트</h1>
	<hr>
		<table class="table table-striped table-bordered table-hover">
			<thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>연락처</th>
                <th>성별</th>
                <th>가입일</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach items="${result.list }" var="member">
				<tr>
					<td>${member.memberId }</td>
					<td>${member.memberName }</td>
					<td>${member.memberPhone }</td>
					<td>${member.memberGender }</td>
					<td>${member.memberStartdate }</td>
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