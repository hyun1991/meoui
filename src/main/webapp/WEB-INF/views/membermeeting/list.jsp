<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" type="text/css"
	href="/meoui/css/meetingboardimg.css">
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
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>

<head>
<meta charset="UTF-8">
<title>모임 목록</title>


</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>

	<h1 style="margin-top: 50px;" align="center">모임 전체리스트</h1>
	<hr>
	<div class="container">
		<div class="row text-center container"
			style="height: 100%; width: 100%; margin-top: 10px;">

			<c:forEach items="${result.list }" var="meeting">

					<div class="col-sm-4"
						style="height: 400px; width: 340px; margin-top: 10px;">
						<div class="thumbnail"
							style="height: 400px; width: 330px; margin-top: 30px; margin-left: 10px;">

							<figure class="snip1382" style="height: 80%;">
								<img src="/meoui/images/${meeting.meetingImg}"
									style="margin-bottom: 0px; height: 100%; width: 100%;"
									class="img-circle" alt="sample99" />
								<figcaption
									style="width: 100%; padding-right: 0px; padding-top: 0px; padding-left: 0px; padding-bottom: 0px;">


									<h2>회원 가입은 아래버튼을 눌러주세요</h2>


									<div class="icons">

										<c:if test="${meeting.meetingAdminNo ne memberNo}">
	
											<form action="/meoui/membermeeting/post/${meeting.meetingNo}"
												method=post>
												<button id="commit" type="submit"
													style="padding-top: 0px; padding-left: 0px; border-right-width: 0px; padding-right: 0px; border-top-width: 0px; border-left-width: 0px; padding-bottom: 0px; color: cyan; background-color: black; border-bottom-width: 0px;">
													<i class="ion-person-add"></i>
												</button>
											</form>
										</c:if>
									</div>

								</figcaption>
							</figure>
							<p>
								<strong>${meeting.meetingName }</strong>
							</p>
							<p>우리모임을 좋아하는 사람은: ${meeting.meetingTotalNumber }명</p>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
	<hr />
	<div class="row text-center" style="margin-top: 30px;">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a
						href="/meoui/membermeeting/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/membermeeting/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a
						href="/meoui/membermeeting/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>

	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>