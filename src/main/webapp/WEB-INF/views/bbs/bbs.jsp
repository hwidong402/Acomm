<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
<!-- innerHead -->
<%@ include file="../common/innerHead.jsp" %>
<!-- <link href="resources/css/bbs_struc.css" rel="stylesheet"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	// cate array의 항목을 각각 ajax 호출
	/* function list5(){ */
	var cate = ['noti', 'free', 'market','sugg', 'worry']
	   $.each(cate, function(index, value) {
	      $.ajax({
	         url : "bbsList5?bbs_cate="+value,
	         success : function(data) {
	            console.log(data)
	            $('#'+value+'List').html(data);
	         }
	      });
	   });
	
	/* bbshot 추가 */
	$(function() {
			$.ajax({
				url : "bbs/bbshotall",
				success : function(data) {
					console.log(data)
					$('#hotlist').html(data);
				}
			});
	});
	
	/* } */
	// seconds 마다 refresh << 서버에 부담이 됨. 조심히 쓰거나 막을것
			// 바로 setInterval쓰면 delay가 먼저 시작함
			/* function startInterval(seconds, callback) {
					   callback();
					   return setInterval(callback, seconds * 1000);
					 } */
	// 주고싶은 delay time과, function을 기재
			/* startInterval(3, list5); */
</script>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>	
 	<!-- main -->
 	<main id='wrapper' class="container">
 	<!-- 슬라이드 광고 -->
	<%@ include file="../common/slideAD.jsp" %>
 	
	 	<!-- 앨범 스타일 메인 --> 
	 	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3">
			<div id="notiList"></div>
			<div id="hotlist"></div>
			<div id="freeList"></div>
			<div id="marketList"></div>
			<div id="suggList"></div>
			<div id="worryList"></div>
		</div>
	</main>

    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>