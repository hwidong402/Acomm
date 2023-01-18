<%@page import="org.netlib.util.doubleW"%>
<%@page import="com.jav4.acomm.apt.AptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!--  JSP에서 jsoup을 사용하기 위해 import -->
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<!-- 가져온 api를 paring하기 위한 import -->
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>

<!-- key 바꿀 시 202줄 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${city.apt_name}부동산</title>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
/* rss를 이용해서 부동산 뉴스 가져오기 */
    $(function() {
			//1. 이데일리 부동산 뉴스
            $.ajax({
                url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Frss.edaily.co.kr%2Frealestate_news.xml',
                        
                data : {
                    url : "http://rss.edaily.co.kr/realestate_news.xml",
                    api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
                    count : 20
                },                      
                success : function(x) {
                    list = x.items
                    for (var i = 0; i < list.length; i++) {
                        t = list[i].title
                        p = list[i].pubDate
                        l = list[i].link
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result1').append(a + " <br><br>")
                    }
                } //success
            }) //ajax
            //2. mbn 부동산 뉴스
            $.ajax({
                url : 'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.mbn.co.kr%2Frss%2Festate%2F',
                data : {
                    url : "https://www.mbn.co.kr/rss/estate/",
                    api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
                    count : 20
                },                      
                success : function(x) {
                    list = x.items
                    for (var i = 0; i < list.length; i++) {
                        t = list[i].title
                        p = list[i].pubDate
                        l = list[i].link
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result2').append(a + " <br><br>")
                    }
                } //success
            }) //ajax
            //3. 헤럴드 경제 부동산 뉴스
            $.ajax({
                url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fbiz.heraldcorp.com%2Fcommon_prog%2Frssdisp.php%3Fct%3D010300000000.xml',
                data : {
                    url : "http://biz.heraldcorp.com/common_prog/rssdisp.php?ct=010300000000.xml",
                    api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
                    count : 20
                },                      
                success : function(x) {
                    list = x.items
                    for (var i = 0; i < list.length; i++) {
                        t = list[i].title
                        p = list[i].pubDate
                        l = list[i].link
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result3').append(a + " <br><br>")
                    }
                    } //success
            }) //ajax
            //4. 매일경제 부동산 뉴스
            $.ajax({
                url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fnews.mk.co.kr%2Frss%2Fland.xml',
                data : {
                    url : "http://news.mk.co.kr/rss/land.xml",
                    api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
                    count : 20
                },                      
                success : function(x) {
                    list = x.items
                    for (var i = 0; i < list.length; i++) {
                        t = list[i].title
                        p = list[i].pubDate
                        l = list[i].link
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result4').append(a + " <br><br>")
                    }
                    } //success
            }) //ajax
            //5. 닥터 아파트 부동산 뉴스
            $.ajax({
                url : 'https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fwww.drapt.com%2Findex%2Fdrapt_rss2.0.xml&api_key=ejxvkemry0qjivbotntyvygzajjtuawoqoituggy',
                data : {
                    url : "http://www.drapt.com/index/drapt_rss2.0.xml",
                    api_key : "ejxvkemry0qjivbotntyvygzajjtuawoqoituggy",
                    count : 20
                },                      
                success : function(x) {
                    list = x.items
                    for (var i = 0; i < list.length; i++) {
                        t = list[i].title
                        p = list[i].pubDate
                        l = list[i].link
                        a = "<a href= " + l + " target=_blank>" + t + "</a>"
                        $('#result5').append(a + " <br><br>")
                    }
                    } //success
            }) //ajax
    }) //$
</script>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>
	<%
	AptVO vo = (AptVO)request.getAttribute("city");
    String x = " " + vo.getApt_village();
    
    /* 자바에서 사용할 전역변수 선언 */
    int gu = vo.getApt_addrcode();
    
    double sum12=0.0;
    int count12=0;
    double avg12=1000;
    double ppp12=0.0;
    double avgppp12 = 0.0;
    
    double sum11=0.0;
    int count11=0;
    double avg11=1000;
    double ppp11 = 0.0;
    double avgppp11 = 0.0;
    
    double sum10=0.0;
    int count10=0;
    double avg10=1000;
    double ppp10=0.0;
    double avgppp10 = 0.0;
    
    double sum1=0.0;
    int count1=0;
    double avg1=1000;
    double ppp1=0.0;
    double avgppp1=0.0;
	
	%>
