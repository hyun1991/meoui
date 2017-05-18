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
	<link rel="stylesheet" type="text/css" href="css/hanjoon.css">
	<link rel="stylesheet" type="text/css" href="css/sejin.css">
<title>Insert title here</title>
</head>
	
<body>
	<%@include file="adminNavbar.jsp"%>
	<div class="container">
		<h2>일반회원관리</h2>
		<br>
		<div class="row">
			<table class="table table-hover table-responsive">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>핸드폰번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>jejujeju</td>
						<td>제주야놀자</td>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<td>2</td>
						<td>jejujeju</td>
						<td>제주야놀자</td>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<td>3</td>
						<td>jejujeju</td>
						<td>제주야놀자</td>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<td>4</td>
						<td>jejujeju</td>
						<td>제주야놀자</td>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<td>5</td>
						<td>jejujeju</td>
						<td>제주야놀자</td>
						<td>010-1234-5678</td>
					</tr>
					

				</tbody>
			</table>
			<div class="row text-center">
			
				<ul class="pagination pagination-md">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
			<div class="row">
				<a href="" class="btn btn-success">수정</a>
			<div class="container">
    <div class="row">
    <div class="col-md-6 col-md-push-1 ">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-2">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <option>이름</option>
                            <option>아이디</option>
                        </select>
                    </div>

                    <input type="hidden" name="search_param" value="all" id="search_param">
                    <input type="text" class="form-control" name="x" placeholder="Search term...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
</div>
			</div>
			
		</div>
	</div>
</body>
</html>