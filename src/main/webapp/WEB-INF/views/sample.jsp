<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}

.mySlides {
	display: none
}
</style>
<body>

	<!-- Top menu on small screens -->
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
		<span class="w3-bar-item">Rental</span> <a href="javascript:void(0)"
			class="w3-right w3-bar-item w3-button" onclick="w3_open()"><i
			class="fa fa-bars"></i></a>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-white" style="margin-left: 260px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 80px"></div>

		<!-- Slideshow Header -->
		<div class="w3-container" id="apartment">
			<h2 class="w3-text-green">객실 상세페이지</h2>
			<!-- 이미지 뷰 -->
			<div class="w3-display-container mySlides">
				<img src="/meoui/images/bang.jpg"
					style="width: 100%; margin-bottom: -6px">
				<div class="w3-display-bottomleft w3-container w3-black">
					<p>Living Room</p>
				</div>
			</div>
			<div class="w3-display-container mySlides">
				<img src="/meoui/images/bang.jpg"
					style="width: 100%; margin-bottom: -6px">
				<div class="w3-display-bottomleft w3-container w3-black">
					<p>Dining Room</p>
				</div>
			</div>
			<div class="w3-display-container mySlides">
				<img src="/meoui/images/bang.jpg"
					style="width: 100%; margin-bottom: -6px">
				<div class="w3-display-bottomleft w3-container w3-black">
					<p>Bedroom</p>
				</div>
			</div>
			<div class="w3-display-container mySlides">
				<img src="/meoui/images/bang.jpg"
					style="width: 100%; margin-bottom: -6px">
				<div class="w3-display-bottomleft w3-container w3-black">
					<p>Living Room II</p>
				</div>
			</div>
		</div>
		<div class="w3-row-padding w3-section">
			<div class="w3-col s3">
				<img class="demo w3-opacity w3-hover-opacity-off"
					src="/meoui/images/bang.jpg" style="width: 100%; cursor: pointer"
					onclick="currentDiv(1)" title="Living room">
			</div>
			<div class="w3-col s3">
				<img class="demo w3-opacity w3-hover-opacity-off"
					src="/meoui/images/bang.jpg" style="width: 100%; cursor: pointer"
					onclick="currentDiv(2)" title="Dining room">
			</div>
			<div class="w3-col s3">
				<img class="demo w3-opacity w3-hover-opacity-off"
					src="/meoui/images/bang.jpg" style="width: 100%; cursor: pointer"
					onclick="currentDiv(3)" title="Bedroom">
			</div>
			<div class="w3-col s3">
				<img class="demo w3-opacity w3-hover-opacity-off"
					src="/meoui/images/bang.jpg"
					style="width: 100%; cursor: pointer" onclick="currentDiv(4)"
					title="Second Living Room">
			</div>
		</div>

		<div class="w3-container">
			<h4>
				<strong>객실정보</strong>
			</h4>
			<div class="w3-row w3-large">
				<div class="w3-col s6">
					<p>
						<i class="fa fa-fw fa-male"></i> Max people: 4
					</p>
					<p>
						<i class="fa fa-fw fa-bath"></i> Bathrooms: 2
					</p>
					<p>
						<i class="fa fa-fw fa-bed"></i> Bedrooms: 1
					</p>
				</div>
				<div class="w3-col s6">
					<p>
						<i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM
					</p>
					<p>
						<i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM
					</p>
				</div>
			</div>
			<hr>

			<h4>
				<strong>옵션</strong>
			</h4>
			<div class="w3-row w3-large">
				<div class="w3-col s6">
					<p>
						<i class="fa fa-fw fa-shower"></i> Shower
					</p>
					<p>
						<i class="fa fa-fw fa-wifi"></i> WiFi
					</p>
					<p>
						<i class="fa fa-fw fa-tv"></i> TV
					</p>
				</div>
				<div class="w3-col s6">
					<p>
						<i class="fa fa-fw fa-cutlery"></i> Kitchen
					</p>
					<p>
						<i class="fa fa-fw fa-thermometer"></i> Heating
					</p>
					<p>
						<i class="fa fa-fw fa-wheelchair"></i> Accessible
					</p>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<script>
		// Script to open and close sidebar when on tablets and phones
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Slideshow Apartment Images
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(
						" w3-opacity-off", "");
			}
			x[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " w3-opacity-off";
		}
	</script>

</body>
</html>