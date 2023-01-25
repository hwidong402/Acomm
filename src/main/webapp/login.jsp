<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>A-Comm 로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 111 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-BXH0MBY7NR"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-BXH0MBY7NR');
</script>

<!-- 111 -->
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/login/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/login/main.css">
<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body style="background-color: #666666;">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="m_login"
					style="display: inline-block;" method="post"
					onsubmit="return loginf();">
					<span class="login100-form-title p-b-43" style="font-size: 42px;"> Login to A-COMM </span>

					<div class="wrap-input100 validate-input"
						data-validate="아이디를 입력해주세요">
						<input class="input100" type="text" id="member_id"
							name="member_id" class="member_id">
						<span class="focus-input100"></span> <span class="label-input100">아이디</span>
					</div>


					<div class="wrap-input100 validate-input"
						data-validate="비밀번호를 입력해주세요">
						<input class="input100" type="password" id="member_pw"
							name="member_pw" class="member_pw"> <span
							class="focus-input100"></span> <span class="label-input100">비밀번호</span>
					</div>

					<br>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn" style="font-size: 24px">로그인</button>
					</div>
					<br>


					<div>
						<a href="enroll.jsp"> <input type="button" value="회원가입"
							class="enroll100-form-btn" style="font-size: 24px">
						</a>

					</div>

				</form>

				<div class="login100-more"
					style="background-image: url('resources/img/A11.jpg');"></div>
			</div>
		</div>
	</div>

	<script src="resources/js/main.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
</body>
</html>