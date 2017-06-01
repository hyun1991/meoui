<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity
:
 
0
}
50%{
opacity
:
1
}
}
#headTitle, .step {
	font-family: 'Jeju Gothic', serif;
}

@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity


:


0
}
50%{
opacity


:


1
}
}
.glyphicon-home {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<body>
<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<h2>모임게시판 글 목록</h2>	
		<c:forEach items="${result.list }" var="board">
				<%-- <div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden">
				
					<a
						href="/meoui/meetingboard/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${board.meetingboardImg }"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>

					
					<p>
						<a href="/meoui/membermeeting/view/${meeting.meetingNo}">
							<strong>${board.meetingboardTitle }</strong>
						</a>
					</p>
					
					<p>
						<a	href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${board.meetingboardContent }</a>
					</p>
					
										
					<p>
						<a	href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${board.meetingboardCnt }</a>
					</p>
					
					<p>
						<fmt:formatDate value="${board.meetingboardDate}" pattern="yyyy년MM월dd일"/>
					</p>					
					
					
					<div class="form-group">
						<a href="/meoui/meetingboard/view/${board.meetingboardNo }">
					<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button></a>
												
												
																						
				</div>
				</div> --%>
				<table class="table table-hover table-responsive">
				<thead width="100%">
					<tr>
						<th width="30%">사진</th>
						<th width="30%">제목</th>
						<th width="20%">작성자</th>
						<th width="20%">작성날자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a
						href="/meoui/meetingboard/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${board.meetingboardImg }"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a></td>
						<td><a href="/meoui/membermeeting/view/${meeting.meetingNo}">
							<strong>${board.meetingboardTitle }</strong>
						</a></td>
						<td><a	href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${board.meetingboardContent }</a></td>
						<td><a	href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${board.meetingboardCnt }</a></td>
					</tr>
					

				</tbody>
			</table>
			</c:forEach>		
				<a href="/meoui/meetingboard/create">글쓰기 </a>		
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
<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>

</html>