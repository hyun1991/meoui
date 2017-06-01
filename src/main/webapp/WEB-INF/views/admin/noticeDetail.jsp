<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp"%>
	</header>
	<div align="left" style="margin-left: 70px;">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>
				<h1>게시글 상세</h1>
			</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${notice.nlist.noticeNo}</td>
					<th scope="row">조회수</th>
					<td>${notice.nlist.noticeCnt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${notice.nlist.username}</td>
					<th scope="row">작성시간</th>
					<td><fmt:formatDate value="${notice.nlist.noticeDate}"
							pattern="yyyy년 MM월 dd일" /></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${notice.nlist.noticeTitle}</td>
				</tr>
				<tr>
					<td colspan="4">${notice.nlist.noticeContent}</td>
				</tr>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/include/include-body.jsp"%>
	</div>
	<br>
	<div class="row text-center">
		<div class="col-xs-4" style="margin-left: 70px;">
			<a href="/meoui/admin/notice/list?pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border">목록으로</button>
			</a>
		</div>
	</div>
	<div class="row text-center">
		<div class="col-xs-4" style="margin-left: 70px;">
			<a href="/meoui/admin/notice/update?noticeNo=${notice.nlist.noticeNo}">
				<button type="button" class="w3-button w3-block w3-white w3-border">수정하기</button>
			</a>
		</div>
	</div>
	<hr>
	<h2 id="headTitle" style="margin-top: 50px;" align="center">댓글작성란</h2>
	<br>
	<div class="row">
		<div class="col-xs-4" style="margin-left: 70px">
			<textarea class="form-control col-sm-5" rows="5"
				id="noticeCommentContent">
				</textarea>
		</div>
		<br>
	</div>
	<div class="row">
		<div class="col-xs-4" style="margin-left: 70px">
			<button type="button" class="w3-button w3-block w3-white w3-border"
				id="insertComment" data-bno="${notice.nlist.noticeNo}">댓글작성</button>
		</div>
	</div>
	<div id="view">
		<c:forEach items="${notice.nclist }" var="comment">
			<div class="container">
				<hr>
				<div class="form-group">${comment.memberName }</div>
				<div class="form-group">${comment.noticeCommentContent }</div>
				<div class="form-group">
					<fmt:formatDate value="${comment.noticeCommentDate }"
						pattern="yyyy년MM월dd일" />
				</div>
				<div class="form-group">
					<c:if test="${comment.memberNo eq memberNo }">
						<a href="/meoui/noticecomment/delete/${comment.noticeCommentNo }">
							<button id="deleteComment"
								class="w3-button w3-block w3-white w3-border" id="deleteBtn">
								댓글삭제</button>
						</a>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<br>
	<%@ include file="/WEB-INF/include/include-body.jsp"%>
</body>
<script>
	$(function() {
		function print(notice) {
			$("#view").empty();
			$.each(notice.nclist, function(index, comments) {
				var str = "<div class='comments'>"
				str = str + "<div class='name'>" + comments.memberName
						+ "</div>"
				str = str + "<div class='contents'>"
						+ comments.noticeCommentContent + "</div>"
				str = str + " <div class='date'>" + comments.noticeCommentDate
						+ "</div></div>"
				$("#view").append(str);
			})
		}
		$("#insertComment").on("click", function() {
			$.ajax({
				url : "/meoui/noticecomment/" + $(this).data("bno"),
				type : "post",
				data : {
					"noticeCommentContent" : $("#noticeCommentContent").val()
				},
				dataType : "json",
				success : function() {
					window.location.reload();
				}
			})
		})
	});
</script>
</html>