<div id="all" style="padding-left: 10%; padding-right: 10%;"> <!-- 부동산 페이지 전체 div -->

<!-- 부동산 api가져오고 parsing -->
<%!public   String getTagValue(String tag, org.w3c.dom.Element eElement) {
	//결과를 저장할 result 변수 선언
	String result = "";
	NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nlList.item(0).getTextContent();
	return result;
} %>
<%!public static String getTagValue(String tag, String childTag, org.w3c.dom.Element eElement) {
    //결과를 저장할 result 변수 선언
    String result = "";
    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
    for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
        result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
    }
    return result;
}
    %>
<!-- 부동산 api가져오고 parsing -->
<div> <!-- 부동산 자료 전체 -->
<div id="chart" style="float: left; width: 50%; height: 700px;"> <!-- 구글차트 들어갈 div 1열 1행-->
<hr color="green">
${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 차트
<hr color="green">
<div id="curve_chart" style="width: 100%; height: 80%;"></div> <!-- js로 그린 구글차트 들어갈 div -->
</div> <!-- 구글차트 들어갈 div 1열 1행-->
<div id="apistart" style="height: 700px; overflow: auto; float: left; width: 50%;"> <!-- api테이블 상위 div -->
<hr color="green">
${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 월별 실거래가
<hr color="green">
<div id="api" style="height: 600px; overflow: auto;"> <!-- api로 가져온 데이터 테이블로 -->
<div id="jan"> <!-- 1월 부동산 자료 -->
<!-- <hr color="green"> -->
1월 ${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 실거래가  
<a href=#none id="show1" onclick="if(d1.style.display=='none') {d1.style.display='';show1.innerText='접기'} 
else {d1.style.display='none';show1.innerText='펼치기'}">펼치기</a>
<br>
<hr color="green">
<%
    //결과를 저장할 result 변수 선언
String key = "JrqNlrVp5feNuizVqC%2FZqxtYlCjg6W5ggf4ig4%2F7RTVcIPN4kIStXkZLvYQBlLmur4fydCzvAHjQHd9SqOM5qA%3D%3D";
String key1 = "KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D";

        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey="+key+"&pageNo=1&numOfRows=100&LAWD_CD="+gu+"&DEAL_YMD=202301";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            org.w3c.dom.Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            %>
            <div id="d1" style="display: none"><!-- 1월부동산데이터 -->
            <table>
            <tr>
            <th width="350px" height="15px" style="text-align: left;">아파트이름</th>
            <th width="180px" height="15px" style="text-align: left;">실거래가(만원)</th>
            <th width="180px" height="15px" style="text-align: left;">거래날짜</th>
            <!-- <th width="100px" height="15px" style="text-align: left;">거래월</th> -->
            <!-- <th width="100px" height="15px" style="text-align: left;">거래일</th> -->
            <th width="80px" height="15px" style="text-align: left;">층</th>
            <th width="100px" height="15px" style="text-align: left;">동</th>
            <th height="15px" style="text-align: left;">전용면적</th>
            </tr>
            <%
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                org.w3c.dom.Element eElement = (org.w3c.dom.Element) nNode;
                %>
                <%
                String b1 = (getTagValue("거래금액", eElement));
                String p1 = (getTagValue("거래금액", eElement));
                String c1 = (getTagValue("아파트", eElement));
                String d1 = (getTagValue("년", eElement));
                String e1 = (getTagValue("월", eElement));
                String f1 = (getTagValue("층", eElement));
                String g1 = (getTagValue("법정동", eElement));
                String h1 = (getTagValue("전용면적", eElement));
                String i1 = (getTagValue("일", eElement));
                %>
                <%
                b1= b1.replace(",", "").trim();
    			int code =Integer.parseInt(b1);
    			
    			double size = Double.parseDouble(h1.trim());
    			
    			double pp = code/size;
    			
                if(g1.equals(x)){
                    sum1=sum1+code;
                    count1++;
                    ppp1=ppp1+pp;
                    %>
                    <tr>
                    <td width="350px" height="40px"><%=c1%></td>
                    <td width="180px" height="40px"><%=p1%></td>
                    <td width="200px" height="40px"><%=d1%>년 <%=e1%>월 <%=i1%>일</td>
                    <%-- <td width="100px" height="40px"><%=e1%></td> --%>
                    <%-- <td width="100px" height="40px"><%=i1%></td> --%>
                    <td width="60px" height="40px"><%=f1%></td>
                    <td width="100px" height="40px"><%=g1%></td>
                    <td width="100px" height="40px"><%=h1%>㎡</td>
					</tr>                    
                    <%
                    }
                    else{
                        continue;
                    }
            }
            avg1=Math.round(sum1/count1);
            avgppp1=Math.round(ppp1/count1);
            %>
            </table>
            </div><!-- 1월부동산데이터 -->
        <br>
        <%
        } catch (Exception e){
            e.printStackTrace();
        }
%>
</div> <!-- 1월 부동산 자료 -->

<div id="dec"> <!-- 12월 부동산 자료 -->
<hr color="green">
12월  ${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 실거래가
<a href=#none id="show12" onclick="if(d12.style.display=='none') {d12.style.display='';show12.innerText='접기'} 
else {d12.style.display='none';show12.innerText='펼치기'}">펼치기</a><br> 
<hr color="green">
<%
        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey="+key+"&pageNo=1&numOfRows=100&LAWD_CD="+gu+"&DEAL_YMD=202212";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            org.w3c.dom.Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            %>
            <div id="d12" style="display: none"><!-- 12월부동산데이터 -->
            <table>
            <tr>
            <th width="350px" height="15px" style="text-align: left;">아파트이름</th>
            <th width="180px" height="15px" style="text-align: left;">실거래가(만원)</th>
            <th width="200px" height="15px" style="text-align: left;">거래날짜</th>
            <!-- <th width="100px" height="15px" style="text-align: left;">거래월</th> -->
            <!-- <th width="100px" height="15px" style="text-align: left;">거래일</th> -->
            <th width="60px" height="15px" style="text-align: left;">층</th>
            <th width="100px" height="15px" style="text-align: left;">동</th>
            <th height="15px" style="text-align: left;">전용면적</th>
            </tr>
            
            <%
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                org.w3c.dom.Element eElement = (org.w3c.dom.Element) nNode;
                %>
                <%
                String b12 = (getTagValue("거래금액", eElement));
                String p12 = (getTagValue("거래금액", eElement));
                String c12 = (getTagValue("아파트", eElement));
                String d12 = (getTagValue("년", eElement));
                String e12 = (getTagValue("월", eElement));
                String f12 = (getTagValue("층", eElement));
                String g12 = (getTagValue("법정동", eElement));
                String h12 = (getTagValue("전용면적", eElement));
                String i12 = (getTagValue("일", eElement));
                %>
                <%
                b12= b12.replace(",", "");
                int code = Integer.parseInt(b12.trim());
				double size = Double.parseDouble(h12.trim());
    			double pp = code/size;

                if(g12.equals(x)){
                	sum12=sum12+code;
                    count12++;
                    ppp12 = ppp12+pp;
                    %>   
                    
                    <tr>
                    <td width="350px" height="40px"><%=c12%></td>
                    <td width="180px" height="40px"><%=p12%></td>
                    <td width="200px" height="40px"><%=d12%>년 <%=e12%>월 <%=i12%>일</td>
                    <%-- <td width="100px" height="40px"><%=e12%></td> --%>
                    <%-- <td width="100px" height="40px"><%=i12%></td> --%>
                    <td width="60px" height="40px"><%=f12%></td>
                    <td width="100px" height="40px"><%=g12%></td>
                    <td width="100px" height="40px"><%=h12%>㎡</td>
                    </tr>
                    <% 
                    }
                    else{ 
                        continue;
                    }
                    
            }
            avg12=Math.round(sum12/count12);
            avgppp12=Math.round(ppp12/count12);
            %> 
            </table>
            </div><!-- 12월부동산데이터 -->
        <br>
        <%
            
            
        } catch (Exception e){
            e.printStackTrace();
        }
