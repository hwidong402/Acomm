<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/member.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<div id="all">
	<div id="revise">
		<h2>개인정보 수정</h2>
		<form action="local/m_up" method="post" onsubmit="return submitf();">
			<h2>닉네임</h2>
			<input type="text" value="${one.member_nick}" name="member_nick" class="member_nick"> <br>
			<span class="must0" style="color: red;">필수정보입니다.</span>
			<span class="length0" style="color: red; display: none">닉네임은 최소2자입니다.</span>
			<span class="nickck1" style="color: green; display: none;">사용가능한 닉네임입니다.</span>
			<span class="nickck2" style="color: red; display: none;">중복된 닉네임입니다.</span>
			<h2>아이디</h2>
			<input type="text" value="${one.member_id}" disabled="disabled"><br>
			<h2>비밀번호</h2>
			<input type="password" name="member_pw" class="member_pw"><br>
			<span class="must2">필수정보입니다.</span>
			<span class="length2" style="color: red; display: none">비밀번호는 최소 4자입니다.</span>
			<h2>비밀번호 재확인</h2>
			<input type="password" name="pwc" class="pwc"> <br>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1" style="color: green;">비밀번호가 일치합니다.</span>
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			<span class="must3">필수정보입니다.</span>
			<h2>이름</h2>
			<input type="text" id="member_name" name = "member_name" class = "member_name" value="${one.member_name}"> <br>
			<h2>전화번호</h2>
			<input type="text" id="member_tel" name="member_tel"
				class="member_tel" maxlength="13" value="${one.member_tel}">
			<hr style="width: 300px">
			<button type="submit" class="btn btn-success" style="width: 300px;">변경하기</button>
		</form>
		<hr style="width: 300px">
		<form action="delete">
		
		<input type="submit" id="b2" class="btn btn-danger" style="width: 300px;" value="탈퇴하기">
		<!-- <button onclick="findcode()" id="b2" class="btn btn-danger" style="width: 300px;">탈퇴하기</button> -->
		</form>
	</div>
	</div>
	<script type="text/javascript">
	
	//회원탈퇴 확인
		b2.onclick = function() {
			if (confirm("A-COMM을 탈퇴하시겠습니까?")) {
				return true;
			} else {
				return false;
			}	
		}
	
	
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
            url: 'nickok', //view아래에 위치
            data: {member_nick, member_nick},
            success: function(x) {
                if (x == 'no' && member_nick.length > 1 || member_nick == "${one.member_nick}"){
                    $('.nickck1').css('display','block');
                    $('.nickck2').css('display','none');
                    nickckv = true;
                    //console.log("닉네임 사용가능")
                    }else if (x != 'no'){
                    $('.nickck1').css('display','none');
                    $('.nickck2').css('display','block');
                    nickckv = false;
                    //console.log("닉네임 중복")
                }
                if (member_nick == ""){
                    $('.nickck1').css('display','none');
                    $('.nickck2').css('display','none');
                }
            },
            error: function() {
                //alert('닉네임 중복 검사 ajax에러')
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
	//비밀번호확인
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
	console.log(this.value);
	this.value = autoHypenPhone( this.value ) ;
	}
	//회원가입 유효성 검증
	function submitf() {
		var member_nick = $('.member_nick').val();
	    var member_pw = $('.member_pw').val();
	    var pwck = $('.pwc').val();
	    var member_tel = $('.member_tel').val();
    	if(member_nick == "" || member_pw == "" || pwck == "" || member_tel == ""){
        	alert("필수정보를 입력해주세요");
        	return false;
    	}
    	else if(member_nick.length < 2){
    	    alert("닉네임은 2자 이상입니다.");
    	    return false;
    	}
    	else if(nickckv == false){
    	    alert("닉네임이 중복입니다.");
    	    return false;
    	}
    	else if(member_pw.length < 4){
    	    alert("비밀번호는 4자 이상입니다.");
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
</body>
</html>