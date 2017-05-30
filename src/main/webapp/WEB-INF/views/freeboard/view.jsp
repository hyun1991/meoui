<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#date-writer-hit {
    display: block;
    margin: 0;
    padding: 0;
    font-size: 11px;
    color: #555;
    text-align: right;
}
#detail > p {
    margin: 0 0 15px 0;
    padding: 0;
    color: #333;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
	<header> 
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<table style="margin-left: 100px; width: auto;">
	    <tr>
			<th style="text-align: left; vertical-align: top;"><h5>작성자: &nbsp;&nbsp;</h5></th>
			<th style="text-align: left; color: #555;">${result.board.memberName }</th>
		</tr>
		<tr>
			<th style="text-align: left; vertical-align: top;"><h5>제목: &nbsp;&nbsp;</h5></th>
			<th style="text-align: left; color: #555;">${result.board.freeboardTitle }</th>
		</tr>
	</table>
	<div id="detail">
		<span id="date-writer-hit"><fmt:formatDate
				value="${result.board.freeboardDate }" pattern="yyyy년MM월dd일" /> Hit
			${result.board.freeboardCnt }</span>
		<p style="margin-left: 100px">${result.board.freeboardContent}</p>
	</div>
	<div style="margin-left: 100px">
		첨부파일: &nbsp;&nbsp;<a href="/meoui/freeboard/download?freeboardImg=${result.board.freeboardImg }">
			${result.board.freeboardImg }</a>
	</div>
	<hr>
	<h5 style="margin-left: 70px">댓글작성란</h5>
	<br>
	<div id="center">
		<form action="/meoui/freeboardComment/insert" method="post">
			<div class="row text-center">
				<div class="col-xs-4" style="margin-left: 70px">
					<textarea class="form-control col-sm-5" rows="5"
						placeholder="댓글을 작성해 주세요." name="freeboardCommentContent" id="freeboardCommentContent">
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
	<c:forEach items="${result.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="boardCommentNo"
				value="${comment.freeboardCommentNo }" class="form-control input-lg">
			<div class="form-group">${comment.memberName}</div>
			<div class="form-group">${comment.freeboardCommentContent}</div>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.freeboardCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a href="/meoui/freeboardComment/delete/${comment.freeboardCommentNo}">
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