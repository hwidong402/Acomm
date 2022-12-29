<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";

$(function() {
	//ajax로 실시간 버스 도착정보 불러오기 예시
$.ajax({
			url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="+key+"&bstopid=505780000",
					success : function(x) {
						//검색 결과로 온 xml 데이터에서 item태그를 찾고 각각의 item 태그마다 행동 넣기
				$(x).find("item").each(function () {
					var no=$(this).find("lineno").text();	 //도착정보 값중 노선번호
					var min=$(this).find("min1").text(); 	//도착정보 값중 남은 시간(분)
					var station=$(this).find("station1").text();	//도착정보 값 중 남은 정거장 값
					var info = "노선번호 > "+no+" 남은 시간 > "+min+" 남은 정가장 > "+station; 
					$('#result').append(info+"<br>");
				})
				
			}
		  })
})
</script>
</head>
<body>

<div id="result"></div>
</body>
</html>