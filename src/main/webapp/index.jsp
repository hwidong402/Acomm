<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BXH0MBY7NR"></script>
<script>
window.dataLayer = window.dataLayer || [];
 function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());

gtag('config', 'G-BXH0MBY7NR');
</script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/indexcss/styles.css" rel="stylesheet" />
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
 <title>내가 사는 곳이 중심이 되는 곳 A-Comm</title>
    </head>
    <body>
          <!-- Navigation-->
          <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">A-Comm</a>
                <a class="btn btn-primary" href="login.jsp">Login</a>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-white">
                            <!-- Page heading-->
                            <span><h1 class="mb-5">사람들과 소통하는 공간</h1></span>
                            <span><h2 class="mb-5">A-Comm</h2></span><br>
                                                    
                            <!-- Signup form-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- * * SB Forms Contact Form * *-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- This form is pre-integrated with SB Forms.-->
                            <!-- To make this form functional, sign up at-->
                            <!-- https://startbootstrap.com/solution/contact-forms-->
                            <!-- to get an API token!-->
                          <section id="banner">
						<ul class="actions special">
						<!--RDB에서 아파트를 검색할거야! -->
						<form action="enrolldirect">
						<input id="apt_name" class="apt_name" name="apt_name"
						style="width: 500px; height: 50px;" placeholder="우리 아파트를 검색해보세요.">
						<!--결과 값 출력하는 곳  -->
						<div id="result"></div>
						<br> <input type="button" value="검색" id="b1" class="btn btn-primary btn-lg"> <!-- 이걸 누르면 ajax실행 -->
						</form>
						</ul>

					</section>
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                                <div class="d-none" id="submitSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">Form submission successful!</div>
                                        <p>To activate this form, sign up at</p>
                                        <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                    </div>
                                </div>
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                                <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Icons Grid-->
        
        <!-- Testimonials-->
        <section class="testimonials text-center bg-light">
            <div class="container">
                <h2 class="mb-5">아컴에서 무엇을 할 수 있나요?</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="resources/indexassets/img/cmnty.jpg" alt="..." />
                            <h5>커뮤니티</h5>
                            <p class="font-weight-light mb-0">다양한 게시판에서 우리 아파트 사람들과 소통할 수 있어요</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="resources/indexassets/img/bood.jpg" alt="..." />
                            <h5>부동산</h5>
                            <p class="font-weight-light mb-0">우리 아파트 주변 집값은 어느정도인지 <br>확인할 수 있어요</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="resources/indexassets/img/town.PNG" alt="..." />
                            <h5>지역정보</h5>
                            <p class="font-weight-light mb-0">우리 동네 주변맛집은 무엇이 있는지 <br>찾아볼 수 있어요</p>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
       
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">
                          
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; Jav4 Team :휘동 채윤 원영 찬우 태섭</p>
                    </div>
                   
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/indexjs/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
