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
 //input에서 주소 받아서 위도와 경도 구하는 부분
var x = 37.566535;
 var y = 126.97796; 
$(document).ready(function() {
	$('#map').mousedown(function map() {
		var addr = $('#add').val();
		var geocoder;
		geocoder = new google.maps.Geocoder();
		geocoder.geocode({'address':addr}, function(results,status) {
			if(status==google.maps.GeocoderStatus.OK){
				x = results[0].geometry.location.lat();
				y = results[0].geometry.location.lng();
			} else{
				x = "";
				y = "";
			}
			document.sangchaji_faddr_lat.value = x;
			document.sangchaji_faddr_lng.value = y;
			
			alert('x : ' + x +'\n\n' + 'y : '+y);
			return;
		});//위/경도 추출 끝
		
		var myLatlng = new google.maps.LatLng(x,y); 
		  var mapOptions = {
		        zoom: 17, 
		        center: myLatlng 
		  } 
		  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
		
	});//클릭 이벤트 끝

});
 
 	
 </script>



</head>
<body onload="initialize()">
	<input id="add" type="text"></input><button id="map">지도보기</button>
	<div id="map_canvas" style="width:500px; height:300px;"></div><br>
	
</body>


</html>