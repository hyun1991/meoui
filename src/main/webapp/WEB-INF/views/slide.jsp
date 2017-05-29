<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/meoui/js/packed.js"></script>
<style>
* {margin:0; padding:0}
p {line-height:1.4; margin-bottom:12px}
#wrapper {width:578px; margin:75px auto}

.sliderbutton {float:left; width:32px; padding-top:134px}
.sliderbutton img {cursor:pointer}
.sliderbutton img:hover {background:#666}
#slider {float:left; position:relative; overflow:auto; width:500px; height:300px; border:2px solid #fff; background:#fff}
#slider ul {position:absolute; list-style:none; top:0; left:0}
#slider li {float:left; width:500px; height:300px; padding-right:10px}

.pagination {float:left; list-style:none; height:25px; margin:15px 0 0 32px}
.pagination li {float:left; cursor:pointer; padding:5px 8px; background:#666; border:1px solid #999; margin:0 4px 0 0; text-align:center; color:#222}
.pagination li:hover {background:#777; border:1px solid #bbb; color:#000}
li.current {border:1px solid #ccc; background:#888}

li#content {width:464px; height:270px; padding:15px 28px 15px 18px}
#content h1 {font:22px Georgia,Verdana; margin-bottom:15px; color:#036}
</style>
</head>
<body>
	<div id="wrapper">
	<div>
		<div class="sliderbutton"><img src="/meoui/images/left.gif" width="32" height="38" alt="Previous" onclick="slideshow.move(-1)" /></div>
		<div id="slider">
			<ul>
				<li id="content">
					<h1>제주도</h1>
					<p>meoui</p>
				</li>
				<li><img src="/meoui/images/jeju.jpg" width="900px" height="400" alt="알수없음" /></li>
				<li><img src="/meoui/images/jeju.jpg" width="900px" height="400" alt="알수없음" /></li>
				<li><img src="/meoui/images/jeju.jpg" width="900px" height="400" alt="알수없음" /></li>
			</ul>
		</div>
		<div class="sliderbutton"><img src="/meoui/images/right.gif" width="32" height="38" alt="Next" onclick="slideshow.move(1)" /></div>
	</div>
	<ul id="pagination" class="pagination">
		<li onclick="slideshow.pos(0)">1</li>
		<li onclick="slideshow.pos(1)">2</li>
		<li onclick="slideshow.pos(2)">3</li>
		<li onclick="slideshow.pos(3)">4</li>
	</ul>
</div>
<script type="text/javascript">
var slideshow=new TINY.slider.slide('slideshow',{
	id:'slider',
	auto:3,
	resume:true,
	vertical:false,
	navid:'pagination',
	activeclass:'current',
	position:0
});
</script>
</body>
</html>