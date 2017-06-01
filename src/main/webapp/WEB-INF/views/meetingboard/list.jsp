<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}

#div{
	text-align: center;
	margin: auto;
	width: 300px;
	height: 225px;
}

#div2{
	text-align: center;
	margin: auto;
	width: 100%;
	height: 45px;
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



			<div id="div2">	<a href="/meoui/membermeeting/view/${meeting.meetingNo}">
							<strong>${board.meetingboardTitle }</strong>
						</a>	</div>
			
			<div id="div"><a
						href="/meoui/meetingboard/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${board.meetingboardImg }"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>	</div>
			
			<div id="div2"><a	href="/meoui/membermeeting/view/${meeting.meetingNo}">
							${board.meetingboardContent }</a>	</div>
			
			<div id="div2">${boerd.memberName }	</div>
			
			<div id="div2">		<fmt:formatDate value="${board.meetingboardDate}" pattern="yyyy년MM월dd일"/>
				
				</div>

			<div id="div2">
			<a href="/meoui/meetingboard/view/${board.meetingboardNo }">
				<button type="button" class="w3-button w3-block w3-white w3-border">
					상세보기</button>
			</a>
		</div>
		
	</c:forEach>
	

	<div>
	<a href="/meoui/meetingboard/create">글쓰기 </a></div>
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
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>

</html>