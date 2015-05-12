<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/taglib.jspf"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common.jspf"%>
<title>Map</title>


<!-- google map source -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 
<!-- google map script -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script> 
var x = 37.5615964;
var y = 126.9086431;
function initialize() { 
	  var myLatlng = new google.maps.LatLng(x,y); 
	  var mapOptions = { 
	        zoom: 17, 
	        center: myLatlng, 
	        mapTypeId: google.maps.MapTypeId.ROADMAP 
	  } 
	  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
	  }
 </script>
 <script>
$(document).ready(function() {
	$('#map').click(function() {
		var add = $('#add').val();
// 		alert(add);
		var mapSrc = 'http://openapi.map.naver.com/api/geocode.php?key=c1b406b32dbbbbeee5f2a36ddc14067f&encoding=utf-8&latlng&query=';
		var mapXY = mapSrc+add;
		alert(mapXY);
	});
});
 
 	
 </script>

</head>
<body onload="initialize()">
	<div id="map_canvas" style="width:500px; height:300px;"></div><br>
	<input id="add" type="text"></input><button id="map">지도보기</button>
	
</body>


</html>