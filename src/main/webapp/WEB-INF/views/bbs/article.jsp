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
<style type="text/css">
#up {
	text-align: right;
}
</style>
</head>
<body>

		
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

	<div class="container p-5 my-5 text-center bg-primary text-white">
		<h1>게시글 상세보기</h1>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4">
				<a href="back.bbs"><button class="btn btn-danger">뒤로가기</button></a>
			</div>
			<div class="col-sm-4"></div>
			<div id="up" class="col-sm-4">
				<%
					// if (id.equals(writer)) {
				%>
				<a href="bbsup.bbs?id=${one.bbs_id}"><button class="btn btn-info">수정</button></a>
				<a href="delete.bbs?id=${one.bbs_id}}"><button class="btn btn-warning">삭제</button></a>
				<%
					// }
				%>
			</div>
		</div>
	</div>
	<div class="container mt-5 text-center">
		<table class="table">
			<tr>
				<td>${one.bbs_id}</td>
				<td style="width: 60%">${one.bbs_title}</td>
				<td>${one.bbs_writer}</td>
			</tr>
			<tr>
				<td colspan="3">내용</td>
			</tr>
			<tr>
				<td colspan="3">${one.bbs_content}</td>
			</tr>
		</table>
	</div>

</body>
</body>
</html>