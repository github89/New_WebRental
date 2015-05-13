<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>loginsuccess.jsp</title>
</head>
<body>
<h1>${sessionScope.user.id}님 반갑습니다!</h1>
<hr>
<form action="logout" method="get">
<button>로그아웃</button>
</form>
<a href="../board/board">게시판으로</a>
<a href="http://localhost:8080/WebRental/webapp/referrer/referrertest">리퍼러 테스트</a>
</body>
</html>