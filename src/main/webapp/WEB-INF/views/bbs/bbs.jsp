<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/head_nav.css">
<link rel="stylesheet" href="resources/css/bbs_allcate.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="nav">
		<!-- Links -->
		<ul class="nav justify-content-center">
			<li class="nav-item"><a href="to_apt">A-Comm</a></li>
			<li class="nav-item"><a href="open.bbs">커뮤니티</a></li>
			<li class="nav-item"><a href="utiapt.jsp">우리 아파트</a></li>
			<li class="nav-item"><a href="matjip.jsp">우리 동네</a></li>
			<li class="nav-item"><a href="matjip.jsp">시설</a></li>
		</ul>
	</div>
	<hr>
	<div>
		<table id="bbs_noti">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
				<th><a href = "bbs_cate.bbs?bbs_cate=noti"><button>noti 더보기</button></a><br></th>
			</tr>
			<c:forEach var="list5_noti" items="${list5_noti}">
				<tr>
					<td>${list5_noti.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list5_noti.bbs_id}">${list5_noti.bbs_title}</a></td>
					<td>${list5_noti.bbs_writer}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div id="bbs_hot">
		<a href = "bbs_cate.bbs?bbs_cate=hot"><button>hot 더보기</button></a><br>
		hot 들어갈자리
	</div>
	<hr>
	<div>
		<table id="bbs_free">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
				<th><a href = "bbs_cate.bbs?bbs_cate=free"><button>free 더보기</button></a><br></th>
			</tr>
			<c:forEach var="list5_free" items="${list5_free}">
				<tr>
					<td>${list5_free.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list5_free.bbs_id}">${list5_free.bbs_title}</a></td>
					<td>${list5_free.bbs_writer}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div>
		<table id="bbs_market">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
				<th><a href = "bbs_cate.bbs?bbs_cate=market"><button>market 더보기</button></a><br></th>
			</tr>
			<c:forEach var="list5_market" items="${list5_market}">
				<tr>
					<td>${list5_market.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list5_market.bbs_id}">${list5_market.bbs_title}</a></td>
					<td>${list5_market.bbs_writer}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div>
		<table id="bbs_sugg">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
				<th><a href = "bbs_cate.bbs?bbs_cate=sugg"><button>sugg 더보기</button></a><br></th>
			</tr>
			<c:forEach var="list5_sugg" items="${list5_sugg}">
				<tr>
					<td>${list5_sugg.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list5_sugg.bbs_id}">${list5_sugg.bbs_title}</a></td>
					<td>${list5_sugg.bbs_writer}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div>
		<table id="bbs_worry">
			<tr>
				<th>글 번호</th>
				<th style="width: 70%">글 제목</th>
				<th>작성자</th>
				<th><a href = "bbs_cate.bbs?bbs_cate=worry"><button>worry 더보기</button></a><br></th>
			</tr>
			<c:forEach var="list5_worry" items="${list5_worry}">
				<tr>
					<td>${list5_worry.bbs_id}</td>
					<td><a href="article.bbs?bbs_id=${list5_worry.bbs_id}">${list5_worry.bbs_title}</a></td>
					<td>${list5_worry.bbs_writer}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	
</body>
</html>