<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<style>
@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity
:

0
}
50%{
opacity
:

1
}
}
#headTitle, .step {
	font-family: 'Jeju Gothic', serif;
}

@
keyframes menuBlink { 0% {
	opacity: 0
}

49%{
opacity

:

0
}
50%{
opacity


:



1
}
}
.glyphicon-home {
	animation: menuBlink 1s infinite;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #orange;
	margin: 30px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<h2>상세 뷰</h2>
	<div class="row text-center">
		<div class="col-sm-3">
			<a href="/meoui/site/details/${site.siteNo}"> <img
				class="image-responsive" src="/meoui/images/${stie.siteImg}"
				alt="skinscuber" style="margin-bottom: 20px;">
			</a>

			
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<script>
	
</script>
</html>