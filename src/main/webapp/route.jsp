<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/taglib.jspf"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common.jspf"%>
<title>template.jsp</title>

<link rel="stylesheet" href="bootstrap-3.3.4-dist/css/bootstrap.min.css"/>
<c:url var="jquery" value="/jquery"/>
<c:url var="bootstrap" value="/bootstrap-3.3.4-dist"/>
<c:url var="angular" value="/angular-1.3.15"/>

<script type="text/javascript" src="${jquery}/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular-1.3.15/angular.min.js"></script>
<script type="text/javascript" src="${angular}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angular}/angular-1.3.15/angular-animate.min.js"></script>
<script type="text/javascript" src="${angular}/angular-1.3.15/angular-route.min.js"></script>
<script type="text/javascript">
	var app = angular.module("myApp", ["ngSanitize", "ngAnimate", "ngRoute"]);
	app.config(function($routeProvider) {
		
		var emp ={
				templateUrl : "emp.jsp",
				controller : "empController"
		};
		var city ={
				templateUrl : "city.jsp",
				controller : "cityController"
		};
		$routeProvider.when('/emp', emp);
		$routeProvider.when('/city', city);
		$routeProvider.otherwise({redirectTo:'/emp'});
	});	
	
	app.controller("myController", function($scope) {
		
	});
	
	app.controller("empController", function($scope) {
		alert("empController");
		$socpe.message = "직원 리스트";
	});
	
	app.controller("cityController", function($scope) {
		alert("cityController");
		$socpe.message = "도시 리스트";
	});
</script>

</head>
<body data-ng-controller = "myController">
<div class="container">
	<a href="#emp" class="btn">emp list</a>
	<a href="#city" class="btn">city list</a>
	<hr>
	<ng-view>

	</ng-view>
</div>

</body>
</html>