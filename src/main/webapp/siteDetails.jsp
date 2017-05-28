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
	<div class="row">
	<div class="jumbotron text-center">
		<form class="form-inline" action="/meoui/site/details" method="post">
			 <div class="input-group">
					
				<br>
						
			 </div>
		</form>
	</div>
	
	</div>
</body>
<script>
	$(document).ready(function() {

		$("#findSite").on("click", function() {
			$.ajax({
				type : "post",
				url : "/meoui/site/details",
				success : function(response) {
					$("#target").append(response);
				}
			})
		})
	})
</script>
</html>