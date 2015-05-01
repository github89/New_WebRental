<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/taglib.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common.jspf"%>
<title>Rental home</title>

<link rel="stylesheet" href="bootstrap-3.3.4-dist/css/bootstrap.min.css"/>

<script type="text/javascript" src="jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>

<script type="text/javascript" src="angular-1.3.15/angular.min.js"></script>
<script type="text/javascript" src="angular-1.3.15/angular-sanitize.min.js"></script>
<script type="text/javascript" src="angular-1.3.15/angular-animate.min.js"></script>


<script type="text/javascript">
	var app = angular.module("myApp", ["ngSanitize", "ngAnimate"]);
	app.controller("myController", function($scope) {
		$scope.message = "not clicked";
	});
	app.controller("headerController", function($scope) {
		$scope.menuClick = function(e) {
			e.preventDefault();
			$scope.$parent.message = $(e.target).attr('href');
			
			$('iframe').attr('src', $scope.$parent.message);
		};
	});
</script>


</head>
<body data-ng-controller="myController">
<header class="container" data-ng-controller="headerController">
	<ul class="nav nav-pills">
		<li><a href="http://www.w3schools.com" data-ng-click="menuClick($event)">Home</a></li>
		<li><a href="http://localhost:8080/HelloWeb/ng-style.jsp" data-ng-click="menuClick($event)">Java</a></li>
		<li class="active"><a href="#3">Spring</a></li>
		<li><a href="#4">Angular</a></li>
		<li class="disabled"><a href="#5">Bootstrap</a></li>
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle ="dropdown" href="#6">
			Others<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#61">MyBatis</a></li>
				<li><a href="#61">jQuery</a></li>
				<li><a href="#61">jQuery UI</a></li>
				<li><a href="#61">jQuery Mobile</a></li>
				<li><a href="#61">Google Map</a></li>
			</ul>
		</li>		
	
	</ul>
<div>child : {{message}}</div>
</header>
<div>{{message}}</div>
<iframe src="">

</iframe>		
	</header>

</body>
</html>