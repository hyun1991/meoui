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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<body>
<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>>

<h2>모임 게시판 상세 뷰</h2>
	<div class="row text-center">
		<div class="col-sm-3">
					
					<a
						href="/meoui/meetingboard/view/${meeting.meetingNo}">
						<img class="image-responsive"
						src="/meoui/images/${board.meetingboardImg }"
						alt="skinscuber" style="margin-bottom: 20px;">
					</a>

					
					<p>
							<strong>${board.meetingboardTitle }</strong>
					</p>
					
					<p>
							${board.meetingboardContent }
					</p>
					
					<p>
							${board.memberName }
					</p>
										
					<p>
							${board.meetingboardCnt }
					</p>
					
						<p>
						<fmt:formatDate value="${board.meetingboardDate}" pattern="yyyy년MM월dd일"/>
					</p>
					<form action="/meoui/meetingboard/delete/${board.meetingboardNo}" method="POST">
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">게시글 삭제</button>
			</form>
			
		
				
		</div>
	</div>

</body>
</html>