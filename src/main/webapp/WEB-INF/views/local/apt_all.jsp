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
<hr>
<c:forEach var="vo" items="${list}">
검색한 code: ${vo.code} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
검색한 name: ${vo.name} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
검색한 addr: ${vo.addr} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
검색한 area: ${vo.area} <br> <!--el: expression language, 속성으로 지정한 것만 프린트!-->
<hr color="red">
</c:forEach>
</body>
</html>