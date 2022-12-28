<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>A-Comm 회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/member.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div id="header">
		<a href="main.jsp"> <img alt="이미지오류" src="resources/img/acomm.png"
			width="300" height="100"></a> <br>
	</div>
	<div id="enrollform">
		<form action="m_create" method="post" onsubmit="return submitf();">
			<h2>아이디</h2>
			<input type="text" name="id" class="id" placeholder="아이디는 최대 10자"
				maxlength="10"> <br>
			<!-- <span id="idck1"></span>  -->
			<span class="must1">필수정보입니다.</span> <span class="idck1">사용가능한
				아이디입니다.</span> <span class="idck2">중복된 아이디입니다.</span>
			<h2>비밀번호</h2>
			<input type="password" name="pw" class="pw"> <br> <span
				class="must2">필수정보입니다.</span>
			<h2>비밀번호 재확인</h2>
			<input type="password" name="pwc" class="pwc"> <br> <span
				class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
				class="pwck_input_re_1" style="color: green;">비밀번호가 일치합니다.</span> <span
				class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> <span class="must3">필수정보입니다.</span>
			<h2>이름</h2>
			<input type="text" name="name" class="name"> <br> <span
				class="must4">필수정보입니다.</span>
			<h2>아파트</h2>
			<select name="code" style="width: 300px;">
				<option value="A11">해운대 두산위브 더 제니스</option>
				<option value="B22">엘시티</option>
				<option value="C33">스타벅스</option>
			</select> <br> <br>
			<h2>상세주소</h2>
			<input type="text" name="sub_addr" class="sub_addr"> <br>
			<span class="must5">필수정보입니다.</span>
			<hr>
			<button type="submit" class="btn btn-success" style="width: 300px;">가입하기</button>
			<br>
		</form>
	</div>
	<script type="text/javascript">
		//아이디
		$('.id').on("propertychange change keyup paste input", function() {
			var id = $('.id').val();
			if (id == "") {
				$('.must1').css('display', 'block');
			} else {
				$('.must1').css('display', 'none');
			}
		
			$.ajax({
				type: "get",
				url: 'ckok',
				data: {id, id},
				success: function(x) {
					
				
						if (x == 'no'){
							/* $('#idck1').text('사용가능한 아이디입니다.'); */
							$('.idck1').css('display','block');
							$('.idck2').css('display','none');
							idckv = true;
							}else{
							/* $('#idck1').text('중복된 아이디입니다.'); */
							$('.idck1').css('display','none');
							$('.idck2').css('display','block');
							idckv = false;
						}
						if (id == ""){
							$('.idck1').css('display','none');
							$('.idck2').css('display','none');
						}
					
				},
				error: function() {
					alert('error')
				}
			})
			
		});
		//비밀번호
		$('.pw').on("propertychange change keyup paste input", function() {
			var pw = $('.pw').val();
			if (pw == "") {
				$('.must2').css('display', 'block');
			} else {
				$('.must2').css('display', 'none');
			}
		});
		//비밀번호확인
		$('.pwc').on("propertychange change keyup paste input", function() {
			var pw = $('.pw').val();
			var pwck = $('.pwc').val();
			$('.final_pwck_ck').css('display', 'none');
			if (pwck == pw) {
				$('.pwck_input_re_1').css('display', 'block');
				$('.pwck_input_re_2').css('display', 'none');
				pwckcorCheck = true;
			} else {
				$('.pwck_input_re_1').css('display', 'none');
				$('.pwck_input_re_2').css('display', 'block');
				pwckcorCheck = false;
			}
			if (pwck == "") {
				$('.must3').css('display', 'block');
			} else {
				$('.must3').css('display', 'none');
			}
		});
		//이름
		$('.name').on("propertychange change keyup paste input", function() {
			var name = $('.name').val();
			if (name == "") {
				$('.must4').css('display', 'block');
			} else {
				$('.must4').css('display', 'none');
			}
		});
		//상세주소
		$('.sub_addr').on("propertychange change keyup paste input", function() {
			var sub_addr = $('.sub_addr').val();
			if (sub_addr == "") {
				$('.must5').css('display', 'block');
			} else {
				$('.must5').css('display', 'none');
			}
		});
		
		function submitf() {
			var id = $('.id').val();
			var pw = $('.pw').val();
			var pwck = $('.pwc').val();
			var name = $('.name').val();
			var sub_addr = $('.sub_addr').val();
			
			if(id == "" || pw == "" || pwck == "" || name == "" || sub_addr == ""){
				alert("필수정보를 입력해주세요");
				return false;
			}else if(idckv == false){
				alert("아이디가 중복입니다.");
				return false;
			}else if(pw != pwck){
				alert("비밀번호를 재확인해주세요.")
				return false;
			}{
				return true;
			}
		}
	</script>
</body>
</html>