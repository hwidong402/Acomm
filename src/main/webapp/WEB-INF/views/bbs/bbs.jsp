<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/head_nav.css">
<link rel="stylesheet" href="resources/css/bbs_allcate.css">
<!-- Bootstrap 5 -->
<!-- CSS CDN : https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bbs_struc.css" rel="stylesheet">
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
	<div class="position-relative text-center bg-light">
      <h3 class="fw-normal">바로 여기!</h3>
      <p class="lead fw-normal">당신이 보고있는 지금 이 자리에 광고하세요</p>
 	</div>
	    <!-- 1열 -->
	    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=noti'" type="button">noti 더보기</button>
				</div>
				<c:forEach var="list5" items="${list5_noti}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis" style="display: inline-block"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					  	<span class="badge bg-primary rounded-pill" style="float: right">♡${list5.bbs_like}</span>
					  	<span class="badge bg-primary rounded-pill" style="float: right">🖐${list5.bbs_count}</span>
					</div>
				</div>
				</c:forEach>
		    </div>
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=hot'" type="button">hot 더보기</button>
				<jsp:include page="../../../bbshot.jsp"></jsp:include>
				</div>
				<c:forEach var="list5" items="${list5_hot}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					</div>
				</div>
				</c:forEach>
		    </div>
	    </div>
	    
	    <!-- 2열 -->
	    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=free'" type="button">free 더보기</button>
				</div>
				<c:forEach var="list5" items="${list5_free}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					</div>
				</div>
				</c:forEach>
		    </div>
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=market'" type="button">market 더보기</button>
				</div>
				<c:forEach var="list5" items="${list5_market}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					</div>
				</div>
				</c:forEach>
		    </div>
	    </div>
	    
	   	<!-- 3열 -->
	    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=sugg'" type="button">sugg 더보기</button>
				</div>
				<c:forEach var="list5" items="${list5_sugg}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					</div>
				</div>
				</c:forEach>
		    </div>
		    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
				<div class="d-grid">
				 <button class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=worry'" type="button">worry 더보기</button>
				</div>
				<c:forEach var="list5" items="${list5_worry}">
			   	<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
						  	<small>${list5.bbs_writer}</small>
							<small>${list5.bbs_date}</small>
						</div>
					  	<h5 class="ellipsis"><a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a></h5>
					</div>
				</div>
				</c:forEach>
		    </div>
	    </div>


</body>
</html>