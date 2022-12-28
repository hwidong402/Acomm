<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container p-5 my-5 bg-primary text-white text-center">
<h1>주민게시판</h1>
</div>
<div class="container mt-5">
 <div class="row">
 <div class="col-sm-4">
 <a href="bbs/jspwrite.bbs"><button  class="btn btn-primary">글쓰기</button></a> 
 </div>
 <div class="col-sm-4"></div>
  <div class="col-sm-4">
<form action="search.bbs">
<input name= "title">   <button  class="btn btn-success">검색</button>
</form>
</div>
</div>
 </div>
 <hr>
<div class="container mt-5 text-center">
<table class="table">
<tr>
<th>글 번호</th>
<th style="width:70%">글 제목</th>
<th>작성자</th>
</tr>
<c:forEach var="dto" items="${list}">
<tr>
<td>${dto.id}</td>
<td><a href="info.bbs?id=${dto.id}">${dto.title}</a></td>
<td>${dto.writer}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>