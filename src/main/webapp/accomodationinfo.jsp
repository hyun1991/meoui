<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Main Page</title>
</head>
<body>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-2">
				<%@include file="/sideNavigation.jsp"%>
			</div>

			<div class="col-md-10">
				<form class="form-inline pull-right">
					<div class="input-group">
						<input type="search" class="form-control" size="50"
							placeholder="검색" required>
						<div class="input-group-btn">
							<button type="button" class="btn btn-success">검색</button>
						</div>
					</div>
				</form>
				<h3>&nbsp</h3>
				<h3>카테고리 별 제주 숙박업소 노출</h3>
				<br>
				<div class="col-md-8">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="/meoui/jeju.jpg" alt="Chania">
								<div class="carousel-caption">
									<h3>Los Angeles</h3>
									<p>LA is always so much fun!</p>
								</div>
							</div>

							<div class="item">
								<img src="/meoui/jeju.jpg" alt="Chicago">
								<div class="carousel-caption">
									<h3>Chicago</h3>
									<p>Thank you, Chicago!</p>
								</div>
							</div>

							<div class="item">
								<img src="/meoui/jeju.jpg" alt="New York">
								<div class="carousel-caption">
									<h3>New York</h3>
									<p>We love the Big Apple!</p>
								</div>
							</div>
						</div>


						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<br>

					<div class="col-md-2">
						<label for="usr">변은지</label>
					</div>
					<div class="col-md-10">
						<p>Just wanted to add that you shouldn't use href attribute
							ona tr, since it's not a valid attribute for this element. Use
							data attributes instead: data-url="{linkurl}" and in js code:
							$(this).data('url') – Maksim Vi. Jan 17 '14 at 19:57 8 You can
							avoid using a class on each row, and decorate the table with a
							class name of clickable_row (CamelCase is against HTML standards
							and should be lower case (I had issues with cross browser a few
							times with this)) and then the jQuery is $('.clickable_row</p>
					</div>
					<br>
					<div class="form-group col-md-12 text-left">
						<div class="form-group">
							<label for="usr">댓글</label>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="4" id="comment"></textarea>
						</div>
						<a href="#" class="btn btn-success pull-right">댓글 작성</a>
					</div>
				</div>

				<div class="col-md-3 text-left">
					<label for="usr">이동 거리</label><br>
					<p>장기백</p>
					<br> <label for="usr">소요 시간</label><br>
					<p>장기백</p>
					<br> <label for="usr">출발 시간</label><br>
					<p>장기백</p>
					<br> <label for="usr">도착 시간</label>
					<p>장기백</p>
					<br> <label for="usr">자세한 위치 정보</label>
					<p>장기백 : 말했잖아 지금 왜 듣질않아 왜 듣지도 않고 그러냐 뭘 ㅋㅋㅋㅋㅋㅋ 근데 아 알았어 음...언제 한
						줄 끝나</p>
					<br> <br>
					<div class="text-center">
						<a href="#" class="btn btn-success">객실 보기</a> <a href="#"
							class="btn btn-success">예약</a>
					</div>
					<br> <img class="img-responsive" src="/meoui/images/jeju.jpg"
						alt="Chicago"><br> <img class="img-responsive"
						src="/meoui/images/jeju.jpg" alt="Chicago"><br> <img
						class="img-responsive" src="/meoui/images/jeju.jpg" alt="Chicago"><br>
					<img class="img-responsive" src="/meoui/imgaes/jeju.jpg" alt="Chicago">
				</div>
				<br>
			</div>
		</div>

	</div>




</body>
</html>