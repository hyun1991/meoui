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
.td input:focus, .td textarea:focus {
	outline: none;
}

input:focus, textarea:focus {
	outline: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
	<header> <%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<hr>
		<div class="row text-center">
			<table style="border: 1px solid; border-collapse: collapse;">
				<tr style="border: solid 1px;">
					<th style="border: solid 1px;">제목</th>
					<td style="border: 1px solid;"><input type="text"
						value="${result.board.freeboardTitle }" size="20"
						style="width: 100%; border: 0;"></td>
				</tr>
				<tr style="border: solid 1px;">
					<th style="border: solid 1px;">작성일</th>
					<td style="border: 1px solid;"><fmt:formatDate
							value="${result.board.freeboardDate }" pattern="yyyy년MM월dd일" /></td>
				</tr>
				<tr style="border: solid 1px;">
					<th style="border: solid 1px;">조회수</th>
					<td style="border: 1px solid;"><input type="text"
						value="${result.board.freeboardCnt }" size="20"
						style="width: 100%; border: 0;"></td>
				</tr>
				<tr style="border: solid 1px;">
					<th style="border: solid 1px;">내용</th>
					<td style="border: 1px solid;"><textarea name="content"
							rows="30" style="width: 100%; border: 0; resize: none;">
					${result.board.freeboardContent}</textarea></td>
				</tr>
				<tr style="border: solid 1px;">
					<th style="border: solid 1px;">첨부파일</th>
					<td style="border: 1px solid;"><a
						href="/meoui/freeboard/download?freeboardImg=${result.board.freeboardImg }">
							${result.board.freeboardImg }</a></td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<h5>댓글작성란</h5>
	<br>
	<div id="center">
		<form action="#" method="post">
			<div class="row text-center">
				<div class="col-xs-4">
					<textarea class="form-control col-sm-5" rows="5"
						placeholder="댓글을 작성해 주세요." name="accommodationCommentContent">
				</textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4">
					<button type="submit" class="w3-button w3-block w3-white w3-border">댓글작성</button>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="memberNo"
				value="${comment.freeboardCommentNo }" class="form-control input-lg">
			<div class="form-group">${comment.freeboardCommentContent}</div>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.freeboardCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a href="#">
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