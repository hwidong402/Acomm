<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A-Comm의 회원가입 완료</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/member.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body
	style="background-image: url('resources/img/park.png'); background-repeat: no-repeat; background-position: center; background-size: cover; height: 80vh">

	<div id="div" style="position: fixed; top: 150px; left: 500px; font-size: large;">
		<span style="color: red;">A-Comm</span> <span>의 회원이 되신 것을 진심으로
			축하드립니다.</span> <br> <br>
		<div style="display: inline-block; float: left; " >
			<a href="main.jsp">
				<button class="btn btn-danger" style="width: 200px;">메인화면으로</button>
			</a>
		</div>
		<span style="visibility: hidden;">........</span>

		<div style="display: inline-block; float: right; " >
			<a href="login.jsp">
				<button class="btn btn-success" style="width: 200px;">로그인하러가기</button>
			</a>
		</div>
	</div>

</body>
</html>