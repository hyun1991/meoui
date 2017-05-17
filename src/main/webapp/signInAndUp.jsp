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
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
label, .btn {
	font-family: 'Jeju Gothic', serif;
}
</style>
</head>
<body>
	<!-- 로그인 -->
	<form class="text-left" action="/meoui/member/login" method="post">
		<div id="signInForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<label class="modal-title">로그인</label>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="usr">아이디</label><br> <input type="text"
								class="form-control" id="memberId" name="memberId">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호</label><br> <input type="password"
								class="form-control" id="memberPassword" name="memberPassword">
						</div>
						<div class="form-group justified">
							<button type="submit" class="w3-button w3-block w3-white w3-border w3-border-yellow"
								>로그인</button>
						</div>
						<div class="form-group">
							<a href="/meoui/findid.jsp" class="btn btn-default">아이디 찾기</a> <a
								href="/meoui/findpwd.jsp" class="btn btn-default">비밀번호 찾기</a>
						</div>


					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 회원가입 -->

	<form class="text-left" action="/meoui/member/join" method="post">
		<div id="signUpForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<label class="modal-title">회원 가입</label>
					</div>
					<div class="modal-body">
						<div class="form-group step1">
							<label for="usr">아이디</label><br> <input type="text"
								class="form-control" id="checkId" name="memberId"> <input
								type="button" class="btn btn-default" id="checkbtn"
								value="아이디 중복확인">
						</div>
						<span id="idCheckResult"></span>
						<div class="form-group step1">
							<label for="pwd">비밀번호</label><br> <input type="password"
								class="form-control" id="memberPassword" name="memberPassword">
						</div>
						<div class="form-group step1">
							<label for="pwd">이름</label><br> <input type="text"
								class="form-control" id="memberName" name="memberName">
						</div>
						<div class="form-group step1">
							<label for="pwd">연락처</label><br> <input type="tel"
								class="form-control" id="memberPhone" name="memberPhone">
						</div>
						<div class="form-group step2">
							<label for="address">주소</label><input type="button"
								class="btn btn-default pull-right"
								onclick="sample4_execDaumPostcode()" value="우편 번호 찾기"><br>
							<input type="text" class="form-control" id="postcode"
								name="memberAddress1" placeholder="우편 번호"> <span
								id="guide" style="color: #999"></span> <input type="text"
								class="form-control" id="address" name="memberAddress2"
								placeholder="상세 주소">
						</div>
						<div class="form-group step3">
							<label for="email">이메일</label><br> <input type="email"
								class="form-control" id="memberMail" name="memberMail">
						</div>
						<div class="form-group step3">
							<label for="gender">성별</label><br> <label
								class="radio-inline"><input type="radio"
								name="memberGender" value="남자">남자</label> <label
								class="radio-inline"><input type="radio"
								name="memberGender" value="여자">여자</label>
						</div>
						<div class="form-group step3">
							<label for="job">직업</label><br> <input type="text"
								class="form-control" id="memberJob" name="memberJob">
						</div>
						<div class="form-group step3">
							<label for="interest">취미</label><br> <input type="text"
								class="form-control" id="memberHobby" name="memberHobby">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="prevBtn2">이전</button>
						<button type="button" class="btn btn-default" id="prevBtn3">이전</button>
						<button type="button" class="btn btn-default" id="nextBtn1">다음</button>
						<button type="button" class="btn btn-default" id="nextBtn2">다음</button>
						<button type="submit" class="btn btn-default" id="nextBtn3">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>

<script>
	$(document).ready(function() {
		$(".step2").hide();
		$(".step3").hide();
		$("#nextBtn2").hide();
		$("#nextBtn3").hide();
		$("#prevBtn2").hide();
		$("#prevBtn3").hide();
	});

	$("close").click(function() {
		$(".step2").hide();
		$(".step3").hide();
		$("#nextBtn2").hide();
		$("#nextBtn3").hide();
		$("#prevBtn2").hide();
		$("#prevBtn3").hide();
	});

	$("#prevBtn2").click(function() {
		$(".step3").hide();
		$(".step2").hide();
		$("#nextBtn3").hide();
		$("#nextBtn2").hide();
		$("#prevBtn2").hide();
		$("#prevBtn3").hide();
		$(".step1").show();
		$("#nextBtn1").show();
		$("#prevBtn1").show();
	});

	$("#prevBtn3").click(function() {
		$(".step1").hide();
		$("#nextBtn1").hide();
		$(".step3").hide();
		$("#nextBtn3").hide();
		$(".step2").show();
		$("#nextBtn2").show();
		$("#prevBtn2").show();
		$("#prevBtn3").hide();
	});

	$("#nextBtn1").click(function() {
		$(".step1").hide();
		$("#nextBtn1").hide();
		$(".step2").show();
		$("#nextBtn2").show();
		$("#prevBtn2").show();
	});

	$("#nextBtn2").click(function() {
		$(".step2").hide();
		$("#nextBtn2").hide();
		$(".step3").show();
		$("#nextBtn3").show();
		$("#prevBtn2").hide();
		$("#prevBtn3").show();
	});
</script>


<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode
								+ fullRoadAddr + data.jibunAddress; //5자리 새우편번호 사용

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
<script>
	$(document).ready(function() {
		$("#checkbtn").on("click", function() {
			if ($("#checkId").val().length > 6) {
				var memberId = $("#checkId").val();
			} else if ($("#checkId").val().length == 0) {
				$("#idCheckResult").html("아이디를 입력해 주세요.")
			} else if ($("#checkId").val().length < 6) {
				$("#idCheckResult").html("아이디는 최소 7글자 이상입니다.")
			}
			$.ajax({
				type : "post",
				url : "/meoui/member/check",
				data : {
					memberId : memberId
				},
				success : function(result) {
					console.log(result)
					if (result == "success") {
						$("#idCheckResult").html("사용 가능한 아이디 입니다.")
					} else {
						$("#idCheckResult").html("사용 불가능한 아이디 입니다.")
					}
				}
			})
		})
	})
</script>
</html>