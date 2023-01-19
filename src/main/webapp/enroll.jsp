<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>A-Comm 회원가입</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 111 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/member.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BXH0MBY7NR"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BXH0MBY7NR');
</script>

<!-- 111 -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/css/login/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/css/login/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/login/enrol.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="m_create" method="post" onsubmit="return submitf();">
					<span class="login100-form-title p-b-43" style="font: 고딕;font-weight: bold; font-size: 24px;">
						A-COMM 회원가입
					</span>
					<h2>닉네임</h2>
			<input type="text" name="member_nick" class="member_nick"> <br>
			<span class="must0" style="color: red;">필수정보입니다.</span> 
			<span class="length0" style="color: red; display: none">닉네임은 최소2자입니다.</span> 
			<span class="nickck1" style="color: green; display: none;">사용가능한 닉네임입니다.</span> 
			<span class="nickck2" style="color: red; display: none;">중복된 닉네임입니다.</span>
			<h2>아이디</h2>
			<input type="text" name="member_id" class="member_id"
				placeholder="아이디는 4~20자의 영어와 숫자조합" maxlength="20"
				onkeyup="chkCharCode(event)"> <br>
			<!-- <span id="idck1"></span>  -->
			<span class="must1">필수정보입니다.</span> 
			<span class="length" style="color: red; display: none">아이디는 최소 4자입니다.</span> 
			<span class="idck1" style="color: green; display: none;">사용가능한 아이디입니다.</span> 
			<span class="idck2">중복된 아이디입니다.</span>
			<h2>비밀번호</h2>
			<input type="password" name="member_pw" class="member_pw"> <br>
			<span class="must2">필수정보입니다.</span> 
			<span class="length2" style="color: red; display: none">비밀번호는 최소 4자입니다.</span>
			<h2>비밀번호 재확인</h2>
			<input type="password" name="pwc" class="pwc"> <br> 
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> 
			<span class="pwck_input_re_1" style="color: green;">비밀번호가 일치합니다.</span> 
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> 
			<span class="must3">필수정보입니다.</span>
			<h2>이름</h2>
			<input type="text" name="member_name" class="member_name"> <br>
			<span class="must4">필수정보입니다.</span>
			<h2>전화번호</h2>
			<input type="text" id="member_tel" name="member_tel" class="member_tel" 
			maxlength="13" placeholder="숫자만 입력 가능 합니다."> <br> 
			<span class="must6">필수정보입니다.</span>
			<h2>아파트이름</h2>
			<input id="apt_name" name="apt_name" class="apt_name" placeholder="아파트를 검색하시고 찾아주세요."> <br>
			<span class="must7">필수정보입니다.</span>
			<!--결과 값 출력하는 곳 -->
			<div id="result" class="apt_code"></div>
			<h2>상세주소</h2>
			<input type="text" name="sub_addr" class="sub_addr"> <br>
			<span class="must5">필수정보입니다.</span>
			<hr style="width: 300px;">
			<!-- <input type="submit" value="가입하기" > -->
			<button type="submit" class="go100-form-btn" style="width: 300px;">가입하기</button>
			<br>
				
					
				</form>
				
				<div class="login100-more" style="background-image: url('resources/img/A11.jpg');">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    //아파트이름 검색 시 아파트이름과 아파트코드 불러오는 ajax
        $('.apt_name').on("propertychange change keyup paste input", function() {
            $.ajax({                    //ajax를 이용해서 화면넘기지 않을거임
                url : 'apt/apt_code',   //views아래 apt폴더에 파일이 있음
                data : {
                    apt_name : $('#apt_name').val(),
                    apt_code : $('#apt_code').val()
                },                      //여기까지 컨트롤러에게 넘겨줄거야
                success : function(x) { //성공 시 값 출력
                    $('#result').html(x)
                }
            })
        })
    
