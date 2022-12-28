<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>A-COMM</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="main.jsp">A-Comm</a> for you
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="main.jsp">Home</a></li>
					<!-- 이후 추가페이지 및 기능 구현 		<li>
								<ul>
									<li><a href="generic.html">Generic</a></li>
									<li><a href="contact.html">Contact</a></li>
									<li><a href="elements.html">Elements</a></li>
									<li>
										<a href="#">Submenu</a>
										<ul>
											<li><a href="#">Option One</a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li><a href="#">Option Four</a></li>
										</ul>
									</li>
								</ul>
							</li> -->
					<li><a href="enroll.jsp" class="button">Sign Up</a></li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">
			<h2>A-COMM</h2>
			<p>우리 아파트 사람들과 다양한 커뮤케이션을 지금 시작해볼래요?</p>
			<ul class="actions special">
				<li><a href="login.jsp" class="button primary">로그인</a></li>
			</ul>
		</section>

		<!-- Main -->
		<section id="main" class="container">

			<section class="box special">
				<header class="major">
					<h2>A-COMM을 소개합니다!</h2>
					<p>A-COMM은 WEB시대에 맞춰서 입주민들에게 다양한 서비스를 제공하기 위해 탄생했습니다.</p>
				</header>
				<span class="image featured"><img
					src="resources/img/toron.jpg" /></span>
			</section>

			<section class="box special features">
				<div class="features-row">
					<section>
						<span class="icon solid major fa-bolt accent2"></span>
						<h3>소통</h3>
						<p>뭐적지..</p>
					</section>
					<section>
						<span class="icon solid major fa-chart-area accent3"></span>
						<h3>즐거움</h3>
						<p>아컴을 이용하면 즐거워용</p>
					</section>
				</div>
				<div class="features-row">
					<section>
						<span class="icon solid major fa-cloud accent4"></span>
						<h3>편한서비스</h3>
						<p>진짜 집에서 간편하게 처리</p>
					</section>
					<section>
						<span class="icon solid major fa-lock accent5"></span>
						<h3>적을게없네..</h3>
						<p>냠냠</p>
					</section>
				</div>
			</section>

			<div class="row">
				<div class="col-6 col-12-narrower">

					<section class="box special">
						<span class="image featured"><img
							src="resources/img/pic02.jpg" alt="" /></span>
						<h3>아파트</h3>
						<p>여기에 아파트 전체검색말고 뉴스를 넣어볼까..</p>
						<ul class="actions special">
							<li><a href="apt_all" class="button alt">아파트 검색(전체검색)</a></li>
						</ul>
					</section>

				</div>
				<div class="col-6 col-12-narrower">

					<section class="box special">
						<span class="image featured"><img
							src="resources/img/pic03.jpg" alt="" /></span>
						<h3>뉴스</h3>
						<p>뭐넣지..</p>
						<ul class="actions special">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>

				</div>
			</div>
		</section>
		<!-- CTA -->
		<section id="cta">

			<h2>아파트</h2>
			<p>내가 살고있는 아파트를 검색해보세요!</p>

			<form action="apt_one">
				<div class="row gtr-50 gtr-uniform">
					<div class="col-8 col-12-mobilep">
						<input type="text" name="name">
					</div>
					<div class="col-4 col-12-mobilep">
						<input type="submit" value="검색" class="fit" />
					</div>
				</div>
			</form>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<!-- <ul class="icons"> 일단 보류..
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands fa-google-plus"><span class="label">Google+</span></a></li>
					</ul> -->
			<ul class="copyright">
				<li>냠냠</li>
				<li>Design: 4조 협업</li>
			</ul>
		</footer>

	</div>



</body>
</html>