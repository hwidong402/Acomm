<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<%@page import="com.jav4.acomm.member.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>
	
	<!-- 헤더? -->
	<div class="container p-3 my-3 text-center">
		<h1>인기 게시글</h1>
	</div>

	<hr>
	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 본문 -->
	<div class="container mt-5 text-center">
		<table class="table">
			<tr style="border: 1px solid blue">
				<td>포스트 아이디</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>공지?</td>
				<td>카테고리</td>
				<td>조회수</td>
				<td>좋아요</td>
			</tr>
			<c:forEach var="list" items="${hotlist}">
			<tr>
				<td>${list.bbs_id}</td>
				<td><a href="openBbsPost?bbs_id=${list.bbs_id}">${list.bbs_title}</a></td>
				<td>${list.member_nick}</td>
				<td>${list.bbs_notice}</td>
				<td>${list.bbs_cate}</td>
				<td>${list.bbs_count}</td>
				<td>${list.bbs_like_count}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>