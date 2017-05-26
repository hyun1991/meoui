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
<style>

table, #headTitle {
	font-family: 'Jeju Gothic', serif;
}

#title, #type {
	font-size: 30px;
	margin: 20px;
}

#noticeTitle {
	border-bottom: none;
}

h4 {
	font-size: 30px;
	display: inline;
}

#container{
  background: #E0EBFF; /* For browsers that do not support gradients */    
  background: -webkit-linear-gradient(left,#E0EBFF , #E0EBFF); /* For Safari 5.1 to 6.0 */
  background: -o-linear-gradient(right,#E0EBFF, #E0EBFF)/* For Opera 11.1 to 12.0 */
  background: -moz-linear-gradient(right,#E0EBFF, #E0EBFF); /* For Firefox 3.6 to 15 */
}

@keyframes menuBlink {
	0% {opacity: 0}
	49%{opacity: 0}
	50% {opacity: 1}
}
.glyphicon-bullhorn {animation: menuBlink 1s infinite;}

</style>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container" id="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h1 id="headTitle" style="margin-top: 50px; color:white;">공지사항</h1>
				<hr style="border: 4px solid white; margin-bottom: 50px;">
				<table class="table table-hover table-responsive col-md-8">
					<tbody>
						<c:forEach items="${result.list }" var="notice">
							<tr class="active" id="noticeTitle">
								<td data-toggle="collapse" data-target="#demo">
									<h4 id="type">
									<a href="/meoui/notice/view/${notice.noticeNo }">${notice.noticeNo }</a>
									</h4>
									<h4 id="title">
									${notice.noticeTitle }</h4>
									<h4 id="meta">
										<fmt:formatDate value="${notice.noticeDate }"
											pattern="yyyy.MM.dd" />
									</h4>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row text-center">
					<ul class="pagination pagination-md">
						<li><c:if test="${result.pagination.prev>0 }">
								<a href="/meoui/notice/list?pageNo=${result.pagination.prev }">이전으로</a>
							</c:if></li>
						<li><c:forEach begin="${result.pagination.startPaging }"
								end="${result.pagination.lastPaging }" var="i">
								<a href="/meoui/notice/list?pageNo=${i }">${i }</a>
							</c:forEach></li>
						<li><c:if test="${result.pagination.next>0 }">
								<a href="/meoui/notice/list?pageNo=${result.pagination.next }">다음으로</a>
							</c:if></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>