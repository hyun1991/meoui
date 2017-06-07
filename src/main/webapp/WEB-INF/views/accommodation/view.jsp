<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박업소 정보</title>
<style>
</style>
</head>
<body>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<img src="/meoui/images/${result.accommodation.accommodationImg}" 
				title="클릭하시면 원본크기로 보실 수 있습니다."
				style="cursor: pointer;" onclick="doImgPop('/meoui/images/${result.accommodation.accommodationImg}')"/>
			</div>
			<div>
				<h3>숙박시설이름</h3>${result.accommodation.accommodationName }
			</div>
			<div>
				<h3>대표전화</h3>${result.accommodation.accommodationPhone }
			</div>
			<div>
				<h3>시설위치</h3>${result.accommodation.accommodationAddress }
			</div>
			<hr size="5">
			<div class="col-xs-4" style="margin-top: 10px">
				<a href="/meoui/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }">
					<button type="button"
					class="w3-button w3-block w3-white w3-border">객실정보 조회하기</button></a>
			</div>
			<div class="col-xs-4">
				<a href="/meoui/accommodaion/list?pageNo=1"><button
							type="button" class="w3-button w3-block w3-white w3-border">
							리스트로 이동</button></a>
			</div>
		</div>
		<hr>
		<input type="hidden"
					value="${result.accommodation.ownerNo }" id="ownerNo">
		<div align="center">
			<h2 style="margin-left: 10px">오시는길</h2>
		</div>
		<div class="row">
			<img src="/meoui/images/${result.accommodation.accommodationDirections}" style="margin-left: 10px">
		</div>
	</div>

	<hr>
	<h2 align="center">댓글작성란</h2>
	<br>
		<div class="container">
		<form action="/meoui/accommodationComment/insert" method="post">
			<div class="container">
				<div class="col-xs-4">
					<textarea class="form-control col-sm-5" rows="5"
						placeholder="댓글을 작성해 주세요." name="accommodationCommentContent">
				</textarea>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="col-xs-4">
					<select class="form-control input-lg"
						name="accommodationCommentAvg">
						<option value="">평점</option>
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="col-xs-4">
					<button type="submit" class="w3-button w3-block w3-white w3-border">댓글작성</button>
				</div>
			</div>
		</form>
		</div>
	<hr>
	<c:forEach items="${result.comment }" var="comment">
		<div class="container">
			<input type="hidden" id="memberNo" value="${comment.memberNo }"
				class="form-control input-lg">
			<div class="form-group">${comment.accommodationCommentContent}
			</div>
			<c:forEach items="${result.member }" var="member">
				<div class="btn-r">작성자: ${member.memberId }</div>
			</c:forEach>
			<div class="form-group">${comment.byul }</div>
			<div class="form-group">
				작성일:
				<fmt:formatDate value="${comment.accommodationCommentDate}"
					pattern="yyyy년 MM월 dd일" />
			</div>
			<div class="viewdelete">
				<c:if test="${comment.memberNo eq memberNo }">
					<a
						href="/meoui/accommodationComment/delete/${comment.accommodationCommentNo }">
						<button type="button"
							class="w3-button w3-block w3-white w3-border" id="deleteBtn">댓글
							삭제하기</button>
					</a>
				</c:if>
			</div>
			<hr>
		</div>
	</c:forEach>
	<footer>
		<%@include file="/footer.jsp" %>
	</footer>
</body>
<script>
	$(document).ready(function() {
		$("#deleteBtn").on("click", function() {
			alert("댓글이 삭제되었습니다")
		})
	})
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