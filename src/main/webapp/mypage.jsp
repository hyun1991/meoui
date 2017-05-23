<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoert" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
footer {
	background-color: grey;
}
</style>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="container">
		<h2>마이페이지</h2>
		<br>
		<div class="row">
		<!-- 
			<div><h3>회원아이디:</h3>${result.accommodation.accommodationName }</div><br>
	<div><h3>이름:</h3>${result.accommodation.accommodationPhone }</div>
	<div><h3>연락처:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>주소지:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>이메일:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>직업:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>성별:</h3>${result.accommodation.accommodationAddress }</div>
	<div><h3>가입일:</h3>${result.accommodation.accommodationAddress }</div>
	<div>작성일: <fmt:formatDate value="${result.accommodationCommentDate}" pattern="yyyy년 MM월 dd일" /></div>
	<div><h3>취미:</h3>${result.accommodation.accommodationAddress }</div>
	<input type="hidden" value="${result.accommodation.ownerNo }" id="ownerNo">
	<div><a href="/meoui/room/view/${result.accommodation.accommodationNo }&${result.accommodation.ownerNo }"><button>객실정보 조회하기</button></a></div>
	<div><a href="/meoui/accommodaion/list?pageNo=1"><button id="sessionBtn">리스트로 이동</button></a></div>
		
			
	private int memberNo;					//	회원번호(PK)
	private String memberId;				//	회원아이디
	private String memberPassword;			//	패스워드
	private String memberName;				//	이름
	private String memberPhone;				//	연락처
	private String memberAddress;			//	주소지
	private String memberMail;				//	이메일
	private String memberJob;				//	직업
	private String memberGender;			//	성별
	private Date memberStartdate;			//	가입일
	private String memberHobby;				//	취미
		 -->
			<div class="col-md-4">
				<label for="usr">아이디: </label>${result.memberId } <br> 
				<label for="usr">이름: </label>${result.memberName }<br>
				<label for="usr">연락처: </label>${result.memberPhone }<br>
				<label for="usr">직업: </label>${result.memberJob }<br>
				<label for="usr">성별: </label>${result.memberGender }<br>
				<label for="usr">가입일: </label>${result.memberStartdate }<br>
				<label for="usr">이메일: </label>${result.memberMail }<br>
				<label for="usr">취미: </label>${result.memberHobby }<br>
				<label for="usr">주소: </label>${result.memberAddress }<br>
				<a href="#"><button>내정보 수정하기</button></a><br>
			</div>
			<a href="#" class="btn btn-success">쪽지함</a>
		</div>
		<h3>내 여행 도우미</h3>
		<br>
		<div class="btn-group row">
			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내가 예약한 숙박업소 확인</a> <a href="#"
						class="btn btn-success">내가 짠 코스 보기</a>
				</div>
			</div>
		</div>
		<div class="form-group row">

			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내 여행 일정 보기</a> <a href="#"
						class="btn btn-success">즐겨찾기 목록</a>
				</div>
			</div>
		</div>
		<h3>내 모임 도우미</h3>
		<br>
		<div class="btn-group row">
			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">내가 가입한 모임</a> <a href="#"
						class="btn btn-success">내 친구 목록 확인</a>
				</div>
			</div>
		</div>
		<div class="form-group row">

			<div class="form-group col-md-6">
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-success">접속한 회원 목록 확인</a> <a href="#"
						class="btn btn-success">즐겨찾기 목록</a>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
</body>
</html>