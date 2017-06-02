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
					<td>${result.board.freeboardNo}</td>
					<th scope="row">조회수</th>
					<td>${result.board.freeboardCnt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${result.board.memberName}</td>
					<th scope="row">작성시간</th>
					<td><fmt:formatDate value="${result.board.freeboardDate}"
							pattern="yyyy년 MM월 dd일" /></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${result.board.freeboardTitle}</td>
				</tr>
				<tr>
				    <th scope="row">내용</th>
					<td colspan="4">${result.board.freeboardContent}</td>
				</tr>
				<tr>
				    <th scope="row">첨부파일</th>
					<td colspan="4">${result.board.freeboardImg}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<div class="row text-center">
	<div class="col-xs-4" style="margin-left: 70px;">
			<a href="/meoui/admin/freeboard/list?pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border">목록으로</button>
			</a>
		</div>
	</div>
	<hr>
	<h2 id="headTitle" style="margin-top: 50px;" align="center">댓글작성란</h2>
	<br>
	<div class="row">
		<form action="/meoui/freeboardComment/insert" method="post">
	    <div class="row text-center">
	    <div class="col-xs-4" style="margin-left: 70px">
			<textarea class="form-control col-sm-5" rows="5" id="freeboardCommentContent" name="freeboardCommentContent">
			</textarea>
		</div>
		<br>
	</div>
	<div class="row">
		<div class="col-xs-4" style="margin-left: 70px">
			<button type="submit" class="w3-button w3-block w3-white w3-border">댓글작성</button>
		</div>
		</div>
		</form>
	</div>
	<div id="view">
		<c:forEach items="${result.comment }" var="comment">
			<div class="container">
				<hr>
				<div class="form-group">${comment.memberName }</div>
				<div class="form-group">${comment.freeboardCommentContent }</div>
				<div class="form-group">
					<fmt:formatDate value="${comment.freeboardCommentDate }"
						pattern="yyyy년MM월dd일" />
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<br>
	<%@ include file="/WEB-INF/include/include-body.jsp"%>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>