<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- 최상단 nav -->
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="openHomepage">A-Comm</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="openBbs" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            커뮤니티
	          </a>
	          <ul class="dropdown-menu">
	          	<li><a class="dropdown-item" href="openBbs">bbs</a></li>
	          	<li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=noti">noti</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=hot">hot</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=free">free</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=market">market</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=sugg">sugg</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=worry">worry</a></li>
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

	<!-- 헤더? -->
	<div class="container p-3 my-3 text-center">
		<h1>게시글 쓰기</h1>
	</div>

	<hr>
	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${post.bbs_cate}">
					<button class="btn btn-danger">뒤로가기</button>
				</a>
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 본문 -->
	<div class="container mt-5 text-center">
		<form action="updatePost">
			<div class="mb-3">
				<label class="form-label">제목</label> 
				<input class="form-control" name="bbs_title" value="${post.bbs_title}">
			</div>
			
			<table class="table">
			<tr style="border: 1px solid blue">
				<td>글쓴이</td>
				<td>공지?</td>
				<td>카테고리</td>
				<td>아파트 코드</td>
			</tr>
			<tr style="border: 1px solid blue">
				<td><input name="bbs_writer" value="${post.bbs_writer}" readonly="readonly"></td>
				<td><input name="bbs_notice" value="1" class="form-check-input" type="checkbox" role="switch"></td>
				<td><input name="bbs_cate" value="${bbs_cate}" readonly></td>
				<td><input name="apt_code" value="${code}" readonly></td>
			</tr>
			<tr>
				<td colspan="7">내용</td>
			</tr>
			<tr>
				<td colspan="7">${post.bbs_content}</td>
			</tr>
			</table>
			
			<div class="mb-3">
				<label class="form-label">본문</label>
				<textarea name="bbs_content" class="form-control"rows="10"></textarea>
			</div>
			<div>
				<button type="submit"  class="btn btn-primary">작성하기</button> <br>
			</div>
		</form>		
	</div>
</body>
</html>