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
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption><h1>게시글 상세</h1></caption>
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
		<a href="/meoui/admin/notice/list?pageNo=1" class="btn" id="list">목록으로</a>
		<a href="/meoui/admin/notice/update?noticeNo=${notice.nlist.noticeNo}"
			class="btn" id="update">수정하기</a>
		<hr>
		<textarea name="noticeCommentContent" id="noticeCommentContent">
	    </textarea>
		<button id="insertComment" data-bno="${notice.nlist.noticeNo }">댓글
			쓰기</button>
		<div id="view">
			<c:forEach items="${notice.nclist }" var="comment">
				<div class="comments">
					<div class="number">${comment.noticeCommentNo }</div>
					<div class="name">${comment.memberName }</div>
					<div class="contents">${comment.noticeCommentContent }</div>
					<div class="date">
						<fmt:formatDate value="${comment.noticeCommentDate }"
							pattern="yyyy년MM월dd일" />
					</div>
					<div class="viewdelete">
						<c:if test="${comment.memberNo eq memberNo }">
							<a href="/meoui/noticecomment/delete/${comment.noticeCommentNo }">
								<button id="deleteComment">댓글삭제</button>
							</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
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