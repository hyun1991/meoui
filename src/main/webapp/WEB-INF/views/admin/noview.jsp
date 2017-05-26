<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
$(function() {
	function print(notice) {
		$("#view").empty();
		$.each(notice.nclist, function(index, comments) {
			var str = "<div class='comments'>"
			str = str + "<div class='name'>"+comments.memberNo+"</div>"
			str = str + "<div class='contents'>"+comments.noticeCommentContent+"</div>"
			str = str + " <div class='date'>"+comments.noticeCommentDate+"</div></div>"
			$("#view").append(str);
		})
	}
	$("#insertComment").on("click", function() {
		$.ajax({
			url:"/meoui/noticecomment/"+$(this).data("bno"),
			type:"post",
			data : {"noticeCommentContent":$("#noticeCommentContent").val()},
			dataType:"json",
		    success:function() {
		    	window.location.reload();
			}	
		})
	})	
});	
</script>
</head>
<body>
  <h3>게시글 </h3>
        <table>
        <tr><td>게시글 번호</td><td>${notice.nlist.noticeNo}</td></tr>
		<tr><td>제목</td><td>${notice.nlist.noticeTitle}</td></tr>	
		<tr><td>작성자</td><td>${notice.nlist.usersNo}</td></tr>
		<tr><td>작성일</td><td><fmt:formatDate value="${notice.nlist.noticeDate}" pattern="yyyy년 MM월 dd일" /></td>
		<tr><td>조회수</td>	<td>${notice.nlist.noticeCnt}</td></tr>
		 <tr><td>내용</td><td>${notice.nlist.noticeContent}</td></tr>
	    </table>
	    <textarea name="noticeCommentContent" id="noticeCommentContent">
	    </textarea>
	    <button id="insertComment" data-bno="${notice.nlist.noticeNo }">댓글 쓰기</button>
	    <div id="view">
	    <c:forEach items="${notice.nclist }" var="comment">
	    <div class="comments">
	    <div class="number">${comment.noticeCommentNo }</div>
	    <div class="name">${comment.memberNo }</div>
	    <div class="contents">${comment.noticeCommentContent }</div>
	    <div class="date"><fmt:formatDate value="${comment.noticeCommentDate }"  pattern="yyyy년MM월dd일" /></div>
	    <div class="viewdelete">
	    <c:if test="${comment.memberNo eq memberNo }">
	    <a href ="/meoui/noticecomment/delete/${comment.noticeCommentNo }">
	    <button id="deleteComment">댓글삭제</button>
	    </a>
	    </c:if>
	    </div>
	    </div>
	    </c:forEach>
	    </div>
	    <c:if test="${notice.nlist.usersNo eq usersNo }">
	    <a href = "/meoui/notice/delete/${notice.nlist.noticeNo}">
	    <button>게시글삭제</button>
	    </a>
	    </c:if>
	    <c:if test="${notice.nlist.usersNo eq usersNo }">
	    <a href = "/meoui/notice/update?noticeNo=${notice.nlist.noticeNo}">
	    <button>게시글수정</button>
	    </a>
	    </c:if>
</body>
</html>