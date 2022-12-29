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
        <a href="index.jsp"> <img alt="이미지오류" src="resources/img/acomm.png"
            width="300" height="100"></a> <br>
    </div>
    <div id="enrollform">
        <form action="m_create" method="post" onsubmit="return submitf();">
            <h2>아이디</h2>
            <input type="text" name="member_id" class="member_id" placeholder="아이디는 4~20자의 영어와 숫자조합으로 사용해주세요" maxlength="20" onkeyup="chkCharCode(event)"> <br>
            <!-- <span id="idck1"></span>  -->
            <span class="must1">필수정보입니다.</span> 
            <span class="length" style="color: red; display: none">아이디는 최소 4자입니다.</span>
            <span class="idck1">사용가능한 아이디입니다.</span> 
            <span class="idck2">중복된 아이디입니다.</span>
            <h2>비밀번호</h2>
            <input type="password" name="member_pw" class="member_pw"> <br>
            <span class="must2">필수정보입니다.</span>
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
            <input type="text" name="member_tel" class="member_tel"> <br>
            <span class="must6">필수정보입니다.</span>
            <h2>아파트코드</h2>
            <!-- 이 부분은 검색과 비슷하게 아파트를 검색한 뒤 그에 맞는 코드를 넣을까 생각 중 입니다. -->
            <!-- <input type="text" name="apt_code" class="apt_code"> <br> -->
                <select name="apt_code" style="width: 300px;">
                <option value="A10025763">해운대동백두산위브더제니스</option>
                <option value="A10025752">시청역 SK VIEW</option>
                <option value="A13704104">반포자이</option>
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
        //아이디 한글 제한
            window.chkCharCode = function(event) {
        const regExp = /[^0-9a-zA-Z]/g;
        const ele = event.target;
        if (regExp.test(ele.value)) {ele.value = ele.value.replace(regExp, '');}};
    
        //아이디
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
                
                    
        
            $.ajax({
                type: "get",
                url: 'ckok',
                data: {member_id, member_id},
                success: function(x) {
                    
                
                            if (x == 'no' && member_id.length > 3){
                            /* $('#idck1').text('사용가능한 아이디입니다.'); */
                            $('.idck1').css('display','block');
                            $('.idck2').css('display','none');
                            idckv = true;
                            console.log("사용가능")
                            }else if (x != 'no'){
                            /* $('#idck1').text('중복된 아이디입니다.'); */
                            $('.idck1').css('display','none');
                            $('.idck2').css('display','block');
                            idckv = false;
                            console.log("중복")
                        }
                        if (member_id == ""){
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
        $('.member_pw').on("propertychange change keyup paste input", function() {
            var pw = $('.member_pw').val();
            if (pw == "") {
                $('.must2').css('display', 'block');
            } else {
                $('.must2').css('display', 'none');
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
        //이름
        $('.member_name').on("propertychange change keyup paste input", function() {
            var name = $('.member_name').val();
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
        //전화번호
        $('.member_tel').on("propertychange change keyup paste input", function() {
            var tel = $('.member_tel').val();
            if (tel == "") {
                $('.must6').css('display', 'block');
            } else {
                $('.must6').css('display', 'none');
            }
        });
        
        function submitf() {
            var member_id = $('.member_id').val();
            var member_pw = $('.member_pw').val();
            var pwck = $('.pwc').val();
            var member_name = $('.member_name').val();
            var sub_addr = $('.sub_addr').val();
            var member_tel = $('.member_tel').val();
            
            if(member_id == "" || member_pw == "" || pwck == "" || member_name == "" || sub_addr == "" || member_tel == ""){
                alert("필수정보를 입력해주세요");
                return false;
            }
            else if(member_id.length < 4){
                alert("아이디는 4자 이상입니다.");
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
            
            
            
            else{
                return true;
            }
        }
    </script>
</body>
</html>