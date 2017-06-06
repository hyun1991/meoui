<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services "></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





<style>
footer {
	position: fixed;
}
/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
	position: fixed;
	width: 100%;
	height: 80%;
}

#sidebar-wrapper {
	position: fixed;
	width: 25%;
	height: 80%;
	margin-left: -250px;
	background: #ffffff;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
	height: 100%;
}

#divview {
	width: 100%;
	height: 80%;
}

/* 사이드바 스타일 */
.sidebar-nav {
	width: 100%;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
	width: 100%;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

.ppp {
	text-align: right;
	margin-right: 30px;
}
</style>

<!-- 이미지 -->
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});
	
	
	$(this).ekkoLightbox({
	    alwaysShowClose: true,
	    onShown: function() {
	        console.log('Checking our the events huh?');
	    },
	    onNavigate: function(direction, itemIndex) {
	        console.log('Navigating '+direction+'. Current item: '+itemIndex);
	    }
	    ...
	});
</script>

<script>
	$(function() {
		var $win = $(window);
		var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

		/*사용자 설정 값 시작*/
		var speed = 500; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
		var $layer = $('.float_sidebar'); // 레이어 셀렉팅
		var layerTopOffset = 50
		px; // 레이어 높이 상한선, 단위:px
		$layer.css('position', 'relative').css('z-index', '1');
		/*사용자 설정 값 끝*/

		// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
		if (top > 0)
			$win.scrollTop(layerTopOffset + top);
		else
			$win.scrollTop(0);

		//스크롤이벤트가 발생하면
		$(window).scroll(function() {
			yPosition = $win.scrollTop() - 1100; //이부분을 조정해서 화면에 보이도록 맞추세요
			if (yPosition < 0) {
				yPosition = 0;
			}
			$layer.animate({
				"top" : yPosition
			}, {
				duration : speed,
				easing : easing,
				queue : false
			});
		});
	});
</script>
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

#divview {
	margin-left: 30%;
	margin-right: 30%;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=0733036d66ec867aa0960ee525091024&libraries=services ">
	
</script>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>


	<button id="sidebar" type="button"
		class="btn btn-primary .float_sidebar" data-toggle="modal"
		data-target="#myModal">댓글쓰기</button>
	<form action="/meoui/meetingcomment/insert" method="POST">

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">

			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<label for="exampleInputPassword1">글 내용</label>
						<textarea class="form-control" rows="6" id="comment"
							name="meetingboardCommentContent" placeholder="contents"></textarea>
					</div>


					<div class="modal-footer">
						<button id="commit2" type="submit">작성</button>
					</div>
				</div>
			</div>

		</div>
	</form>




	<div id="page-wrapper" class="container">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">


				<c:forEach items="${comment.list }" var="list">
					<div class="sidebar-nav li">
						<hr />
						<p class="ppp">
							<strong>${list.meetingboardCommentContent }</strong>
						</p>
						<br>

						<p class="ppp">작성자 : ${list.memberName }</p>

						<p class="ppp">
							<fmt:formatDate value="${list.meetingboardCommentDate}"
								pattern="yyyy년MM월dd일" />
						</p>
						<p>
							<c:if test="${list.memberNo eq memberNo }">
								<form class="ppp"
									action="/meoui/meetingcomment/delete/${list.meetingboardCommentNo }"
									method="POST">
									<button id="commit" type="submit">댓글 삭제</button>
									<hr />
								</form>
							</c:if>
					</div>
				</c:forEach>
			</ul>
		</div>


		<!-- 메인 -->
		<div id="page-content-wrapper">
			<a href="/meoui/meetingboard/update"><button id="sidebar"
					type="button" class="btn btn-primary .float_sidebar"
					data-toggle="modal" style="margin-left: 80%;"
					data-target="#myModal">수정하기</button></a>




			<div class="container-fluid">

				<div class="row text-center" id="page-content-wrapper">
					<div class="col-sm-3 container-fluid" id="divview"
						style="margin-left: 10%; margin-right: 10%; width: 80%; height: 80%;">
						<!-- <a href="/meoui/meetingboard/view/${meeting.meetingNo}"> <img
							class="image-responsive"
							src="/meoui/images/${board.meetingboardImg }" alt="skinscuber"
							style="margin-bottom: 20px;">
							 -->

					<!-- 
						<img style="width: 50%; height: 60%;"
							src="/meoui/images/${board.meetingboardImg }"
							class="img-thumbnail" alt="Cinque Terre" width="40%" height="50%">
 -->

