<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>길찾기</title>
</head>
<style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 80%;
        float: left;
        width: 70%;
      }
      #right-panel {
        margin: 20px;
        border-width: 2px;
        width: 20%;
        height: 400px;
        float: left;
        text-align: left;
        padding-top: 0;
      }
      #directions-panel {
        margin-top: 10px;
        background-color: #FFEE77;
        padding: 10px;
      }
      #origin-input,
      #destination-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 200px;
      }
	  #submit{
	 	background-color: #81feee;
        font-family: Roboto;
	  }
      #origin-input:focus,
      #destination-input:focus {
        border-color: #4d90fe;
      }
          .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }
    </style>
  </head>
  <body>
   <header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
    <div id="map"></div>
    <div>
    <input id="origin-input" class="controls" type="text"
        placeholder="출발지를 입력하세요">

    <input id="destination-input" class="controls" type="text"
        placeholder="도착지를 입력하세요">
      <input type="submit" id="submit" class="controls" value="길찾기">
    </div>
    
      <div id="right-panel">
      <p>총거리: <span id="total"></span></p>
    </div>
    <script>
      function initMap() {

          var directionsService = new google.maps.DirectionsService;
          var directionsDisplay = new google.maps.DirectionsRenderer({
            draggable: true,
            map: map,
            panel: document.getElementById('right-panel')
          });
        var map = new google.maps.Map(document.getElementById('map'), {
        	 center: {lat: 33.3850285, lng: 126.62044279999998},
             zoom: 10
           });
        
        directionsDisplay.setMap(map);

        document.getElementById('submit').addEventListener('click', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });
        
        directionsDisplay.addListener('directions_changed', function() {
            computeTotalDistance(directionsDisplay.getDirections());
          });

          displayRoute(origin-input.val(), destination-input.val(), directionsService,
              directionsDisplay);
      }
	/*
      var originAutocomplete = new google.maps.places.Autocomplete(
              originInput, {placeIdOnly: true});
          var destinationAutocomplete = new google.maps.places.Autocomplete(
              destinationInput, {placeIdOnly: true});
	*/
      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    	  /* 경유지
    	  var waypts = [];
    	        var checkboxArray = document.getElementById('waypoints');
    	        for (var i = 0; i < checkboxArray.length; i++) {
    	          if (checkboxArray.options[i].selected) {
    	            waypts.push({
    	              location: checkboxArray[i].value,
    	              stopover: true
    	            });
    	          }
    	        }
			*/
        directionsService.route({
          origin: document.getElementById('origin-input').value,
          destination: document.getElementById('destination-input').value,
          travelMode: 'TRANSIT'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
              summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
              summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
            }
          } else {
            window.alert('주소를 정확히 입력해주세요 ' );
          }
        });
      }
      
      function displayRoute(origin, destination, service, display) {
          service.route({
            origin: origin,
            destination: destination,
            travelMode: 'TRANSIT'
          }, function(response, status) {
            if (status === 'OK') {
              display.setDirections(response);
            } else {
              alert('주소를 정확히 입력해주세요 ' );
            }
          });
        }

      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFj0i9yKOLhZ2Ji9-x7KMW4CxTRkVlxS0&callback=initMap">
    </script>
  
    
  </body>
</html>