// 검색 눌렀을 때 버전      
//    $(function() {
//      $('#검색').click(function() {
//          $.ajax({                    //ajax를 이용해서 화면넘기지 않을거임
//              url : 'apt/apt_code',   //view아래 apt파일이 있음
//              data : {
//                  apt_name : $('#apt_name').val(),
//                  apt_code : $('#apt_code').val()
//                  /* apt_city : $('#apt_city').val() */
//              },                      //여기까지 컨트롤러에게 넘겨줄거야
//              success : function(x) { //성공 시 값 출력
//                  $('#result').html(x)
//              }
//          })
//      })
//  })
    
    	//닉네임 입력 및 길이 확인
    	$('.member_nick').on("propertychange change keyup paste input", function() {
            
            var member_nick = $('.member_nick').val();
            if (member_nick == "") {
                $('.must0').css('display', 'block');
            } else {
                $('.must0').css('display', 'none');
            }
            if (member_nick.length < 2 && member_nick.length >= 1) {
                $('.length0').css('display', 'block');
            } else {
                $('.length0').css('display', 'none');
            }
                
            //닉네임 중복 검사        
            $.ajax({
                type: "get",
                url: 'nickok', //views아래에 위치
                data: {member_nick, member_nick},
                success: function(x) {
                
                            if (x == 'no' && member_nick.length > 1){
                            $('.nickck1').css('display','block');
                            $('.nickck2').css('display','none');
                            //console.log("닉네임 사용가능")
                            nickckv = true;
                            }else if (x != 'no'){
                            $('.nickck1').css('display','none');
                            $('.nickck2').css('display','block');
                            //console.log("닉네임 중복")
                            nickckv = false;
                        }
                        if (member_nick == ""){
                            $('.nickck1').css('display','none');
                            $('.nickck2').css('display','none');
                        }
                    
                },
                error: function() {
                	//alert('닉네임 중복 검사 ajax 에러')
                }
            })
            
        });
    
        //아이디에는 영어와 숫자만 가능하도록 제한
            window.chkCharCode = function(event) {
        const regExp = /[^0-9a-zA-Z]/g;
        const ele = event.target;
        if (regExp.test(ele.value)) {ele.value = ele.value.replace(regExp, '');}};
    
        //아이디 입력 및 길이 제한
        $('.member_id').on("propertychange change keyup paste input", function() {
            
            var member_id = $('.member_id').val();
            if (member_id == "") {
                $('.must1').css('display', 'block');
            } else {
                $('.must1').css('display', 'none');
            }
            if (member_id.length < 4 && member_id.length >= 1) {
                $('.length').css('display', 'block');
            } else {
                $('.length').css('display', 'none');
            }
                
            //아이디 중복 검사        
            $.ajax({
                type: "get",
                url: 'ckok', //views아래에 위치
                data: {member_id, member_id},
                success: function(x) {
                    
                            if (x == 'no' && member_id.length > 3){
                            $('.idck1').css('display','block');
                            $('.idck2').css('display','none');
                            idckv = true;
                            //console.log("아이디 사용가능")
                            }else if (x != 'no'){
                            $('.idck1').css('display','none');
                            $('.idck2').css('display','block');
                            idckv = false;
                            //console.log("아이디 중복")
                        }
                        if (member_id == ""){
                            $('.idck1').css('display','none');
                            $('.idck2').css('display','none');
                        }
                    
                },
                error: function() {
                    //alert('아이디 중복 검사 ajax 에러')
                }
            })
            
        });
        //비밀번호 입력 및 최소 길이 검사
        $('.member_pw').on("propertychange change keyup paste input", function() {
            var member_pw = $('.member_pw').val();
            if (member_pw == "") {
                $('.must2').css('display', 'block');
            } else {
                $('.must2').css('display', 'none');
            }
            if (member_pw.length < 4 && member_pw.length >= 1) {
                $('.length2').css('display', 'block');
            } else {
                $('.length2').css('display', 'none');
            }
        });
        //비밀번호 확인
        $('.pwc').on("propertychange change keyup paste input", function() {
            var pw = $('.member_pw').val();
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
        //이름 입력 검사
        $('.member_name').on("propertychange change keyup paste input", function() {
            var name = $('.member_name').val();
            if (name == "") {
                $('.must4').css('display', 'block');
            } else {
                $('.must4').css('display', 'none');
            }
        });
        //상세주소 입력 검사
        $('.sub_addr').on("propertychange change keyup paste input", function() {
            var sub_addr = $('.sub_addr').val();
            if (sub_addr == "") {
                $('.must5').css('display', 'block');
            } else {
                $('.must5').css('display', 'none');
            }
        });
        //전화번호 입력 검사
        $('.member_tel').on("propertychange change keyup paste input", function() {
            var tel = $('.member_tel').val();
            if (tel == "") {
                $('.must6').css('display', 'block');
            } else {
                $('.must6').css('display', 'none');
            }
        });
        
        //전화번호에 하이픈 추가
        var autoHypenPhone = function(str){
      str = str.replace(/[^0-9]/g, '');
      var tmp = '';
      if( str.length < 4){
          return str;
      }else if(str.length < 7){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3);
          return tmp;
      }else if(str.length < 11){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 3);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
      }else{              
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 4);
          tmp += '-';
          tmp += str.substr(7);
          return tmp;
      }
  
      return str;
}
var member_tel = document.getElementById('member_tel');
member_tel.onkeyup = function(){
  this.value = autoHypenPhone( this.value ) ;  
}
        
        //아파트이름 입력 검사
        $('.apt_name').on("propertychange change keyup paste input", function() {
            var apt_name = $('.apt_name').val();
            if (apt_name == "") {
                $('.must7').css('display', 'block');
            } else {
                $('.must7').css('display', 'none');
            }
        });
        //회원가입 유효성 검증
        function submitf() {
            var member_nick = $('.member_nick').val();
            var member_id = $('.member_id').val();
            var member_pw = $('.member_pw').val();
            var pwck = $('.pwc').val();
            var member_name = $('.member_name').val();
            var sub_addr = $('.sub_addr').val();
            var member_tel = $('.member_tel').val();
            var apt_name = $('.apt_name').val();
            var apt_code = $('.apt_code').val();
            
            if(member_nick == "" || member_id == "" || member_pw == "" || pwck == "" || member_name == "" || sub_addr == "" || member_tel == "" || apt_name == ""){
                alert("필수정보를 입력해주세요");
                return false;
            }
            //else if(apt_code == ""){
            //  alert("아파트코드를 찾아주세요.");
            //  alert(apt_code);
            //  return false;
            // }  
            else if(member_nick.length < 2){
                alert("닉네임은 2자 이상입니다.");
                return false;
            }
            
            else if(member_id.length < 4){
                alert("아이디는 4자 이상입니다.");
                return false;
            }
            
            else if(member_pw.length < 4){
                alert("비밀번호는 4자 이상입니다.");
                return false;
            }
            
            else if(nickckv == false){
                alert("닉네임이 중복입니다.");
                return false;
            }
            
            else if(idckv == false){
                alert("아이디가 중복입니다.");
                return false;
            }
            
            else if(member_pw != pwck){
                alert("비밀번호를 재확인해주세요.");
                return false;
            }
            else if(member_tel.length != 13){
                alert("핸드폰 번호를 제대로 입력해주세요.");
                return false;
            }
            
            else{
                return true;
            }
        }
    </script>
<script src="resources/js/main.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</body>
</html>