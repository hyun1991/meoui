<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<style>
</style>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<hr>
	<div class="row">
		<h1 align="center">${result.site.siteName }</h1>
	</div>
	<br><br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/${result.site.siteImg}" style="width: 500px; height: 575px;">
			</div>
			<div>
				<h3>대표전화</h3>${result.site.sitePhone }
			</div>
			<div>
				<h3>주소</h3>${result.site.detailsAddress }
			</div>
			<div>
				<h3>이용대상</h3>${result.site.siteObject }
			</div>
			<div>
				<h3>주차</h3>${result.site.park }
			</div>
			<div>
				<h3>이용시간</h3>${result.site.siteOpenTime }~${result.site.siteCloseTime }
			</div>
			<div>
				<h3>야간개장여부</h3>${result.site.siteNightOpen }
			</div>
			<div style="margin-left: 0;">
				<h3>야간개장 시 폐장시간</h3>${result.site.siteNightCloseTime }
			</div>
			<div>
			<h3>입장료</h3>
			<c:forEach items="${result1.list }" var="result1">
				<table>
					<tr>
						<td>${result1.ticketStandard } : ${result1.ticketPrice }</td>
					</tr>
				</table>
			</c:forEach>
			</div>
		
			<div class="col-xs-4">
					<a href="/meoui/admin/site/update">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">관광지 수정</button>
						</a>
							<a href="/meoui/admin/ticket/insert">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 추가</button>
						</a>
							<a href="/meoui/admin/ticket/update">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 수정</button>
						</a>
								<a href="/meoui/admin/ticket/delete/${result.siteNo }">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 삭제</button>
						</a>
						<a
						href="/meoui/admin/site/delete/${result.siteNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border" id="deleteBtn">
							삭제하기</button>
						</a>
				<a href="/meoui/admin/site/list?pageNo=1"><button
							type="button" class="w3-button w3-block w3-white w3-border">
							리스트로 이동</button></a>
			</div>
		</div>
		
	</div>
	<hr>
	<h1 align="center">주변숙박시설</h1>
    	<div class="row text-center" style="margin-left: 70px;">
			<c:forEach items="${result.list }" var="accommodation">
				<div class="col-sm-3" style="overflow-x:hidden;overflow-y:hidden; width: 280px; height: 600px;" >
					<a href="#">
						<img class="image-responsive"
						src="/meoui/images/${accommodation.accommodationImg}"
						alt="알수없음" style="margin-bottom: 20px;">
					</a>
					<p>
						<a href="#">
							<strong>${accommodation.accommodationName}</strong>
						</a>
					</p>
					<p><a href="#">
							${accommodation.accommodationAddress}</a>
					</p>
				</div>
			</c:forEach>
		</div>
	<hr>
	<h1 align="center">댓글리스트</h1>
	<c:forEach items="${result.comment }" var="comment">
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
</body>

</html>