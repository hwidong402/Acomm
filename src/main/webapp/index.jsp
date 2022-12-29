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
			$.ajax({					//ajax를 이용해서 화면넘기지 않을거임
				url : 'apt/apt_name',   //view아래 apt파일이 있음
				data : {
					apt_name : $('#apt_name').val() 
				},						//여기까지 컨트롤러에게 넘겨줄거야
				success : function(x) { //성공 시 값 출력
					$('#result').html(x)
				}
			})
		})
	})
</script>
</head>
<body>
	<!--로그인 하러가자-->
	<a href="login.jsp">로그인</a><br>
	<!--RDB에서 아파트를 검색할거야! -->
	아파트 검색 : <input id ="apt_name"><button id="b1">검색</button>
	<!--결과 값 출력하는 곳  -->
	<div id="result"></div>
</body>
</html>

