<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BXH0MBY7NR"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BXH0MBY7NR');
</script>
<title>A-COMM</title>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//아파트 검색 ajax
	$(function() {
		$('#b1').click(function() {
			$.ajax({ //ajax를 이용해서 화면넘기지 않을거임
				url : 'apt/apt_name', //views아래 apt폴더에 파일이 있음
				data : {
					apt_name : $('#apt_name').val()
				}, //여기까지 컨트롤러에게 넘겨줄거야
				success : function(x) { //성공 시 값 출력
					$('#result').html(x)

				}
			})
		})
	})
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
</script>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<header id="header" class="alt"
			style="position: fixed; background-color: #666;">
			<h1>
				<a href="#">A-Comm</a> for you
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="login.jsp" class="button">Login</a></li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">
			<h2>A-COMM</h2>
			<p>우리 아파트 사람들과 다양한 커뮤케이션을 지금 시작해볼까요?</p>
			<ul class="actions special">
				<!--RDB에서 아파트를 검색할거야! -->
				<form action="enrolldirect">
					<input id="apt_name" class="apt_name" name="apt_name"
						style="width: 500px; height: 50px;" placeholder="우리 아파트를 검색해보세요.">
					<!--결과 값 출력하는 곳  -->
					<div id="result"></div>
					<br> <input type="button" value="검색" id="b1"> <!-- 이걸 누르면 ajax실행 -->

				</form>

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
		</section>
		<!-- CTA -->


		<!-- Footer -->
		<footer id="footer">
			<ul class="copyright">
				<li>회사소개</li>
				<li>인재채용</li>
				<li>제휴제안</li>
				<li>이용약관</li>
				<li>개인정보처리방침</li>
				<li>청소년보호정책</li>
				<li>A-COMM정책</li>
				<li>고객센터</li>
			</ul>
		</footer>
		<div
			style="width: 50px; height: 50px; background: black; bottom: 30px; right: 30px; position: fixed;">
			<a href="#">위로가기</a>
		</div>

	</div>


</body>
</html>
