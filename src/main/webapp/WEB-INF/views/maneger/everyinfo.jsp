<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이거 없으면 c:for문 실행안됨 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:forEach var="vo" items="${list}">

회원 아이디: ${vo.member_id} <br>
회원 닉네임: ${vo.member_nick} <br>
회원 이름: ${vo.member_name} <br>
전화번호: ${vo.member_tel} <br>
상세주소: ${vo.sub_addr} <br>

<hr color="red">
</c:forEach>
</body>
</html>