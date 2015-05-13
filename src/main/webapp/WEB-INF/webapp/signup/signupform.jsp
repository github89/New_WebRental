<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>signupform.jsp</title>
</head>

<hr>
<h1>회원가입</h1>
<hr>
<body>
<form action="signup" method="post">
<a>아이디 </a><input type="text" name="id" /> <br>
<a>비밀번호 </a><input type="password" name="password" /> <br>
<a>주소 </a><input type="text" name="address" /> <br>
<a>연락처 </a><input type="tel" name="contact" /> <br>
<a>이메일 </a><input type="email" name="email" /> <br>
<input type="submit" value="가입신청" />
<a href="../login/login"><button>취소</button></a>


</form>

</body>
</html>