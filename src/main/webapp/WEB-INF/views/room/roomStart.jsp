<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<head>
		<%@include file="/nav/navbar.jsp"%>
	</head>
<h1 id="headTitle" style="margin-top: 50px;" align="center">객실
	상세페이지</h1>
<div class="container">
	<hr>
	<div class="row text-center">
		<table class="table table-striped table-bordered table-hover"
			style="width: auto;">
				<tr>
					<th width="100px;">객실이름</th>
					<th>예약금액</th>
					<th>숙박가능인원</th>
					<th colspan="3">객실이미지</th>
					<th width="80px;">옵션</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${result.room }" var="room">
				<tr>
					<td width="100px;">${room.roomName}</td>
					<td>${room.roomPrice }(원)</td>
					<td>${room.roomUseNumber}(명)</td>
					<c:forEach items="${result.roomImg }" var="roomImg">
						<c:if test="${room.roomNo eq roomImg.roomNo}">
							<td>
							<img src="/meoui/images/${roomImg.roomImg}" width="240px" height="150px" title="클릭하시면 원본크기로 보실 수 있습니다."
							style="cursor: pointer;" onclick="doImgPop('/meoui/images/${roomImg.roomImg}')"/>
						</c:if>
					</c:forEach>
					<td width="80px;"><i class="fa fa-bath"></i><i class="fa fa-phone"></i><i class="fa fa-wifi"></i></td>
					<td><a
						href="/meoui/reserve/join?roomNo=${room.roomNo }&roomPrice=${room.roomPrice}">
							<button type="button"
								class="w3-button w3-block w3-white w3-border">예약</button>
					</a></td>
			</c:forEach>
		</table>
		<div>
			<a href="/meoui/accommodaion/list?pageNo=1">
				<button type="button" class="w3-button w3-block w3-white w3-border"
					id="btn">리스트 이동</button>
			</a>
		</div>
		<div>
			<a
				href="/meoui/accommodation/view/<%=(Integer) session.getAttribute("accommodationNo")%>">
				<button type="button" class="w3-button w3-block w3-white w3-border">펜션정보</button>
			</a>
		</div>
	</div>
</div>
<footer>
	<%@include file="/footer.jsp" %>
</footer>
</body>
<script>
	function doImgPop(img){ 
	 img1= new Image(); 
	 img1.src=(img); 
	 imgControll(img); 
	} 
	  
	function imgControll(img){ 
	 if((img1.width!=0)&&(img1.height!=0)){ 
	    viewImage(img); 
	  } 
	  else{ 
	     controller="imgControll('"+img+"')"; 
	     intervalID=setTimeout(controller,20); 
	  } 
	}
	function viewImage(img){ 
	 W=img1.width; 
	 H=img1.height; 
	 O="width="+W+",height="+H+",scrollbars=yes"; 
	 imgWin=window.open("","",O); 
	 imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}
</script>
</html>