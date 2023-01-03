<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>A-COMM</title>
<meta charset="UTF-8"> 
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
    $(function() {
        $('#b1').click(function() {
            $.ajax({                    //ajax를 이용해서 화면넘기지 않을거임
                url : 'apt/apt_name',   //view아래 apt파일이 있음
                data : {
                    apt_name : $('#apt_name').val() 
                },                      //여기까지 컨트롤러에게 넘겨줄거야
                success : function(x) { //성공 시 값 출력
                    $('#result').html(x)
                    
                }
            })
        })
    })
</script>
</head>
<body>
<!--     <h2>우리 아파트를 찾아보세요</h2>아파트 검색 : <input id ="apt_name">
<form action="enroll2.jsp" method="post">
    <input id="apt_name" name="apt_name" class="apt_name" style="width: 350px;">
    <br>
    결과 값 출력하는 곳
    <div id="result" class="apt_code"></div>
    <script type="text/javascript">
        //아파트코드
        $('.apt_name').on("propertychange change keyup paste input",
                function() {
                    $.ajax({ //ajax를 이용해서 화면넘기지 않을거임
                        url : 'apt/apt_name', //view아래 apt파일이 있음
                        data : {
                            apt_name : $('#apt_name').val(),
                        }, //여기까지 컨트롤러에게 넘겨줄거야
                        success : function(x) { //성공 시 값 출력
                            $('#result').html(x)
                        }
                    })
                })
    </script>
    </form> -->
    <!--로그인 하러가자-->
    <a href="login.jsp">로그인</a><br>
    <!--RDB에서 아파트를 검색할거야! -->
    <form action="enrolldirect">
    아파트 검색 : <input id ="apt_name" class="apt_name" name="apt_name">
    <input type="button" value="검색" id="b1">
    <!-- <button id="b1">검색</button> -->
    <!--결과 값 출력하는 곳  -->
    <div id="result"></div>
    </form>
</body>
</html>