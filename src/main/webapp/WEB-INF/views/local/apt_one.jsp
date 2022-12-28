<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아파트 검색 결과입니다.
<hr color=yellow>
<table border=1>
	<tr>
		<td>code</td>
		<td>${one.code}</td> 
	</tr>
	<tr>
		<td>name</td>
		<td>${one.name}</td> <!-- one.getName()  -->
	</tr>
	<tr>
		<td>area</td>
		<td>${one.area}</td> <!-- one.getId()  -->
	</tr>
	
</table>
</body>
</html>