<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>

</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
제목	: <input type="text" name="title" /><br/><br/>
작성자: <input type="text" name="writer" /><br/><br/>
컨텐츠 <br/>
<textarea rows="5" cols="30" name="content">내용을 적어주세요</textarea> <br/><br/>
파일 : <input type="file" id="uploadFile" name="uploadFile"><br/>

<!-- <input type="text" name="content" size="500" height="300" maxlength="1500" /><br/> -->
<input type="submit" value="글쓰기"/>

</form>
</body>
</html>