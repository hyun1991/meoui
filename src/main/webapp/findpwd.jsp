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
			<h2>비밀번호찾기</h2>
			<br>
		</div>
		<div class="row">
			<br>
			<div id="findPwd" class="tab-pane fade in active">
				<div class="form-group row">
					<div class="form-group col-md-6">
						<label for="email">아이디</label> <input type="text"
							class="form-control" id="pwSearchId" name="memberId">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-group col-md-6">
						<label for="usr">이름</label> <input type="text"
							class="form-control" id="pwSearchName" name="memberName">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-group col-md-6">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="pwSearchMail" name="memberMail">

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="pwBtn">조회</button>
						<a href="/meoui/"><button type="button"
								class="btn btn-default" id="idBtn">홈으로</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
	$(document).ready(function() {
		$("#pwBtn").on("click", function() {
			var memberId = $("#pwSearchId").val()
			var memberName = $("#pwSearchName").val()
			var memberMail = $("#pwSearchMail").val()
			$.ajax({
				type : "post",
				url : "/meoui/member/pwsearch",
				data : {memberId : memberId, memberName : memberName, memberMail : memberMail},
				success : function(result) {
					alert("찾으신 비밀번호는" + result + "입니다.")
				}
			})
		})
	})
</script>
</html>