%>

</div> <!-- 12월 부동산 자료 -->
<div id="nov"> <!-- 11월 부동산 자료 -->
<hr color="green">
11월  ${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 실거래가 
<a href=#none id="show11" onclick="if(d11.style.display=='none') {d11.style.display='';show11.innerText='접기'} 
else {d11.style.display='none';show11.innerText='펼치기'}">펼치기</a><br>
<hr color="green">
<%
        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey="+key1+"&pageNo=1&numOfRows=100&LAWD_CD="+gu+"&DEAL_YMD=202211";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            org.w3c.dom.Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            %>
            <div id="d11" style="display: none"><!-- 11월부동산데이터 -->
            <table>
            <tr>
            <th width="350px" height="15px" style="text-align: left;">아파트이름</th>
            <th width="180px" height="15px" style="text-align: left;">실거래가(만원)</th>
			<th width="200px" height="15px" style="text-align: left;">거래날짜</th>
            <!-- <th width="100px" height="15px" style="text-align: left;">거래월</th> -->
            <!-- <th width="100px" height="15px" style="text-align: left;">거래일</th> -->
            <th width="60px" height="15px" style="text-align: left;">층</th>
            <th width="100px" height="15px" style="text-align: left;">동</th>
            <th height="15px" style="text-align: left;">전용면적</th>
            </tr>
            
            <%
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                org.w3c.dom.Element eElement = (org.w3c.dom.Element) nNode;
                %>
                <%
                String b11 = (getTagValue("거래금액", eElement));
                String p11 = (getTagValue("거래금액", eElement));
                String c11 = (getTagValue("아파트", eElement));
                String d11 = (getTagValue("년", eElement));
                String e11 = (getTagValue("월", eElement));
                String f11 = (getTagValue("층", eElement));
                String g11 = (getTagValue("법정동", eElement));
                String h11 = (getTagValue("전용면적", eElement));
                String i11 = (getTagValue("일", eElement));
                %>
                <%
                b11= b11.replace(",", "");
                int code = Integer.parseInt(b11.trim());
				double size = Double.parseDouble(h11.trim());
    			double pp = code/size;

                if(g11.equals(x)){
                	sum11=sum11+code;
                    count11++;
                    ppp11 = ppp11+pp;
                    %>   
                    
                    <tr>
                    <td width="350px" height="40px"><%=c11%></td>
                    <td width="180px" height="40px"><%=p11%></td>
                    <td width="200px" height="40px"><%=d11%>년 <%=e11%>월 <%=i11%>일</td>
                    <%-- <td width="100px" height="40px"><%=e11%></td> --%>
                    <%-- <td width="100px" height="40px"><%=i11%></td> --%>
                    <td width="60px" height="40px"><%=f11%></td>
                    <td width="100px" height="40px"><%=g11%></td>
                    <td width="100px" height="40px"><%=h11%>㎡</td>
                    </tr>
                    <% 
                    }
                    else{ 
                        continue;
                    }
                    
            }
            avg11=Math.round(sum11/count11);
            avgppp11=Math.round(ppp11/count11);
            %> 
            </table>
            </div><!-- 11월부동산데이터 -->
        <br>
        <%
            
            
        } catch (Exception e){
            e.printStackTrace();
        }
