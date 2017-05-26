<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron text-center">
		<form class="form-inline" action="/meoui/site/view" method="post">
			 <div class="input-group">
			 	<input type="text" class="form-control" size="50" id="siteName" name="siteName" placeholder="이름으로 검색" required>
			 	<div class="input-group-btn">
        			<button type="button" class="btn btn-danger" id="findSite">검색</button>
      			</div>
			 </div>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {

		$("#findSite").on("click", function() {
			$.ajax({
				type : "post",
				url : "/meoui/site/view",
				data : {
					siteName : $("#siteName").val()
				},
				success : function(response) {
					alert(result)
					$("#target").html(result)
				}
			})
		})
	})
</script>
</html>