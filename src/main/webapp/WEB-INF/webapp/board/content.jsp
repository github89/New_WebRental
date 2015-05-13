<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@page import="java.util.regex.Pattern"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 조회</title>
</head>

<body>                                           
 
    <h1>게시글 조회</h1>                    
 
    <table border="1">                            <!-- border은 테두리를 표시하는 속성입니다. -->
 
        <tr>                                 
 
            <th>번호</th>                    
 
            <td>${requestScope.board.idx}</td>
 
            <th>작성자</th>
 
            <td>${requestScope.board.writer}</td>
            
            <th>ip</th>
 
            <td>${requestScope.board.regip}</td>
 
            <th>날짜</th>
 
            <td>${requestScope.board.regdate}</td>
 
            <th>조회수</th>
 
            <td>${requestScope.board.count}</td>
 
        </tr>
 
        <tr>
 
            <th colspan="2">제목</th>                     <!-- colspan은 행병합 속성입니다. -->
 
            <td colspan="6">${requestScope.board.title}</td>
 
        </tr>
 
        <tr>
 
            <th colspan="2">내용</th>                    
 
            <td colspan="6">${requestScope.board.content}</td>
 
        </tr>
 
    </table>
 
    <a href="delete?idx=${requestScope.board.idx}">게시글삭제</a>
 
    <a href="index">목록으로</a>

 
</body>
</html>