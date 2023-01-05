<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#up {
	text-align: right;
}
</style>
<script type="text/javascript">
	function findcode() {
		deleteBtn.onclick = function() {
			if (confirm("게시글을 삭제하시겠습니까")) {
				alert("게시글삭제");
				return true;
			} else {
				alert("삭제취소");
				return false;
			}
		}
	}
</script>
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

	<hr>
	
	<!-- 본문 -->

	<div class="container p-5 my-5 text-center bg-primary text-white">
		<h1>게시글 상세보기</h1>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${post.bbs_cate}"><button class="btn btn-danger">뒤로가기</button></a>
			</div>
			<div class="col-sm-4"></div>
			<div id="up" class="col-sm-4">
				<%
					// 세션 id와 작성자가 같아야 수정삭제가 보임
					String id = (String)session.getAttribute("id");
					BbsVO post = (BbsVO)request.getAttribute("post");
					if (id.equals(post.getBbs_writer())) {  
				%>
				<a href="openBbsUpdate?bbs_id=${post.bbs_id}"><button class="btn btn-info">수정</button></a>
				<a href="deletePost?bbs_id=${post.bbs_id}" id="deleteBtn"><button class="btn btn-warning" onclick="findcode()" >삭제</button></a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="container mt-5 text-center">
		<table class="table">
			<tr>
				<td>${post.bbs_id}</td>
				<td style="width: 60%">${post.bbs_title}</td>
				<td>${post.bbs_writer}</td>
			</tr>
			<tr>
				<td colspan="3">내용</td>
			</tr>
			<tr>
				<td colspan="3">${post.bbs_content}</td>
			</tr>
		</table>
	</div>

</body>
</body>
</html>