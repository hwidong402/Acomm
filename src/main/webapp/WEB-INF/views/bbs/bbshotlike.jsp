<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
				<tr>
				<td>bbs아이디</td>	
				<td>member코드</td>
				<td>시간</td>	
				</tr>
			<c:forEach var="vo" items="${likeVO}">
				<tr>
				<td>${vo.bbs_id}</td>
				<td>${vo.member_code}</td>
				<td>${vo.like_date}</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>