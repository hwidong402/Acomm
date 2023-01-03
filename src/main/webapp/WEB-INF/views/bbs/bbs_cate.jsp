<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<!-- 최상단 nav -->
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="to_homepage.bbs">A-Comm</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="open.bbs" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            커뮤니티
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=noti">noti</a></li>
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=hot">hot</a></li>
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=free">free</a></li>
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=market">market</a></li>
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=sugg">sugg</a></li>
	            <li><a class="dropdown-item" href="bbs_cate.bbs?bbs_cate=worry">worry</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="uriapt.jsp">우리 아파트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="urivillage.jsp">우리 동네</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="sisol.jsp">시설</a>
	        </li>
	      </ul>
	      <form class="d-flex" role="search">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>

	<hr>
	
	<!-- 본문 -->
	<div class="container p-5 my-5 bg-primary text-white text-center">
		<h1>${bbs_cate} 게시판</h1>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4">
				<a href="bbs/write.bbs?bbs_cate=${bbs_cate}"><button class="btn btn-primary">글쓰기</button></a>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<form action="search.bbs">
					<input name="title">
					<button class="btn btn-success">검색</button>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<div class="container mt-5 text-center">
		<table class="table">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list.bbs_id}">${list.bbs_title}</a></td>
					<td>${list.bbs_writer}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>