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
<title>Main Page</title>
</head>
  <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 70%;
        width: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
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

      #origin-input:focus,
      #destination-input:focus {
        border-color: #4d90fe;
      }

      #mode-selector {
        color: #fff;
        background-color: #4d90fe;
        margin-left: 12px;
        padding: 5px 11px 0px 11px;
      }

      #mode-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      div.row {
	width: 100%;
	height: 100%;
	color:#424242;
}
	

    </style>
  </head>
  <body>
  <header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
    <input id="origin-input" class="controls" type="text"
        placeholder="출발지를 입력하세요">

    <input id="destination-input" class="controls" type="text"
        placeholder="도착지를 입력하세요">

    <div id="mode-selector" class="controls">
      <input type="radio" name="type" id="changemode-transit">
      <label for="changemode-transit">대중교통</label>
    
    
    </div>

    <div id="map"></div>
	<div id="directionsPanel" style=" display:block;  ">
	<p>총 거리 : <span id="total"></span></p>
<div class="row">
				<label for="usr"></label>
				<label for="usr">이동 거리</label><br>
				<p></p>
				<br> <label for="usr">소요 시간</label><br>
				<p></p>
				<br> <label for="usr">출발 시간</label><br>
				<p></p>
				<br> <label for="usr">도착 시간</label>
				<p></p>
				<br> <label for="usr">자세한 위치 정보</label>
				<p></p>
			</div>

</div>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
    	//  var directionsService = new google.maps.DirectionsService;
        //  var directionsDisplay = new google.maps.DirectionsRenderer;  이거 2개하면 지도 안나오
        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeControl: false,
          center: {lat: 33.3850285, lng: 126.62044279999998},
          zoom: 10
        });
	//33.51041350000001,126.49135339999998   공항
	//33.3850285,126.62044279999998 성판악입구
        new AutocompleteDirectionsHandler(map);
      }

       /**
        * @constructor
       */
      function AutocompleteDirectionsHandler(map) {
        this.map = map;
        this.originPlaceId = null;
        this.destinationPlaceId = null;
        this.travelMode = 'TRANSIT';
        var originInput = document.getElementById('origin-input');
        var destinationInput = document.getElementById('destination-input');
        var modeSelector = document.getElementById('mode-selector');
        this.directionsService = new google.maps.DirectionsService;
        this.directionsDisplay = new google.maps.DirectionsRenderer;
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(
            originInput, {placeIdOnly: true});
        var destinationAutocomplete = new google.maps.places.Autocomplete(
            destinationInput, {placeIdOnly: true});

        this.setupClickListener('changemode-transit', 'TRANSIT');

        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
      }

      // Sets a listener on a radio button to change the filter type on Places
      // Autocomplete.
      AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
        var radioButton = document.getElementById(id);
        var me = this;
        radioButton.addEventListener('click', function() {
          me.travelMode = mode;
          me.route();
        });
      };

      AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
        var me = this;
        autocomplete.bindTo('bounds', this.map);
        autocomplete.addListener('place_changed', function() {
          var place = autocomplete.getPlace();
          if (!place.place_id) {
            window.alert("Please select an option from the dropdown list.");
            return;
          }
          if (mode === 'ORIG') {
            me.originPlaceId = place.place_id;
          } else {
            me.destinationPlaceId = place.place_id;
          }
          me.route();
        });

      };

      AutocompleteDirectionsHandler.prototype.route = function() {
        if (!this.originPlaceId || !this.destinationPlaceId) {
          return;
        }
        var me = this;

        this.directionsService.route({
          origin: {'placeId': this.originPlaceId},
          destination: {'placeId': this.destinationPlaceId},
          travelMode: this.travelMode
        }, function(response, status) {
          if (status === 'OK') {
            me.directionsDisplay.setDirections(response);
          } else {
            window.alert(status + '로 인해 길찾기 요청이 실패하였습니다. ' );
          }
        });
      };
	
      function calcRoute() {

    	  var request = {
    		origin: {'placeId': this.originPlaceId},
    	      destination: {'placeId': this.destinationPlaceId},
    	      travelMode: this.travelMode
    	  };
    	  directionsService.route(request, function(response, status) {
    		alert(status);  // 확인용 Alert..미사용시 삭제
    		if (status == google.maps.DirectionsStatus.OK) {
    			directionsDisplay.setDirections(response);
    		}
    	  });
    	}
    	
    	function computeTotalDistance(result) {
    	  var total = 0;
    	  var myroute = result.routes[0];
    	  for (var i = 0; i < myroute.legs.length; i++) {
    		total += myroute.legs[i].distance.value;
    	  }
    	  total = total / 1000.0;
    	  document.getElementById('total').innerHTML = total + ' km';
    	}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFj0i9yKOLhZ2Ji9-x7KMW4CxTRkVlxS0&libraries=places&callback=initMap"
        async defer></script>
        <footer>
		<%@include file="/footer.jsp"%>
	</footer>
  </body>
</html>