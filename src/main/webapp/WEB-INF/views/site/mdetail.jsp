<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관광명소 상세페이지</title>
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
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<hr>
	<div class="row">
		<h1 align="center">${site.site.siteName }</h1>
	</div>
	<br><br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/${site.site.siteImg}" style="width: 500px; height: 600px;">
			</div>
			<div>
				<h4>대표전화</h4>${site.site.sitePhone }
			</div>
			<div>
				<h4>시설위치</h4>${site.site.detailsAddress }
			</div>
			<div>
				<h4>이용대상</h4>${site.site.siteObject }
			</div>
			<div>
				<h4>주차여부</h4>${site.site.park }
			</div>
			<div>
				<h4>이용시간</h4>${site.site.siteOpenTime }~${site.site.siteCloseTime }까지
			</div>
			<div>
				<h4>야간개장</h4>${site.site.siteNightOpen }
			</div>
			<div style="margin-left: 0;">
				<h4>야간개장시 폐장시간</h4>${site.site.siteNightCloseTime }
			</div> 
			<h4>입장료</h4>
			<c:forEach items="${ticket.list }" var="ticket">
					<div>
						${ticket.ticketStandard } : ${ticket.ticketPrice }
					</div>
			</c:forEach>
			<br>
			<div class="col-xs-4">
				<button type="button" class="w3-button w3-block w3-white w3-border" data-toggle="modal"
							data-target="#schedule" data-dismiss="modal">일정추가</button></a>
				<a href="/meoui/site/list?pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border" data-toggle="modal"
							data-target="#" data-dismiss="modal">리스트</button></a>
			</div>
		</div>
		<hr>		
	</div>
	
	<div id="schedule" class="modal fade" role="dialog">
	<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">일정추가</h4>
					</div>
					<div class="modal-body">
						<form action="/meoui/schedule/join" method="post">
							<table>
								<tr>
									<td>스케줄시작</td></tr>
									<tr><td>
									<input type="date" name="travlescheduleDate"></td>
								</tr>
																<tr>
									<td>스케줄종료</td></tr>
									<tr><td>
									<input type="date" name="end"></td>
								</tr>
								<tr>
									<td>일정내용</td></tr>
									<tr><td>
									<textarea class="form-control col-sm-5" rows="10" cols="30"
									name="schedule">
									</textarea></td>
								</tr>
							</table>
							<button type="submit" class="w3-button w3-block w3-white w3-border">일정추가</button>
							<button type="button" class="w3-button w3-block w3-white w3-border" data-toggle="modal"
								data-target="#" data-dismiss="modal">취소하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<h1 align="center">주변숙박시설</h1>
    	<div class="row text-center" style="margin-left: 70px;">
		<hr>
			<c:forEach items="${site.list }" var="accommodation">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden; width: 280px; height: 500px;" >
					<a href="/meoui/accommodation/view/${accommodation.accommodationNo}">
						<img class="image-responsive"
						src="/meoui/images/${accommodation.accommodationImg}"
						alt="알수없음" style="margin-bottom: 20px;">
					</a>
					<p>
						<a href="/meoui/accommodation/view/${accommodation.accommodationNo}">
							<strong>${accommodation.accommodationName}</strong>
						</a>
					</p>
					<p><a href="/meoui/accommodation/view/${accommodation.accommodationNo}">
							${accommodation.accommodationAddress}</a>
					</p>
				</div>
			</c:forEach>
		</div>
			<hr>
	<h3 style="margin-left: 70px">댓글작성란</h3>
	<br>
	<div id="center">
		<form action="/meoui/siteComment/insert" method="post">
			<div class="row">
				<div class="col-xs-4" style="margin-left: 70px">
					<textarea class="form-control col-sm-5" rows="5"
						placeholder="댓글을 작성해 주세요." name="siteCommentContent">
				</textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4" style="margin-left: 70px">
					<button type="submit" class="w3-button w3-block w3-white w3-border">댓글작성</button>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<c:forEach items="${site.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="memberNo" value="${comment.memberNo }"
				class="form-control input-lg">
			<div class="form-group">${comment.siteCommentContent}
			</div>
			<c:forEach items="${site.member }" var="member">
				<div class="btn-r">작성자: ${member.memberId }</div>
			</c:forEach>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.siteCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a
						href="/meoui/siteComment/delete/${comment.siteCommentNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border" id="deleteBtn">댓글
							삭제하기</button>
					</a>
				</c:if>
			</div>
			<hr>
		</div>
	</c:forEach>
	<footer>
		<%@include file="/footer.jsp" %>
	</footer>
</body>
</html>