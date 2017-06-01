<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<h2>아이디 찾기</h2>
			<br>
		</div>
		<div class="row">
				<div id="findId" class="tab-pane fade in active">
					<form action="/meoui/member/idsearch" method="post">
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="usr">이름</label> <input type="text"
									class="form-control" id="idSearchName" name="memberName">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="idSearchMail" name="memberMail">

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="idBtn">조회</button>
								<a href="/meoui/"><button type="button" class="btn btn-default" id="idBtn">홈으로</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<script>
	$(document).ready(function() {
		$("#idBtn").on("click", function() {
			var memberName= $("#idSearchName").val()
			var memberMail= $("#idSearchMail").val()
			$.ajax({
				type:"post",
				url: "/meoui/member/idsearch",
				data:{memberName: memberName, memberMail:memberMail},
				success: function(result){
					alert("찾으신 아이디는"+result+"입니다.")
				}
			})
		})
	})
</script>
</html>