<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bbshot.css">
<script type="text/javascript">
	$(function() {
			$.ajax({
				url : "bbs/bbshotall",
				success : function(data) {
					console.log(data)
					$('#context').html(data);
				}
			});
	});
</script>
</head>
<body>
<a href="bbs/bbshotall"> 뷰로 </a>
<button id="b1">테스트용 버튼하나</button>
<div id="context"></div>
</body>
</html>