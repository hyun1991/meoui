<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/meoui/css/index.css">
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  		<!-- 지시자 -->
  		<ol class="carousel-indicators">
    		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    		<li data-target="#myCarousel" data-slide-to="1"></li>
    		<li data-target="#myCarousel" data-slide-to="2"></li>
  		</ol>

  		<!-- 메인 비주얼 영역 이미지 슬라이드 -->
  	<div class="carousel-inner" role="listbox">
    	<div class="item active">
      		<img src="/meoui/images/jejudo.png" alt="테스트" width="700px" height="550px">
      	<div class="carousel-caption">
        <h2>제주를부탁해</h2>
       	<h3>제주도 관광지를 소개해 드리겠습니다</h3>
      	</div> 
    	</div>

    	<div class="item">
      		<img src="/meoui/images/jejudo2.jpg" alt="테스트" width="700px" height="550px">
      	<div class="carousel-caption">
        		<h2>제주를부탁해</h2>
        		<h3>제주도 숙박시설을 안내해 드리겠습니다</h3>
      	</div> 
    	</div>

    	<div class="item">
      		<img src="/meoui/images/jejudo3.jpg" alt="테스트" width="500px" height="550px">
      		<div class="carousel-caption">
        		<h2>제주를부탁해</h2>
        		<h3>여행을 떠나세요</h3>
      		</div> 
    	</div>
  	</div>
  	<br/>
  	<br/>
  	<br/>
  	<div class="logoInfo">
  	<img src="/meoui/images/jejuInfo.png" alt="테스트">
  	</div>
			<div class="row  text-center" style="margin-bottom: 50px;">
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/jejufestival1.jpg" alt="skinscuber"
						style="margin-bottom: 20px;"  width="300px" height="200px">
					<p>
						<strong>제주도 벛꽃축제</strong>
					</p>
					<p>2017년 03.31 ~ 04.09</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/jejufestival2.jpg" alt="jejufood"
						style="margin-bottom: 20px;" width="300px" height="200px">
					<p>
						<strong>제주 유체꽃축제</strong>
					</p>
					<p>2017년 04.01 ~ 04.09 </p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive" src="/meoui/images/jejufestival3.jpg"
						alt="Olle" style="margin-bottom: 20px;"  width="300px" height="200px">
					<p>
						<strong>제주들불축제</strong>
					</p>
					<p>2017년 03.02 ~ 03.05</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/jejufestival4.png" alt="tradition"
						style="margin-bottom: 20px;"  width="300px" height="200px">
					<p>
						<strong>제주청보리축제</strong>
					</p>
					<p>2017년 04.08 ~ 05.07</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
			</div>
  	
  		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    		<span class="sr-only">Previous</span>
  		</a>
  		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    		<span class="sr-only">Next</span>
  		</a>
	</div>
</body>
</html>