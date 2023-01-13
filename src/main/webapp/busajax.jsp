<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 상가 정보 띄우기용 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
var	stopid=163900101;
var stopname="";
var list=null;
$(function() {
//마이 리뷰 들고오기	
/* $.ajax({
	url:"myreview.reply",
	data:{ rest_id:4,
		member_code:1},
	success : function(x){
		console.log(x.length);
		if(x.length>5){
		$('#myreview').html(x);
			
		}
		
	}
}) */
//다른사람 리뷰 들고오기
$.ajax({
	url:"otherreview.reply",
	data:{ rest_id:1,
		member_code:1},
	success : function(x){
		console.log(x.length);
		if(x.length>15){
		$('#myreview').html(x);
			
		}
		
	}
})
})
/* $.ajax({
	url:"stopsearch.bus",
	data:{ stop_id:stopid},
	success : function(x){
		alert(x.stop_name)
		stopname=x.stop_name;
		
	}
}) */

/* $.ajax({
	url:"list.rest",
	success : function(x){
		alert(x[0].rest_id)
		alert(x[0].rest_name)
		
	}
}) */
//버스 ajax연습
/* $.ajax({
	url:"list.bus",
	success : function(x){
		stopname=x[100].stop_name;
		stopid=x[100].stop_id;
		list=x;
		alert(list)
	}
})
alert(list[0].stop_id)
$(function() {
	
$.ajax({
			url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="+key+"&bstopid="+stopid,
					success : function(x) {
				var table = "<table class="+"table table-dark table-striped"+"><tr><td>버스번호</td><td>남은 시간</td><td>남은 정류장</td></tr>"; // table 만드는 기능
				$(x).find("item").each(function () {
					var no=$(this).find("lineno").text();
					var min=$(this).find("min1").text();
					var station=$(this).find("station1").text();
					var info = "<tr><td>"+no+"</td><td>"+min+"</td><td>"+station+"</td></tr>"; //table 항목 추가하기
					table+=info;
				})
				
					$('#result').append("<div style=width400>"+stopname+"</div>"+table+"</table>");//테이블 입력
			}
		  })
}) */

</script>
</head>
<body>
<div id="result" style="width:400px;height:350px;" ></div> 
<div id="myreview">기존의 글</div>
</body>
</html>