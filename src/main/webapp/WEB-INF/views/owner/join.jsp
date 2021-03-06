<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<header>
	<%@include file="/nav/adminnav.jsp" %>
	</header>
	<h1 id="headTitle" style="margin-top: 50px;" align="center">숙박업주 추가</h1>
	<hr>
	<form action="/meoui/admin/manage/join" method="post" >
		<div>
			<div class="form-group">
				<label>아이디</label><input type="text" id="ownerId" name="ownerId" class="form-control">
				<span id="idcheck"></span>
			</div>
			<div class="form-group">
				<label>비밀번호</label><input type="password" name="ownerPassword" id="ownerPassword" class="form-control">
			</div>
			<div class="form-group">
				<label>이름</label><input type="text" name="ownerName" id="ownerName" class="form-control">
			</div>
			<div class="form-group">
				<label>연락처</label><input type="text" name="ownerPhone" id="ownerPhone" class="form-control">
			</div>
			<div class="form-group">
				<label for="address">주소</label><input type="button" class="btn btn-default pull-right" onclick="sample4_execDaumPostcode()" value="우편 번호 찾기"><br>
				<input type="text" class="form-control" id="postcode" name="ownerAddress1" placeholder="우편 번호"> 
				<span id="guide" 
				style="color: #999"></span> 
				<input type="text" class="form-control" id="address" name="ownerAddress2"
				placeholder="상세 주소">
			</div>
			<div class="form-group">
				<label>이메일</label><input type="email" name="ownerMail" id="ownerMail" class="form-control">
			</div>
			<div class="form-group">
				<label>사업자번호</label><input type="text" name="ownerBrn" id="ownerBrn" class="form-control">
			</div>
			<br>
			<div class="btn-group">
				<input type="submit" value="숙박업주 추가하기" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
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
</html>