<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>loginsuccess.jsp</title>
</head>
<body>
<h1>로그인 성공</h1>
<hr>
id = ${sessionScope.user.id } <br>
pwd = ${sessionScope.user.password } <br>


</body>
</html>