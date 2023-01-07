<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!--  JSP에서 jsoup을 사용하기 위해 import -->
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리아파트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    $(function() {
			//1. 이데일리 부동산 뉴스
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
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        //<a href='https://naver.com' target=_blank>
                        //a = "<a href= " + l + ">" + t + "</a>"
                        $('#result1').append(a + " <br>")
                        //console.log(a)
                    }
                } //success
            }) //ajax
            //2. mbn 부동산 뉴스
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
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result2').append(a + " <br>")
                    }
                } //success
            }) //ajax
            //3. 헤럴드 경제 부동산 뉴스
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
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result3').append(a + " <br>")
                    }
                    } //success
            }) //ajax
            //4. 매일경제 부동산 뉴스
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
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result4').append(a + " <br>")
                    }
                    } //success
            }) //ajax
            //5. 닥터 아파트 부동산 뉴스
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
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result5').append(a + " <br>")
                    }
                    } //success
            }) //ajax
    }) //$
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['년/월', '실거래가', '거래량'],
        ['2022년 09월',  1000, 20],
        ['2022년 10월',  1170, 10],
        ['2022년 11월',  660, 20],
        ['2022년 12월',  1030, 3]
      ]);
      var options = {
        title: '최근 실거래가 근황',
        curveType: 'function',
        legend: { position: 'bottom' }
      };
      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
      chart.draw(data, options);
    }
</script>
</head>
<body>
<body>
<div id="all">
<div id="chart" >
<hr color="green">
<div id="curve_chart" style="width: 900px; height: 500px"></div>
</div>
<div id="news">
<div id="totalnews" style=" float: left; width: 50%;">
<hr color="green">
<h2>전국 부동산 뉴스</h2>
    <div id="result1">e데일리<br></div>
    <div id="result2">mbn<br></div>
    <div id="result3">헤럴드경제<br></div>
    <div id="result4">매일경제 <br></div>
    <div id="result5">닥터아파트 <br></div>
    </div>
<div id="busannews" style=" float: left; width: 50%;">
<hr color="green">
<h2>${city} 부동산 뉴스</h2>
<!-- 현재 로그인 시 잡히는 apt_city를 이용하여 그에 따라 맞는 지역(17군데)의 네이버 부동산 뉴스를 제공하고 있음
이걸 로그인 시 세션을 잡는 것이 아니라 모델로 넘기는 것으로 하고 모델값을 잡도록 변경해야 부하가 적음 -->
<a href="https://land.naver.com/news/newsRead.naver?type=region&prsco_id=015&arti_id=0004769071" target="_blank">눌러보세요</a> <br>
<c:choose>
<c:when test="${city eq '부산광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2600000000&dvsn_no=").get();
          Elements posts = doc2.body().getElementsByClass("section_headline");
          Elements file = posts.select("dt");
             for(Element e : file){
            	 //out.println(e);
                    out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64)+" target='_blank'>네이버 뉴스 이름을 어떻게 가져오지</a> <br>");
                    
             }
             //현재 e로 보여주는데 e에서 갖고 있는 dt의 종류는 두 가지
             //썸네일과 글로 된 기사 제목이 있는데 썸네일이 없는 경우도 있음, 이런 경우에는 기사에 dt가 하나 밖에 없음
             //문제는 dt에서 보내주는 a태그의 href는 본인들 페이지에서만 돌아가도록 뷰처럼 제공됨
             //그래서 우리사이트에서 href를 클릭하면 404에러가 나옴
             //밑의 링크는 해당 href에다가 앞에 네이버 주소를 붙혀서 정상적으로 돌아가는 링크로 만든 것
             //이 링크를 사용하여 정상적으로 만들기 위해선
             //1. e의 href를 해당 링크로 모두 변경
             //1-1) 이러면 썸네일과 제목 모두 살릴 수 있음
             //2. 바뀐 링크를 이용하여 새로운 a태그와 href를 만들기
             //<a href="https://land.naver.com/news/newsRead.naver?type=region&prsco_id=015&arti_id=0004769071">눌러보세요</a>
             //2-1) 이 모양이 나와야 함
             //2-2) 이러면 썸네일은 그냥 죽어버림
%></c:when>
<c:when test="${city eq '경기도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4100000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '인천광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2800000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '대전광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3000000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '충청북도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4300000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '서울특별시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=1100000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '충청남도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4400000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '광주광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2900000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '전라남도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4600000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '울산광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3100000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '전라북도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4500000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '제주특별자치도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=5000000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '경상북도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4700000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '경상남도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4800000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '강원도'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4200000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '대구광역시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2700000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
<c:when test="${city eq '세종특별자치시'}"><%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3600000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%></c:when>
</c:choose>
<%-- ${city} --%>
<!-- 여기는 크롤링을 통해 넣을 예정 -->
<%-- <%
    Document doc = Jsoup.connect("https://www.naver.com").get();
    String title = doc.title();
    out.println(title);
%> --%>
<%-- <%
    Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2600000000&dvsn_no=").get();
        Elements posts = doc2.body().getElementsByClass("section_headline");
        Elements file = posts.select("dt");
         out.println(posts.select("dt"));
%> --%>
    </div>
</div>
</div>
</body>
</body>
</html>