<a href="/meoui/images/${board.meetingboardImg }" data-toggle="lightbox" data-title="A random title" data-footer="A custom footer text">
    <img src="/meoui/images/${board.meetingboardImg }"  style="width: 50%; height: 60%;" class="img-fluid">
</a>




						<p style="margin-top: 10px;">
							<strong>${board.meetingboardTitle }</strong>
						</p>

						<p>${board.meetingboardContent }</p>

						<p>${board.memberName }</p>

						<!-- <p>${board.meetingboardCnt }</p> -->
						<p>
							<fmt:formatDate value="${board.meetingboardDate}"
								pattern="yyyy년MM월dd일" />
						</p>
						<c:if test="${board.memberNo eq memberNo }">
							<form action="/meoui/meetingboard/delete/${board.meetingboardNo}"
								method="POST" style="margin-left: 90%;">
								<button id="commit3" type="submit"
									class="w3-button w3-block w3-white w3-border"
									style="width: 134px; margin-right: 0; text-align: content:;">
									게시글 삭제</button>
							</form>
							<!-- 		<a href="/meoui/meetingboard/update">
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">모임수정하기</button></a> -->
						</c:if>
					</div>
				</div>

			</div>

		</div>
	</div>








	<!-- <h2>모임 게시판 상세 뷰</h2> -->
	<!--<div class="row text-center" id="page-content-wrapper">
		<div class="col-sm-3 container-fluid" id="divview">
			<a href="/meoui/meetingboard/view/${meeting.meetingNo}"> <img
				class="image-responsive"
				src="/meoui/images/${board.meetingboardImg }" alt="skinscuber"
				style="margin-bottom: 20px;">
			</a>
			<p>
				<strong>${board.meetingboardTitle }</strong>
			</p>

			<p>${board.meetingboardContent }</p>

			<p>${board.memberName }</p>

			<p>${board.meetingboardCnt }</p>

			<p>
				<fmt:formatDate value="${board.meetingboardDate}"
					pattern="yyyy년MM월dd일" />
			</p>

			<form action="/meoui/meetingboard/delete/${board.meetingboardNo}"
				method="POST">
				<button id="commit" type="submit"
					class="w3-button w3-block w3-white w3-border">게시글 삭제</button>
			</form>
		</div>
	</div> -->


	<!--<c:forEach items="${comment.list }" var="list">
		<div id="divview">

			<p>
				<strong>${list.meetingboardCommentContent }</strong>
			</p>
			<p>작성자 : ${list.memberName }</p>

			<p>
				<fmt:formatDate value="${list.meetingboardCommentDate}"
					pattern="yyyy년MM월dd일" />
			</p>
			<p>
			<form
				action="/meoui/metingcomment/delete/${list.meetingboardCommentNo }"
				method="POST">
				<button id="commit" type="submit">댓글 삭제</button>
				<br> <br> <br>
			</form>

		</div>
	</c:forEach>  -->



	<!-- 	<button id = "sidebar"type="button" class="btn btn-primary .float_sidebar"  data-toggle="modal"
		data-target="#myModal">댓글쓰기</button>
	<form action="/meoui/metingcomment/insert" method="POST"> -->

	<!-- Modal -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		
		<div class="modal-dialog" role="document">
			<div class="modal-content">	
				<div class="modal-body"><label for="exampleInputPassword1">글 내용</label>
				 <textarea class="form-control" rows="5" id="comment" name="meetingboardCommentContent" placeholder="contents"></textarea>
					</div>
				
				
				<div class="modal-footer">
					<button id="commit" type="submit">작성</button>
				</div>
			</div>
		</div>
		
	</div>
		</form> -->

	<!-- <form action="/meoui/metingcomment/insert" method="POST">
		<input type="text" id="meetingboardCommentContent"
			name="meetingboardCommentContent">


		<button id="commit" type="submit">대글작성하기</button>

	</form>

 -->

<script>
	$(document).ready(function() {
		$("#commit").on("click", function() {
			alert("댓글이 삭제되었습니다")
		})
	})
	$(document).ready(function() {
		$("#commit2").on("click", function() {
			alert("댓글을 작성하였습니다.")
		})
	})
	$(document).ready(function() {
		$("#commit3").on("click", function() {
			alert("게시글이 삭제되었습니다")
		})
	})
</script>

</body>
</html>