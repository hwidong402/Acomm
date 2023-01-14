<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bbshot.css">
</head>
<body>
<div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
		<div class="d-grid">
			<button class="btn btn-outline-info"
				onclick="location.href='bbslistall'" type="button">인기글 더보기</button>
		</div>
		<c:forEach var="hotvo" items="${hotlist}">
			<div class="list-group">
				<div class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<small>${hotvo.member_nick}</small> <small><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${hotvo.bbs_date}"/></small>
					</div>
					<h5 class="ellipsis">
						<a href="openBbsPost?bbs_id=${hotvo.bbs_id}">${hotvo.bbs_title}</a>
					</h5>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<%-- <div id="bbshotall">
		<table border="1">
				<tr>
				<td>번호</td>	
				<td>제목</td>
				<td>날짜</td>	
				<!-- <td>글쓴이</td> -->
				<!-- <td>내용</td> -->
				<!-- <td>파일</td>	
				<td>코드</td>	 -->
				<!-- <td>공지사항여부</td> -->
				<!-- <td>카테고리</td> -->
				<td>조회수</td>
				</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
				<td>${vo.bbs_id}</td>
				<td><a href="bbs/bbshotone?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.bbs_date}"/></td>
				<td>${vo.bbs_writer}</td>
				<td>${vo.bbs_content}</td>
				<td>${vo.bbs_file}</td>
				<td>${vo.apt_code}</td>
				<td>${vo.bbs_notice}</td>
				<td>${vo.bbs_cate}</td>
				<td>${vo.bbs_count}</td>
				</tr>
			</c:forEach>
		</table>
	</div> --%>
</body>
</html>