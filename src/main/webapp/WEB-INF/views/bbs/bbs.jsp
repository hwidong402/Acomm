<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Bootstrap 5 -->
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BXH0MBY7NR"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BXH0MBY7NR');
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link href="resources/css/bootstrap.min.css" rel="stylesheet"> --> <!-- resources에 bootstrap 있음 -->
<link href="resources/css/bbs_struc.css" rel="stylesheet">
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
	
	<!-- 본문 -->
	<div class="position-relative text-center bg-light">
      <h3 class="fw-normal">바로 여기!</h3>
      <p class="lead fw-normal">당신이 보고있는 지금 이 자리에 광고하세요</p>
 	</div>
 	
    <!-- 1열 -->
    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
	    <div id="notiList"></div>
	    <div id="hotlist"></div>
    </div>
    
    <!-- 2열 -->
    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
	   <div id="freeList"></div>
	   <div id="marketList"></div>
    </div>
    
   	<!-- 3열 -->
    <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
	   <div id="suggList"></div>
	   <div id="worryList"></div>
    </div>
</body>
</html>