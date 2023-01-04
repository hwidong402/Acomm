<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js">
</script>
<script type="text/javascript">
	$(function() {
			$.ajax({
				url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Frss.edaily.co.kr%2Frealestate_news.xml',
						
				data : {
					url : "http://rss.edaily.co.kr/realestate_news.xml",
					api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
					count : 5
				},						
				success : function(x) {
					//alert('응답받은 내용: ' + x)
					list = x.items
					//alert(list.length)
					for (var i = 0; i < list.length; i++) {
						t = list[i].title
						p = list[i].pubDate
						l = list[i].link
						a = "<a href= " + l + ">" + t + "</a>"
						$('#result1').append(a + " <br>")
					}
				} //success
			}) //ajax
			$.ajax({
				url : 'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.mbn.co.kr%2Frss%2Festate%2F',
				data : {
					url : "https://www.mbn.co.kr/rss/estate/",
					api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
					count : 5
				},						
				success : function(x) {
					//alert('응답받은 내용: ' + x)
					list = x.items
					//alert(list.length)
					for (var i = 0; i < list.length; i++) {
						t = list[i].title
						p = list[i].pubDate
						l = list[i].link
						a = "<a href= " + l + ">" + t + "</a>"
						$('#result2').append(a + " <br>")
					}
				} //success
			}) //ajax
			$.ajax({
				url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fbiz.heraldcorp.com%2Fcommon_prog%2Frssdisp.php%3Fct%3D010300000000.xml',
				data : {
					url : "http://biz.heraldcorp.com/common_prog/rssdisp.php?ct=010300000000.xml",
					api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
					count : 5
				},						
				success : function(x) {
					//alert('응답받은 내용: ' + x)
					list = x.items
					//alert(list.length)
					for (var i = 0; i < list.length; i++) {
						t = list[i].title
						p = list[i].pubDate
						l = list[i].link
						a = "<a href= " + l + ">" + t + "</a>"
						$('#result3').append(a + " <br>")
					}
					} //success
			}) //ajax
			$.ajax({
				url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fnews.mk.co.kr%2Frss%2Fland.xml',
				data : {
					url : "http://news.mk.co.kr/rss/land.xml",
					api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
					count : 5
				},						
				success : function(x) {
					//alert('응답받은 내용: ' + x)
					list = x.items
					//alert(list.length)
					for (var i = 0; i < list.length; i++) {
						t = list[i].title
						p = list[i].pubDate
						l = list[i].link
						a = "<a href= " + l + ">" + t + "</a>"
						$('#result4').append(a + " <br>")
					}
					} //success
			}) //ajax
			$.ajax({
				url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fwww.drapt.com%2Findex%2Fdrapt_rss2.0.xml&api_key=ejxvkemry0qjivbotntyvygzajjtuawoqoituggy',
				data : {
					url : "http://www.drapt.com/index/drapt_rss2.0.xml",
					api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
					count : 5
				},						
				success : function(x) {
					//alert('응답받은 내용: ' + x)
					list = x.items
					//alert(list.length)
					for (var i = 0; i < list.length; i++) {
						t = list[i].title
						p = list[i].pubDate
						l = list[i].link
						a = "<a href= " + l + ">" + t + "</a>"
						$('#result5').append(a + " <br>")
					}
					} //success
			}) //ajax
	}) //$
</script>
</head>
<body>
<div id="news">
<hr color="green">
<div id="total" style=" float: left; width: 50%;">
<hr color="green">
<h2>전국 부동산 뉴스</h2>
	<div id="result1">e데일리<br></div>
	<div id="result2">mbn<br></div>
	<div id="result3">헤럴드경제<br></div>
	<div id="result4">매일경제 <br></div>
	<div id="result5">닥터아파트 <br></div>
	</div>
<div id="total" style=" float: left; width: 50%;">
<hr color="green">
<h2>부산 부동산 뉴스</h2>
여기는 크롤링을  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 통해 넣을 예정
	</div>
</div>
</body>
</html>
