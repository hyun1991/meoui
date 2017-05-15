<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
#signInForm, #signUpForm {
	font-family: 'Jeju Gothic', serif;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<!-- 로그인 -->
		<div id="signInForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원가입</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="usr">아이디</label><br> <input type="text"
								class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>
						<div class="form-group">
							<label for="pwd">주민번호</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>

						<a href="/meoui/findid.jsp" class="btn btn-default">아이디 찾기</a> <a
							href="/meoui/findpwd.jsp" class="btn btn-default">비밀번호 찾기</a>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default">회원가입</button>
						<button type="button" class="btn btn-default">로그인</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 회원가입 -->
		<div id="signUpForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 가입</h4>
					</div>
					<div class="modal-body">
						<div class="form-group step1">
							<label for="usr">아이디</label><br> <input type="text"
								class="form-control" id="usr">
						</div>
						<div class="form-group step1">
							<label for="pwd">비밀번호</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>
						<div class="form-group step1">
							<label for="pwd">이름</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>
						<div class="form-group step1">
							<label for="pwd">생년월일</label><br> <input type="number"
								class="form-control" id="pwd">
						</div>
						<div class="form-group step2">
							<label for="pwd">주소</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>
						<div class="form-group step3">
							<label for="pwd">연락처</label><br> <input type="password"
								class="form-control" id="pwd">
						</div>
						<div class="form-group step3">
							<label for="pwd">성별</label><br>
							<div class="btn-group btn-group-justified">
								<a href="#" class="btn btn-primary">남자</a> <a href="#"
									class="btn btn-primary">여자</a>
							</div>
							<div class="form-group step3">
								<label for="pwd">계좌번호</label><br> <input type="password"
									class="form-control" id="pwd">
							</div>
							<div class="form-group step3">
								<label for="pwd">직업</label><br> <input type="password"
									class="form-control" id="pwd">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="prevBtn2">이전</button>
							<button type="button" class="btn btn-default" id="prevBtn3">이전</button>
							<button type="button" class="btn btn-default" id="nextBtn1">다음</button>
							<button type="button" class="btn btn-default" id="nextBtn2">다음</button>
							<button type="submit" class="btn btn-default" id="nextBtn3">회원가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		$(".step2").hide();
		$(".step3").hide();
		$("#nextBtn2").hide();
		$("#nextBtn3").hide();
		$("#prevBtn2").hide();
		$("#prevBtn3").hide();
	});

	$("#prevBtn2").click(function() {
		$(".step2").hide();
		$("#nextBtn2").hide();
		$(".step1").show();
		$("#nextBtn1").show();
		$("#prevBtn1").show();
	});

	$("#prevBtn3").click(function() {
		$(".step3").hide();
		$("#nextBtn3").hide();
		$(".step2").show();
		$("#nextBtn2").show();
		$("#prevBtn2").show();
	});

	$("#nextBtn1").click(function() {
		$(".step1").hide();
		$("#nextBtn1").hide();
		$(".step2").show();
		$("#nextBtn2").show();
		$("#prevBtn2").show();
	});

	$("#nextBtn2").click(function() {
		$(".step2").hide();
		$("#nextBtn2").hide();
		$(".step3").show();
		$("#nextBtn3").show();
	});
</script>
</html>