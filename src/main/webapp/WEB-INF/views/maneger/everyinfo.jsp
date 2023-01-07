<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:forEach var="vo" items="${list}">

회원 아이디: ${vo.member_id} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
회원 닉네임: ${vo.member_nick} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
회원 이름: ${vo.member_name} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
전화번호: ${vo.member_tel} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
상세주소: ${vo.sub_addr} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->

<hr color="red">
</c:forEach>
</body>
</html>