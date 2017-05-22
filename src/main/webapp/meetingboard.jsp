<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<title>모임</title>
</head>
<style>
#headTitle {
	font-family: gungsuh, serif;
}

img {
	width: 100%;
	height: auto;
}

.btn {
	background-color: white;
	color: #f76ce4;
	margin: 30px;
}

@keyframes menuBlink { 0% {
	opacity: 0 }
	49%{opacity: 0}
    50%{opacity:1}
}
.glyphicon-heart {
	animation: menuBlink 1s infinite;
}
</style>
<body>

	<header>
		<%@include file="/navbar.jsp"%>
	</header>
		<div class="container">
			<div class="row  text-center">
				<div class="col-md-10">
					<video loop width="100%" height="auto" autoplay>
						<source src="/meoui/videos/meetupmain.mp4" type="video/mp4">
					</video>
				</div>
				<div class="col-md-1 text-center">
					<p
						style="writing-mode: vertical-rl; font-family: Gungsuh; font-size: 40px; margin-top: 20px;">인연을
						찾아보세요&nbsp、</p>
					<hr style="border: 2px solid #f76ce4;">
				</div>
				<div class="col-md-1 text-center"">
					<p
						style="writing-mode: vertical-rl; font-family: Gungsuh; font-size: 40px; margin-top: 20px;">아름다운
						제주에서 새로운</p>
					<hr style="border: 2px solid #f76ce4;">
				</div>

			</div>

			<h1 id="headTitle" style="margin-top: 50px;">꽃 한 송이가 그래그래 피었구나,</h1>
			<hr style="border: 4px solid #f76ce4; margin-bottom: 50px;">
			<div class="row  text-center" style="margin-bottom: 50px;">
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/skinscuber.jpg" alt="skinscuber"
						style="margin-bottom: 20px;">
					<p>
						<strong>스킨스쿠버</strong>
					</p>
					<p>Fri. 27 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/jejufood.jpg" alt="jejufood"
						style="margin-bottom: 20px;">
					<p>
						<strong>토속 음식</strong>
					</p>
					<p>Sat. 28 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive" src="/meoui/images/meetup/olle.png"
						alt="Olle" style="margin-bottom: 20px;">
					<p>
						<strong>올레 길 걷기</strong>
					</p>
					<p>Sun. 29 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/tradition.jpg" alt="tradition"
						style="margin-bottom: 20px;">
					<p>
						<strong>전통 체험</strong>
					</p>
					<p>Sun. 29 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
			</div>
			<div class="row  text-center" style="margin-bottom: 50px;"">
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/skinscuber.jpg" alt="skinscuber"
						style="margin-bottom: 20px;">
					<p>
						<strong>스킨스쿠버</strong>
					</p>
					<p>Fri. 27 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/jejufood.jpg" alt="jejufood"
						style="margin-bottom: 20px;">
					<p>
						<strong>New York</strong>
					</p>
					<p>Sat. 28 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive" src="/meoui/images/meetup/olle.png"
						alt="Olle" style="margin-bottom: 20px;">
					<p>
						<strong>올레 길 걷기</strong>
					</p>
					<p>Sun. 29 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
				<div class="col-sm-3">
					<img class="image-responsive"
						src="/meoui/images/meetup/tradition.jpg" alt="tradition"
						style="margin-bottom: 20px;">
					<p>
						<strong>전통 체험</strong>
					</p>
					<p>Sun. 29 November 2015</p>
					<button class="btn" style="border-color: #f76ce4;">참여하기</button>
				</div>
			</div>
			<hr style="border: 4px solid #f76ce4; margin-bottom: 50px;">
		</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
