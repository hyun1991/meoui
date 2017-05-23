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
</head>
<body>
		<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<h2>계정정보찾기(아이디/비밀번호)</h2>
			<br>
			</div>
				<div class="row">
			<ul class="nav nav-pills">
				<li class="active"><a data-toggle="pill" href="#findId">아이디찾기</a></li>
				<li><a data-toggle="pill" href="#findPwd">비밀번호 찾기</a></li>
			</ul>
			<br>
			<div class="tab-content">
				<div id="findId" class="tab-pane fade in active">
					<form action="/meoui//member/idsearch" method="post">
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="usr">이름</label> <input type="text"
									class="form-control" id="idSearchName">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="idSearchMail">

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="idBtn">조회</button>
							</div>
						</div>
					</form>
				</div>
				<div id="findPwd" class="tab-pane fade">
					<form>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">아이디</label> <input type="text"
									class="form-control" id="pwSearchId" name="memberId">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="usr">이름</label> <input type="text"
									class="form-control" id="pwSearchName" name="garaName">
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="pwSearchMail" name="garaMail">

							</div>
							<div class="form-group">
								<label for="email"></label>
								<button type="submit" class="btn btn-default" id="pwBtn">조회</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#pwBtn").on("click", function() {
			var memberId= $("#pwSearchId").val()
			var garaName= $("#idSearchName").val()
			var garaMail= $("#idSearchMail").val()
			$.ajax({
				type:"post",
				url:"/meoui/member/pwsearch",
				data:{memberId:memberId, garaName: garaName, garaMail:garaMail},
				success:function(reulst){
					alert("찾으신 비밀번호는"+result+"입니다.")
				}
			})
		})
	})	
</script>
</html>