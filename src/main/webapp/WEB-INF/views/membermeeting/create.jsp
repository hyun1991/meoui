<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 생성</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

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
	<header> <%@include file="/nav/navbar.jsp"%>
	</header>

	<h1>신규 모임 생성</h1>


	<form id="memberMeetingForm" action="/meoui/membermeeting/create"
		method="POST" enctype="multipart/form-data">



		<div class="form-group">
			<label for="exampleInputEmail1">모임명</label> <input type="text"
				class="form-control" id="exampleInputEmail1" name="meetingName"
				placeholder="모임명을 적어주세요">
		</div>


		<div class="form-group">
		<!-- 원래 이미지 -->
			<!-- <label for="exampleInputPassword1">이미지</label>  
  			<input type="file" name="Img" id="meetingboardImg" class="form-control" value="등록"> -->

		<!-- 미리보기 이미지 -->			
				<img id="blah" src="#" alt="your image" width="300px" height="400px" />
				<input type='file' id="imgInp" class="form-control" value="등록" name="Img" />
		<!-- 여기까지 -->
			
			
		</div>
		
		
		<input type="button" class="btn btn-default pull-right" value="취소"
			onclick=" history.back(-1);">
		<button type="submit" class="btn btn-default pull-right">모임생성하기</button>


	</form>

	<!-- 
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
					<td colspan=2><hr size=1></td>
				</tr>
				<tr>
					<td colspan="2"><div align="center">
							<input type="submit" value="등록">&nbsp;&nbsp; <input
								type="button" value="뒤로" onclick="move('list');">
						</div></td>
				</tr>


			</table>
	 -->
	<footer> <%@include file="/footer.jsp"%>
	</footer>
</body>
</html>