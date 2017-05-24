<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
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
</head>
<body>
	<div class="container">
    	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        	<div class="panel panel-success">
            	<div class="panel-heading">
                	<div class="panel-title"><h1>숙박업주 회원 로그인 페이지</h1></div>
            	</div>
            	<div class="panel-body">
                <form id="login-form">
                    <div>
                        <input type="text" class="form-control" id="ownerId" name="ownerId" placeholder="아이디를 입력하세요" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="ownerPassword" id="ownerPassword" placeholder="패스워드를 입력하세요">
                    </div>
                    <div>
                        <button type="button" class="form-control btn btn-primary" id="loginBtn">로그인</button>
                    </div>
                </form>
            	</div>
        	</div>
   		</div>
	</div>
</body>
<script>
	$("#loginBtn").on("click", function() {
		var ownerId = $("#ownerId").val();
		var ownerPassword = $("#ownerPassword").val();
		$.ajax({
			type : "post",
			url : "/meoui/manage/login",
			data : {ownerId : ownerId, ownerPassword: ownerPassword},
			success : function(result) {
				console.log(result)
				if (result == "success") {
					alert("환영합니다.")
					window.location.href="/meoui/manage/home";
				} else {
					alert("아이디와 비밀번호를 확인해 주세요.")
				}
			}
		})
	})
</script>
</html>