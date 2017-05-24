<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>모임 보기</h2>
	모임번호:<input type="text" id="meetingNo" name="meetingNo" style = "text-align:right;" value="${meeting.meetingNo}"readonly ><br>
	모임이름:<input type="text" id="meetingName" name="meetingName" value="${meeting.meetingName }"readonly ><br>
	모임이미지:<img src="/meoui/images/${meeting.meetingImg}"><br>
	모임인원 :${meeting.meetingTotalNumber}명<br>
	모임 관리자:${meeting.meetingAdminNo }<br><br>
	세션에 저장된 멤버 번호 :"<%=session.getAttribute("memberNo")%>"
	세션에 저장된 미팅 번호 :"<%=session.getAttribute("meetingNo")%>"
	<form action ="" method=post>
			<button id="commit" type="submit">회원 가입하기</button>
	</form>	
</body>
<script>
	$(document).ready(function() {
		var memberNo= "<%=session.getAttribute("memberNo")%>"
		
		var meetingNo= "<%=session.getAttribute("meetingNo")%>"
		$("#commit").on("click", function() {
		if(meetingNo===meetingNo)
				alert("가입 완료")
			else
				alert("가입 실패")
		})
	})
	</script>
</html>