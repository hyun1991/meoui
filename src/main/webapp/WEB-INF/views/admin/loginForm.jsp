<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
</head>
<body>
	<div class="container">
    	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        	<div class="panel panel-success">
            	<div class="panel-heading">
                	<div class="panel-title"><h1>홈페이지 관리자 로그인 페이지</h1></div>
            	</div>
            	<div class="panel-body">
                <form action="/meoui/admin/login" method="POST">
                    <div>
                        <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" id="adminpw" name="password" placeholder="패스워드를 입력하세요">
                    </div>	
                    <div>
                    	<p id="target"></p><br>
                        <button type="button" class="form-control btn btn-primary" id="loginbtn">로그인</button>
                    </div>
                    </form>
            	</div>
        	</div>
   		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#loginbtn").on("click", function() {
			var username = $("#username").val();
			var password = $("#adminpw").val();
			$.ajax({
				type : "post",
				url : "/meoui/admin/login",
				data : {username:username, password:password},
				success : function(result) {
					console.log(result)
					if (result == "success") {
						alert("환영합니다.")
						window.location.href="/meoui/admin/home";
					} else {
						$("#target").html("아이디와 비밀번호를 확인해 주세요.").css("color", "red")
					}
				}
			})
		})
	})
</script>
</html>