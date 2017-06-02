<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link href="/meoui/fullcalendar-2.9.1/fullcalendar.css" rel="stylesheet" />
<link href="/meoui/fullcalendar-2.9.1/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<script type="text/javascript"
	src="/meoui/fullcalendar-2.9.1/lib/moment.min.js"></script>
<script type="text/javascript"
	src="/meoui/fullcalendar-2.9.1/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="/meoui/fullcalendar-2.9.1/fullcalendar.js"></script>
<script type="text/javascript"
	src="/meoui/fullcalendar-2.9.1//lang-all.js"></script>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.fc-day-number.fc-sat.fc-past {
	color: #0000FF;
} /* 토요일 */
.fc-day-number.fc-sun.fc-past {
	color: #FF0000;
} /* 일요일 */
button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
</head>
<body>
	<div id="calendar"></div>
	<div align="center">
		<a href="/meoui/"><button>홈으로</button></a>
	</div>
</body>
<script type="text/javascript">
	function calendarEvent(eventData) {
		console.log(eventData)
		jQuery("#calendar").fullCalendar({
			defaultDate : "2017-05-30",
			lang : "ko",
			editable : true,
			eventLimit : true,
			events:eventData
		});
	}
	$(document).ready(function(){
		alert("캘린더 형식으로 일정 조회합니다.")
		var date= new Date();
		var d= date.getDate();
		var m= date.getMonth();
		var y= date.getFullYear();
		getEvent();
	})
	function getEvent(){
		$.ajax({
			url:"/meoui/schedule/data",
			dataType:"JSON",
			success: function(res){
				console.log(res)
				createCalendarDateResult(res)
			}
		});
	}
	function createCalendarDateResult(res){
		var result= res, eventData=[];
		console.log(result)
		if(result!=null){
			var date= result.extra;
			console.log(date)
			for(var i=0; i<date.length; i++){
				eventData.push({
					title:date[i].title,
					start:date[i].start,
					end:date[i].end
				})
			}
		}
		calendarEvent(eventData)
	}
</script>
</html>