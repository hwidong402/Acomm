<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증</title>
</head>
<script type="text/javascript">
	if (${ocr} == true) {
		alert('회원 인증이 완료 되었습니다.')
		location.href = 'myinfo'
	} else{
		alert('회원 인증이 실패 하였습니다.')
		location.href = 'myinfo'
	}
	
</script>
<body>
${ocr}
</body>
</html>