<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>loginform.jsp</title>
</head>
<body>
<form action="login" method="post">
<input type="text" name="id" /> <br>
<input type="password" name="password" /> <br>
<input type="submit" value="로그인" />
<a href="http://localhost:8080/WebRental/webapp/signup/signup">회원가입</a>
<a href="http://localhost:8080/WebRental/webapp/test/borad">게시판으로</a>


</form>

</body>
</html>