<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table>
   		<tr><th>번호</th><th>작성자</th><th>제목</th><th>작성일</th></tr>
		<c:forEach items="${result.list }" var ="freeboard">
			<tr>
				<td><a href="/meoui/freeboard/view/{freeboardNo}">${freeboard.freeboardNo }</a></td>
				<td>${freeboard.memberNo }</td>
				<td>${freeboard.freeboardTitle }<td>
				<td><fmt:formatDate value="${freeboard.freeboardDate }" pattern="yyyy년MM월dd일"/><td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${result.pagination.prev>0 }">
			<a href="/meoui/freeboard/list?pageNo=${result.pagination.prev }">이전으로</a>
		</c:if>
		<c:forEach begin="${result.pagination.startPaging }" end="${result.pagination.lastPaging }" var="i" >
			<a href="/meoui/freeboard/list?pageNo=${i }">${i }</a>
		</c:forEach>
		<c:if test="${result.pagination.next>0 }">
			<a href="/meoui/freeboard/list?pageNo=${result.pagination.next }">다음으로</a>
		</c:if>
	</div>
</body>
</html>