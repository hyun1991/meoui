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
			<h2>관광지 찾기</h2>
			<br>
			</div>
				<div class="row">
			<br>
			<div class="tab-content">
				<div id="findId" class="tab-pane fade in active">
					<form action="/meoui//member/idsearch" method="post">
						<div class="form-group row">
							<div class="form-group col-md-6">
								<label for="usr">이름</label> <input type="text"
									class="form-control" id="findSite">
							</div>
						</div>
						<div class="form-group row">
							<p id="target">
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="findSite">조회</button>
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
		$("#findSite").on("click", function() {
			var siteName= $("#siteName").val()
			$.ajax({
				type:"post",
				url:"/meoui/site/view",
				data:{siteName:siteName},
				success:function(resultt){
					$("#target").html(result)
				}
			})
		})
	})	
</script>
</html>