%>

</div> <!-- 11월 부동산 자료 -->
<div id="oct"> <!-- 10월 부동산 자료 -->
<hr color="green">
10월  ${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 실거래가 
<a href=#none id="show10" onclick="if(d10.style.display=='none') {d10.style.display='';show10.innerText='접기'} 
else {d10.style.display='none';show10.innerText='펼치기'}">펼치기</a><br>
<hr color="green">
<%
        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey="+key1+"&pageNo=1&numOfRows=100&LAWD_CD="+gu+"&DEAL_YMD=202210";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            org.w3c.dom.Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            %>
            <div id="d10" style="display: none"><!-- 10월부동산데이터 -->
            <table>
            <tr>
            <th width="350px" height="15px" style="text-align: left;">아파트이름</th>
            <th width="180px" height="15px" style="text-align: left;">실거래가(만원)</th>
            <th width="200px" height="15px" style="text-align: left;">거래날짜</th>
            <!-- <th width="100px" height="15px" style="text-align: left;">거래월</th> -->
            <!-- <th width="100px" height="15px" style="text-align: left;">거래일</th> -->
            <th width="60px" height="15px" style="text-align: left;">층</th>
            <th width="100px" height="15px" style="text-align: left;">동</th>
            <th height="15px" style="text-align: left;">전용면적</th>
            </tr>
            
            <%
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                org.w3c.dom.Element eElement = (org.w3c.dom.Element) nNode;
                %>
                <%
                String b10 = (getTagValue("거래금액", eElement));
                String p10 = (getTagValue("거래금액", eElement));
                String c10 = (getTagValue("아파트", eElement));
                String d10 = (getTagValue("년", eElement));
                String e10 = (getTagValue("월", eElement));
                String f10 = (getTagValue("층", eElement));
                String g10 = (getTagValue("법정동", eElement));
                String h10 = (getTagValue("전용면적", eElement));
                String i10 = (getTagValue("일", eElement));
                %>
                <%
                b10= b10.replace(",", "");
                int code = Integer.parseInt(b10.trim());
                double size = Double.parseDouble(h10.trim());
    			double pp = code/size;

                if(g10.equals(x)){
                	sum10=sum10+code;
                    count10++;
                    ppp10 = ppp10+pp;
                    %>   
                    <tr>
                    <td width="340px" height="40px"><%=c10%></td>
                    <td width="180px" height="40px"><%=p10%></td>
                    <td width="200px" height="40px"><%=d10%>년 <%=e10%>월 <%=i10%>일</td>
                    <%-- <td width="100px" height="40px"><%=e10%></td> --%>
                    <%-- <td width="100px" height="40px"><%=i10%></td> --%>
                    <td width="60px" height="40px"><%=f10%></td>
                    <td width="100px" height="40px"><%=g10%></td>
                    <td width="100px" height="40px"><%=h10%>㎡</td>
                    </tr>
                    <% 
                    }
                    else{ 
                        continue;
                    }
                    
            }
            avg10=Math.round(sum10/count10);
            avgppp10=Math.round(ppp10/count10);
            %> 
            </table>
            </div><!-- 10월부동산데이터 -->
        <br>
        <%
        } catch (Exception e){
            e.printStackTrace();
        }