<!-- 벚꽃 -->
<script>
function randNum(min, max) {
	  min = Math.ceil(min);
	  max = Math.floor(max);
	  return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	_ = self.Flower = function(opts) {
	  this.left = opts.left;
	  this.top = opts.top;
	  this.size = randNum(1.5, 6);
	  this.drawFlower();
	};
	_.prototype = {
	  spinFlower: function(el) {
	    var r = 0;
	    var spd = Math.random() * (3 - 0.05) + 0.05;
	    (function spin() {
	      if (r === 350) {
	        r = 0;
	      } else {
	        r += spd;
	      }
	      el.style.transform = "rotate(" + r + "deg)";
	      requestAnimationFrame(spin);
	    })();
	  },
	  fall: function(el) {
	    var _this = this;
	    var max_right = _this.left + randNum(20, 50);
	    var max_left = _this.left - randNum(20, 50);
	    var dir_i = randNum(0, 1);
	    var directions = ["left", "right"];
	    var direction = directions[dir_i];
	    (function fall() {
	      if (_this.left === max_left) {
	        direction = "right";
	        max_left = _this.left - randNum(20, 50);
	      }
	      if (_this.left === max_right) {
	        direction = "left";
	        max_right = _this.left + randNum(20, 50);
	      }
	      if (direction === "left") {
	        _this.left -= 1;
	      } else {
	        _this.left += 1;
	      }
	      _this.top += 2;
	      el.style.top = _this.top + "px";
	      el.style.left = _this.left + "px";
	      requestAnimationFrame(fall);
	    })();
	  },
	  fadeOut: function(el) {
	    el.style.opacity = 1;

	    (function fade() {
	      if ((el.style.opacity -= 0.007) < 0) {
	        el.parentNode.removeChild(el);
	      } else {
	        requestAnimationFrame(fade);
	      }
	    })();
	  },
	  get petal() {
	    var petal = document.createElement("div");
	    petal.style.userSelect = "none";
	    petal.style.position = "absolute";
	    petal.style.background = "radial-gradient(white 10%, pink 70%)";
	    petal.style.backgroundSize = this.size + "vmin";
	    petal.style.backgroundPosition = "-" + this.size / 2 + "vmin 0";
	    petal.style.width = petal.style.height = this.size / 2 + "vmin";
	    petal.style.borderTopLeftRadius = petal.style.borderBottomRightRadius =
	      42.5 * this.size / 100 + "vmin";
	    return petal;
	  },
	  get petal_styles() {
	    return [
	      {
	        transform: "rotate(-47deg)",
	        left: "50%",
	        marginLeft: "-" + this.size / 4 + "vmin",
	        top: 0
	      },
	      {
	        transform: "rotate(15deg)",
	        left: "100%",
	        marginLeft: "-" + this.size * 39 / 100 + "vmin",
	        top: this.size * 17.5 / 100 + "vmin"
	      },
	      {
	        transform: "rotate(93deg)",
	        left: "100%",
	        marginLeft: "-" + this.size * 51 / 100 + "vmin",
	        top: this.size * 58 / 100 + "vmin"
	      },
	      {
	        transform: "rotate(175deg)",
	        left: "0%",
	        marginLeft: this.size * 5 / 100 + "vmin",
	        top: this.size * 58 / 100 + "vmin"
	      },
	      {
	        transform: "rotate(250deg)",
	        left: "0%",
	        marginLeft: -(this.size * 8) / 100 + "vmin",
	        top: this.size * 17.5 / 100 + "vmin"
	      }
	    ];
	  },
	  get flower() {
	    var flower = document.createElement("div");
	    flower.style.userSelect = "none";
	    flower.style.position = "absolute";
	    flower.style.left = this.left + "px";
	    flower.style.top = this.top + "px";
	    flower.style.width = this.size + "vmin";
	    flower.style.height = this.size + "vmin";
	    for (var i = 0; i < 5; i++) {
	      var petal = this.petal;
	      // var styles = this.petal_styles[i];
	      petal.style.transform = this.petal_styles[i]["transform"];
	      petal.style.top = this.petal_styles[i]["top"];
	      petal.style.left = this.petal_styles[i]["left"];
	      petal.style.marginLeft = this.petal_styles[i]["marginLeft"];
	      flower.appendChild(petal);
	    }
	    this.fadeOut(flower);
	    this.spinFlower(flower);
	    this.fall(flower);
	    return flower;
	  },
	  drawFlower: function() {
	    document.body.appendChild(this.flower);
	  }
	};

	window.addEventListener("mousedown", function(e) {
	  var amt = randNum(1, 5);
	  for (var i = 0; i < amt; i++) {
	    var top = randNum(e.clientY - 30, e.clientY + 30);
	    var left = randNum(e.clientX - 30, e.clientX + 10);
	    var flower = new Flower({
	      top: top,
	      left: left
	    });
	  }
	});

</script>
</html>