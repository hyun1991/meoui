<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: left;
}

a.cbtn {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}
a.cabtn {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}
a.cabtn:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}
a.cbtn:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}
</style>
</head>
<body>
	<head>
	<%@include file="/nav/navbar.jsp" %>
	</head>
		<h1 id="headTitle" style="margin-top: 50px;" align="center">나의 쪽지함</h1>
	<hr>
		<table class="table table-striped table-bordered table-hover">
			<thead>
            <tr>
                <th>번호</th>
                <th>쪽지제목</th>
                <th>발신인아이디</th>
                <th>보낸날짜</th>
                <th>확인여부</th>
                <th>비고<th>
            </tr>
        	</thead>
        <tbody>
			<c:forEach items="${result.message }" var="message">
				<tr>
					<td>${message.messageNo }</td>
					<td>${message.messageTitle }</td>
					<td>${message.messageSendId }</td>
					<td><fmt:formatDate value="${message.messageDate }" pattern="yyyy년MM월dd일"/></td>
					<c:forEach items="${result.list }" var="message">
						<td>${message.check }</td>
					</c:forEach>
					<td><a href="/meoui/admin/member/delete/${member.memberId }"><button type="button" class="w3-button w3-block w3-white w3-border">
						삭제</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<div>
			<a href="#" class="btn-example" onclick="layer_open('layer1');return false;">
			<button type="button" class="w3-button w3-block w3-white w3-border">
			쪽지발송하기</button></a>
		</div>
	<div id="layer1" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
				<p class="ctxt mb20">

				<br></p>
					<div><label>발신인 아이디:</label><br>
						<input type="text" name="memberId" id="memberId" 
						value="<%=session.getAttribute("memberId")%>" readonly="readonly">
					</div><br>
					<div><label>수신인 아이디:</label><br>
						<input type="text" name="messageReceiveId" id="messageReceiveId">
					</div><br>
					<div><label>제목:</label><br>
						<input type="text" name="messageTitle" id="messageTitle">
					</div><br>
					<div>
						<textarea class="form-control" rows="3" name="messageContent" id="messageContent">
						</textarea>
					</div><br>
						<input type="hidden" name="memberNo" id="memberNo" value="<%=session.getAttribute("memberNo")%>">
					<div></div>
					<div class="form-group">
					<button type="button" class="w3-button w3-block w3-white w3-border" id="messageBtn">
					발송하기</button>
				</div>
				<div class="btn-r">
					<a href="#" class="cbtn">홈으로</a>
					<a href="/meoui/message/list?memberId=<%=session.getAttribute("memberId") %>&pageNo=1" class="cabtn">쪽지함</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
	<div class="row text-center">
		<ul class="pagination pagination-md">
			<li><c:if test="${result.pagination.prev>0 }">
					<a href="/meoui/admin/member/list?pageNo=${result.pagination.prev }">이전으로</a>
				</c:if></li>
			<li><c:forEach begin="${result.pagination.startPaging }"
					end="${result.pagination.lastPaging }" var="i">
					<a href="/meoui/admin/member/list?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<li><c:if test="${result.pagination.next>0 }">
					<a href="/meoui/admin/member/list?pageNo=${result.pagination.next }">다음으로</a>
				</c:if></li>
		</ul>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#messageBtn").on("click", function() {
			alert("안녕하세요")
			var memberId= "<%=session.getAttribute("memberId")%>"
			var messageReceiveId= $("#messageReceiveId").val();
			var messageTitle= $("#messageTitle").val();
			var messageContent= $("#messageContent").val();
			var memberNo= $("#memberNo").val();
			alert(memberId)
			alert(messageContent)
			alert(memberNo)
			ajax({
				type : "post",
				url : "/meoui/message/join",
				data : {memberId:memberId, messageReceiveId:messageReceiveId, messageTitle:messageTitle,
				messageContent:messageContent, memberNo: memberNo},
				success : function(result) {
					alert("성공")
					console.log(result)
					if (result == "success") {
						alert("쪽지발송이 완료 되었습니다.")
						window.location.href="/meoui/";
					} 
					else {
						alert("쪽지발송이 실패 하였습니다.")
					}
				}
			})
		})
	})
	function layer_open(el) {
		var temp = $('#' + el); //레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
			$('.layer').fadeIn();
		} else {
			temp.fadeIn(); //bg 클래스가 없으면 일반레이어로 실행한다.
		}
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut();
			} else {
				temp.fadeOut(); //'발송'버튼을 클릭하면 레이어가 사라진다.
				window.location.href="/meoui/";
			}
			e.preventDefault();
		});
		$('.layer .bg').click(function(e) {
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
</script>
</html>