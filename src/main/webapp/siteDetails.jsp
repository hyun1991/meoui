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
				<p id="target">		
				<br>
						<a href="/meoui/ticket/insert?siteNo=${result.siteNo}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">티켓 추가</button>
						</a>
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
					alert(result)
					$("#target").html(result)
				}
			})
		})
	})
</script>
</html>