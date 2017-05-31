<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 생성</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
	function boardWriteCheck() {
		var form = document.BoardWriteForm;
		return true;
	}
</script>
<style type="text/css">






</style>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>

	<h1>신규 모임 생성</h1>

	
		<form id="memberMeetingForm" action="/meoui/membermeeting/create"
			method="POST" enctype="multipart/form-data">



			<table >
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>

				<tr>
					<td>모임명</td>
					<td><input type=text name="meetingName" size=35 maxlength=30></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="Img" size=30></td>
				</tr>
				<tr>
					<td>아 이 디</td>
					<td><input type=text name=title></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type=password name=password size=15 maxlength=15></td>
				</tr>
				<tr>
					<td colspan=2><hr size=1></td>
				</tr>
				<tr>
					<td colspan="2"><div align="center">
							<input type="submit" value="등록">&nbsp;&nbsp; <input
								type="button" value="뒤로" onclick="move('list');">
						</div></td>
				</tr>


			</table>
		</form>
<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>