%>
</div> <!-- 10월 부동산 자료 -->
</div> <!-- api로 가져온 데이터 테이블로 -->
</div> <!-- api테이블 상위 div -->
</div> <!-- 부동산 자료 전체 -->

<%
if(avg1 == 0){
	avg1 = avg12;
}
if(avg12 == 0){
	avg12 = avg11;
}
if(avg11 == 0){
	avg11 = avg10;
}
if(avgppp1 == 0){
	avgppp1 = avgppp12;
}
if(avgppp12 == 0){
	avgppp12 = avgppp11;
}
if(avgppp11 == 0){
	avgppp11 = avgppp10;
}

%>

<hr color="blue">

<div id="news"> <!-- 부동산 뉴스 전체 div -->
<div id="totalnews" style=" float: left; width: 45%;"> <!-- rss로 가져온 뉴스 div -->
<hr color="green">
<span style="color: red; font-size: 50px;">전국부동산뉴스</span>
<div id="rsstable" style="height: 1000px; overflow: auto;"> <!-- rss로 가져온 뉴스를 table로 만듬 -->
<table>
<tr>
	<th> <h2>e데일리 <a href=#none id="news1" onclick="if(result1.style.display=='none') {result1.style.display='';news1.innerText='접기'}
	else {result1.style.display='none';news1.innerText='펼치기'}">펼치기</a></h2></th>
</tr>
<tr>
	<td><div id="result1" style="display: none;"></div></td>
