<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.rental.model.Board"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<c:url var="bootstrap" value="/bootstrap-3.3.4"/>
<c:url var="jquery" value="/jquery"/>
<c:url var="angular" value="/angular-1.3.15"/>

<link rel="stylesheet" href="${bootstrap}/css/bootstrap.min.css"/>

<script type="text/javascript" src="${jquery}/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular.min.js"></script>
<script type="text/javascript" src="${angular}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angular}/angular-animate.min.js"></script>

<style type="text/css">
 
    table, td, th   {
 
    border:1px solid green;
 
    }
 
    th{
 
    background-color:green;
 
    color:white;
 
    }
 
</style>
</head>

<body>                                       <!-- HTML문서의 주 내용이 들어가는 부분입니다. -->
 
    <h1>게시글 리스트</h1>                        <!-- 헤드라인 글씨를 표현하는 태그입니다. -->
 
    <table>                                       <!-- 표 형식의 데이터를 표현하는 태그입니다. -->
 
        <tr>                                  <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
 
            <th>번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
 
            <th>제목</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
 
            <th>작성자</th>
 
            <th>날짜</th>
 
            <th>조회수</th>
 
        </tr>
        
        <c:forEach items="${requestScope.list}" var="list" end="9">
		<tr>
			<td>${list.idx}</td><!-- jstl의 표현식은 스크립트릿과 속성이 같아서 어디에쓰나 우선됨 -->

			<td><a href='count?idx=${list.idx}'>${list.title}</a></td>

			<td>${list.writer}</td>

			<td>${list.regdate}</td>

			<td>${list.count}</td>
		</tr>

		</c:forEach>
 
    </table>
 
    <a href="write">글쓰기</a>
    
    <nav>
  <ul class="pagination">
    <li>
      <a href="list_test?page=1" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
      <a href="previousPage?curPage=${sessionScope.curPage}" aria-label="Previous">
        <span aria-hidden="true">이전</span>
      </a>
    </li>
    <c:forEach var="i" begin="${sessionScope.startOfGroup}" end="${sessionScope.endOfGroup}">
    <c:if test="${i <= sessionScope.lastPage}">
    <li><a href="list_test?page=${i}">${i}</a></li>
    </c:if>
    </c:forEach>
    <li>
      <a href="nextPage?curPage=${sessionScope.curPage}" aria-label="Next">
        <span aria-hidden="true">다음</span>
      </a>
      <a href="list_test?page=${sessionScope.lastPage}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
 
</body>
</html>