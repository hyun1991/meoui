<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박업소 정보</title>
<style>
		
</style>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<div class="container">
		<hr>
		<div class="row">
			<div class="col-md-4">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<th rowspan="4"><img
								src="/meoui/images/${result.accommodation.accommodationImg}">
							</th>
							<td colspan="2" width="200"><h5>숙박시설이름:</h5>${result.accommodation.accommodationName }
							</td>
						</tr>
						<tr>
							<td colspan="2" width="200"><h5>대표전화:</h5>${result.accommodation.accommodationPhone }
							</td>
						</tr>
						<tr>
							<td colspan="2" width="200"><h5>시설위치:</h5>${result.accommodation.accommodationAddress }</td>
							<td>
						</tr>
						<tr>
							<td colspan="2" width="200"><a
								href="/meoui/admin/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }">
									<button type="button"
										class="w3-button w3-block w3-white w3-border">객실정보
										조회하기</button>
							</a> <a href="/meoui/admin/accommodaion/list?pageNo=1"><button
										type="button" class="w3-button w3-block w3-white w3-border">
										리스트로 이동</button></a></td>
						</tr>
						<tr>
							<td><input type="hidden"
								value="${result.accommodation.ownerNo }" id="ownerNo"></td>
						</tr>
						<tr>
							<td colspan="3"><h2>오시는길</h2></td>
						</tr>
						<tr>
							<td colspan="3"><img
								src="/meoui/images/${result.accommodation.accommodationDirections}"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="memberNo" value="${comment.memberNo }"
				class="form-control input-lg">
			<div class="form-group">${comment.accommodationCommentContent}
			</div>
			<c:forEach items="${result.member }" var="member">
				<div class="btn-r">작성자: ${member.memberId }</div>
			</c:forEach>
			<div class="form-group">평점: ${comment.accommodationCommentAvg}점</div>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.accommodationCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a
						href="/meoui/accommodationComment/delete/${comment.accommodationCommentNo }">
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