</tr>
<tr>
	<th><h2>mbn <a href=#none id="news2" onclick="if(result2.style.display=='none') {result2.style.display='';news2.innerText='접기'}
	else {result2.style.display='none';news2.innerText='펼치기'}">펼치기</a></h2></th>
</tr>
<tr>
    <td><div id="result2" style="display: none;"></div></td>
</tr>
<tr>
	<th><h2>헤럴드경제 <a href=#none id="news3" onclick="if(result3.style.display=='none') {result3.style.display='';news3.innerText='접기'}
	else {result3.style.display='none';news3.innerText='펼치기'}">펼치기</a></h2></th>
</tr>
<tr>
    <td><div id="result3" style="display: none;"></div></td>
</tr>
<tr>
	<th><h2>매일경제 <a href=#none id="news4" onclick="if(result4.style.display=='none') {result4.style.display='';news4.innerText='접기'}
	else {result4.style.display='none';news4.innerText='펼치기'}">펼치기</a></h2></th>
</tr>
<tr>
    <td><div id="result4" style="display: none;"></div></td>
</tr>
<tr>
	<th><h2>닥터아파트 <a href=#none id="news5" onclick="if(result5.style.display=='none') {result5.style.display='';news5.innerText='접기'}
	else {result5.style.display='none';news5.innerText='펼치기'}">펼치기</a></h2></th>
</tr>
<tr>
   <td> <div id="result5" style="display: none;"></div></td>
</tr>
</table>
</div> <!-- rss로 가져온 뉴스를 table로 만듬 -->

</div> <!-- rss로 가져온 뉴스 div -->


<div id="subnews" style=" float: right; width: 50%;"> <!-- 크롤링으로 가져온 지역뉴스 div -->
<hr color="green">
<span style="color: red; font-size: 50px;">${city.apt_city} 부동산 뉴스</span> <br>
				<c:choose>
					<c:when test="${city.apt_city eq '부산광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2600000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '경기도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4100000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '인천광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2800000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '대전광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3000000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '충청북도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4300000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '서울특별시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=1100000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '충청남도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4400000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '광주광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2900000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '전라남도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4600000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '울산광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3100000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '전라북도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4500000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '제주특별자치도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=5000000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '경상북도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4700000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '경상남도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4800000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '강원도'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=4200000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '대구광역시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=2700000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
					<c:when test="${city.apt_city eq '세종특별자치시'}">
						<%
							Document doc2 = Jsoup.connect("https://land.naver.com/news/region.naver?city_no=3600000000&dvsn_no=").get();
						Elements posts = doc2.body().getElementsByClass("section_headline");
						Elements file = posts.select("dt");
						for (Element e : file) {
							out.println("<a href=https://land.naver.com/" + e.select("a").attr("href").substring(1, 64) + " target='_blank'>"
							+ e.select("a").text() + "</a> <br>");
						}
						%>
					</c:when>
				</c:choose>
			</div> <!-- 크롤링으로 가져온 지역뉴스 div -->
</div> <!-- 부동산 뉴스 전체 div -->
</div> <!-- 부동산 페이지 전체 div -->
</body>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([

		[ '거래일', '실거래가(만원)', '전용면적당(㎡)실거래가(만원)' ], 
		[ "2022년 10월", <%=avg10%>, <%=avgppp10%> ],
		[ "2022년 11월", <%=avg11%>, <%=avgppp11%> ], 
		[ "2022년 12월", <%=avg12%>, <%=avgppp12%> ],
		[ "2023년 1월", <%=avg1%>, <%=avgppp1%> ], ]);
		
		var options = {
				
			hAxis : {
				showTextEvery : 1
			},
			vAxes : {
				0 : {
					viewWindowMode : 'explicit',
					gridlines : {
						color : 'gray'
					},
				},
				1 : {
					gridlines : {
						color : 'none'
					},
				},
			},
			series : {
				0 : {
					targetAxisIndex : 0
				},
				1 : {
					targetAxisIndex : 1
				}
			},
			colors : [ "red", "green" ],

			title : '${city.apt_city} ${city.apt_town} ${city.apt_village} 아파트 실거래가',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};
		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));
		chart.draw(data, options);
	}
</script>
</html>