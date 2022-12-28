<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div id="div">
	<div id="acomm">
		<h1>A-Comm</h1> <br>
		<span><img src="resources/img/acomm.png" width="100" height="40"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>독창적인 </span>
		<span style="color: red; font-weight: bold;"> 아파트 커뮤니티</span>
		<span>를 시작해보세요.</span>	
	<div id="form">
		<form action="m_login" style="display: inline-block;">
			<table>
				<tr>
					<td><input type="text" id="id" name="id" placeholder="아이디" size="50"></td>
				</tr>
				<tr>
					<td><input type="text" id="pw" name="pw" placeholder="비밀번호" size="50"></td>
				</tr>
				<tr>
					<td><button class="btn btn-primary" style="width:490px;">로그인</button></td>
				</tr>
			</table>
		</form>
	</div>
		<div id="mem">
			<span style="color: gray;"> 아컴이 처음이신가요? </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="enroll.jsp"><button class="btn btn-danger" style="width:100px;"> 회원가입 </button></a>
		</div>
	</div>
</div>
</body>
</html>