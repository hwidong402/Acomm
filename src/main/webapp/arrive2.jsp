<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키

$(function() {
	
$.ajax({
			url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="+key+"&bstopid=163900101",
					success : function(x) {
				var table = "<table class="+"table table-dark table-striped"+"><tr><td>버스번호</td><td>남은 시간</td><td>남은 정류장</td></tr>"; // table 만드는 기능
				$(x).find("item").each(function () {
					var no=$(this).find("lineno").text();
					var min=$(this).find("min1").text();
					var station=$(this).find("station1").text();
					var info = "<tr><td>"+no+"</td><td>"+min+"</td><td>"+station+"</td></tr>"; //table 항목 추가하기
					table+=info;
				})
				
					$('#result').append(table+"</table>");//테이블 입력
			}
		  })
})
</script>
</head>
<body>
<a href=bus/busstopmap.bus><button>다른 정류장 보기</button></a>
<a href=bus/busstopmap2.bus><button>다른 정류장 보기</button></a>
<!-- 도착정보 결과 --> 
<div id="result" style="width:400px;height:350px;" ></div> 
<!-- table 실험  -->
<!-- <table class="table table-dark table-striped">
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
</tr>
<tr>
<td>4</td>
<td>5</td>
<td>6</td>
</tr>
<tr>
<td>7</td>
<td>8</td>
<td>9</td>
</tr>
</table> -->
</body>
</html>