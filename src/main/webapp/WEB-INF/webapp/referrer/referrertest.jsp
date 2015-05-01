<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>referrertest.jsp</title>
<script type="text/javascript">
var referrer = parent.document.referrer;
if (referrer != "http://localhost:8080/WebRental/webapp/login/success")
	location.href='http://localhost:8080/WebRental/webapp/login/success';
</script>
</head>
<body>
<h1>리퍼러 테스트</h1>
</body>
</html>