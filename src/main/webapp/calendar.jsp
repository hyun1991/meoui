<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link
	href='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.css'
	rel='stylesheet' />
<link
	href='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.print.css'
	media='print' />
<script
	src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script
	src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
<script
	src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<style>
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
</style>
</head>
<body>
	<button id="bttnAllEvents">bttnAllEvents</button>
	<button id="bttnRecreateEvents">bttnRecreateEvents</button>
	<div id='calendar'></div>
	<pre id="myPre"></pre>
</body>
<script>
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,basicWeek,basicDay'
		},
		defaultDate : '2014-11-07',
		editable : true,

		eventDrop : function(event) {
			event.start._i = event.start.format();
		},
		eventResize : function(event) {
			event.end._i = event.end.format();
		},

		eventLimit : true, // allow "more" link when too many events
		events : [ {
			id : 'All Day Event',
			title : 'All Day Event',
			start : '2014-11-03'
		}, {
			id : 'popo',
			title : 'popo',
			start : '2014-11-04T10:30:00',
			end : '2014-11-05T12:30:00',
			description : 'This is a cool event',
			color : 'rgb(142, 67, 163)',
			textColor : 'white'
		}, {
			id : 'popo2',
			title : 'popo2',
			//url: 'http://google.com/',
			start : '2014-11-06'
		} ]
	});

	$('#calendar').on('click', '.fc-day', function() {
		var myPrompt = prompt('uno', 'due');
		if (myPrompt != null && myPrompt != '') {
			$('#calendar').fullCalendar('addEventSource', [ {
				id : myPrompt,
				title : myPrompt,
				start : $(this).attr('data-date')
			} ]);
		}
	});

	$('#calendar').on('click', '.fc-content', function() {
		var gugu = $(this).children('.fc-title').html();
		$('#calendar').fullCalendar('removeEvents', gugu);
	});

	$('#bttnAllEvents').click(function() {
		var myEvents = $("#calendar").fullCalendar("clientEvents");
		popo = {};
		for (var i = 0; i < myEvents.length; i++) {
			popo[i] = {};
			if (myEvents[i].id) {
				popo[i]['id'] = myEvents[i].id;
			}
			if (myEvents[i].title) {
				popo[i]['title'] = myEvents[i].title;
			}
			if (myEvents[i].start) {
				popo[i]['start'] = myEvents[i].start._i;
			}
			if (myEvents[i].end) {
				popo[i]['end'] = myEvents[i].end._i;
			}
			if (myEvents[i].description) {
				popo[i]['description'] = myEvents[i].description;
			}
			if (myEvents[i].color) {
				popo[i]['color'] = myEvents[i].color;
			}
			if (myEvents[i].textColor) {
				popo[i]['textColor'] = myEvents[i].textColor;
			}
		}
		myPre.innerHTML = JSON.stringify(popo, undefined, 4);
	});

	$('#bttnRecreateEvents').click(function() {
		for (var i = 0; i < Object.keys(popo).length; i++) {
			$('#calendar').fullCalendar('addEventSource', [ {
				id : popo[i].id,
				title : popo[i].title,
				start : popo[i].start,
				end : popo[i].end,
				description : popo[i].description,
				color : popo[i].color,
				textColor : popo[i].textColor
			} ]);
			console.log('ok');
		}
	});
</script>
</html>