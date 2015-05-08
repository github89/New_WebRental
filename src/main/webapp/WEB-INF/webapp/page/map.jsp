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
<script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(35.87110100714382, 128.60169690333006); 
  var mapOptions = { 
        zoom: 17, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
  } 
 </script> 

</head>
<body onload="initialize()">
	<div id="map_canvas"style="width:500px; height:300px;"></div> 
</body>

</html>