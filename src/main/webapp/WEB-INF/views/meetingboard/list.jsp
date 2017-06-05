<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<!--<style>
.body {
	position: relative;
}

#main {
	margin-top:10%;
	position: relative;
}


#board {
	position: static;
	margin-left: 50%;
	margin-right: 0px;
	
}

.Title {
	height: 15%;
	text-align: center;
}

.img {
	height: 90%;
	margin-right: 5%;
	text-align: center;
}

.image-responsive {
	hegiht: 90%;
	margin-top: 5%;
	margin-bottom: 5%;
	margin-left: 10%;
	margin-right: 10%;
	width: 80%;
	text-align: center;
}

.Content {
	    height: 20%;
	    text-align: center;

}

.name {
	height: 2%;
	text-align: right;
}

.Date {
	height: 1%;
	text-align: right;
	;
}

#side {
	position: absolute;
	background-image: url('/meoui/images/you & me.jpg');
	background-size: 100%;
	margin-left: 0px;
	margin-right: 600px;
	height: 100%;
	width: 50%;
}

#div3 {

	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #ffffff;
	padding: 10px 20px;
	background: -moz-linear-gradient(
		top,
		#fcca00 0%,
		#ffaa00 50%,
		#eb9e05 51%,
		#fe9000);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#fcca00),
		color-stop(0.50, #ffaa00),
		color-stop(0.51, #eb9e05),
		to(#fe9000));
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-radius: 30px;
	border: 10px solid #000000;
	-moz-box-shadow:
		0px 0px 0px rgba(000,000,000,0),
		inset 0px 1px 1px rgba(255,255,255,0.8);
	-webkit-box-shadow:
		0px 0px 0px rgba(000,000,000,0),
		inset 0px 1px 1px rgba(255,255,255,0.8);
	box-shadow:
		0px 0px 0px rgba(000,000,000,0),
		inset 0px 1px 1px rgba(255,255,255,0.8);
	text-shadow:
		0px -1px 0px rgba(102,056,000,0.2),
		0px 1px 0px rgba(254,144,000,0.2);
		
	text-align: center;
}


}
.dt{
	position: static;
	margin-left: 50%;
	margin-right: 0px;
}
#aa{
font-size: 2em;
font-style: italic;
} 
</style> -->
<head>
<link rel="stylesheet" href="css/botstrap.css">
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>모임게시판 글목록</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>

<style>
#thtitle{
	text-align: center;
	
}
</style>


<body class="body">
	
	
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<!-- 
	<div id="main">
		<div id="side"></div>
		<div>

			<c:forEach items="${result.list }" var="board">


				<div id="board" class="Title">
					<strong>${board.meetingboardTitle }</strong>
				</div>

				<div id="board" class="img">
					<img class="image-responsive"
						src="/meoui/images/${board.meetingboardImg }" alt="skinscuber">
				</div>

				<div id="board" class="Content">${board.meetingboardContent }</div>

				<div id="board" class="Name">${board.memberName }</div>

				<div id="board" class="Date">
					<fmt:formatDate value="${board.meetingboardDate}"
						pattern="yyyy년MM월dd일" />

				</div>

				<div id="board">
					<a href="/meoui/meetingboard/view/${board.meetingboardNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border">상세보기</button><br>
					</a>
				</div>

			</c:forEach>


		</div>	
	</div>
		<div id="div3">
			<a id="aa" href="/meoui/meetingboard/create">글쓰기</a>
		</div>
		<div class="row text-center">
			<ul class="pagination pagination-md">
				<li><c:if test="${result.pagination.prev>0 }">
						<a
							href="/meoui/meetingboard/list?pageNo=${result.pagination.prev }">이전으로</a>
					</c:if></li>
				<li><c:forEach begin="${result.pagination.startPaging }"
						end="${result.pagination.lastPaging }" var="i">
						<a href="/meoui/meetingboard/list?pageNo=${i }">${i }</a>
					</c:forEach></li>
				<li><c:if test="${result.pagination.next>0 }">
						<a
							href="/meoui/meetingboard/list?pageNo=${result.pagination.next }">다음으로</a>
					</c:if></li>
			</ul>

		</div>
		 -->

	
	<div class="container">
		<div  class="container"><h4><strong>모임게시판 글 목록</strong></h4></div>
		<table class="table table-hover">

			<thead>
				<tr>
					<th><strong>번호</strong></th>
					<th id="thtitle"><strong>제목</strong></th>
					<th><strong>작성자</strong></th>
					<th><strong>날짜</strong></th>
					<th><strong>조회수</strong></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result.list }" var="board">
					<tr>
						<td>${board.meetingboardNo }</td>
						<td><a href="/meoui/meetingboard/view/${board.meetingboardNo }">${board.meetingboardTitle }</a></td>
						<td>${board.memberName }</td>
						<td><fmt:formatDate value="${board.meetingboardDate}"
								pattern="yyyy년MM월dd일" /></td>
						<td>${board.meetingboardCnt }</td>
					</tr>
			</tbody>
			</c:forEach>
		</table>
		<hr />
		<a class="btn btn-default pull-right"
			href="/meoui/meetingboard/create">글쓰기</a>
		<div class="text-center">
			<ul class="pagination">
				<li><c:if test="${result.pagination.prev>0 }">
						<a
							href="/meoui/meetingboard/list?pageNo=${result.pagination.prev }">이전으로</a>
					</c:if></li>
				<li><c:forEach begin="${result.pagination.startPaging }"
						end="${result.pagination.lastPaging }" var="i">
						<a href="/meoui/meetingboard/list?pageNo=${i }">${i }</a>
					</c:forEach></li>
				<li><c:if test="${result.pagination.next>0 }">
						<a
							href="/meoui/meetingboard/list?pageNo=${result.pagination.next }">다음으로</a>
					</c:if></li>
			</ul>

		</div>

	</div>



	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>

</html>