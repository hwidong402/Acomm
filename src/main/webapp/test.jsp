<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['년/월', '실거래가', '거래량'],
    ['2022년 09월',  2200, 20],
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
<div id="yagada1">
<hr color="green">
12월 해운대구 실거래가 
<hr color="green">
<%!public static String getTagValue(String tag, Element eElement) {
    //결과를 저장할 result 변수 선언
String result = "";
NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
result = nlList.item(0).getTextContent();
return result;
} %>
<%!public static String getTagValue(String tag, String childTag, Element eElement) {
    //결과를 저장할 result 변수 선언
    String result = "";
    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
    for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
        //result += nlList.item(i).getFirstChild().getTextContent() + " ";
        result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
    }
    return result;
}
    %>
<%
    //결과를 저장할 result 변수 선언
String key = "KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D";
        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D&pageNo=1&numOfRows=100&LAWD_CD=26350&DEAL_YMD=202212";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                Element eElement = (Element) nNode;
                %>
                <%-- <input value="<%=getTagValue("일련번호", eElement)%>"> --%>
                <%
                //String a = ("일련번호:"  +"\n");
                // String b = (getTagValue("거래금액", eElement));
                String b = (getTagValue("거래금액", eElement));
                String c = (getTagValue("아파트", eElement));
                String d = (getTagValue("년", eElement));
                String e = (getTagValue("월", eElement));
                String f = (getTagValue("층", eElement));
                String g = (getTagValue("법정동", eElement));
                String h = (getTagValue("전용면적", eElement));
                String i = (getTagValue("일", eElement));
                %>
                <%
                //out.println(b);
                b= b.replace(",", "");
                //System.out.println(g);
                //int k= Integer.parseInt(b);
                //out.println(k);
                //out.print(a);
                
                if(g.equals(" 우동")){
                	
               
                out.println("아파트 이름: "+c+"/");
                out.println("실거래가: " + b + "만원/");
                out.println("거래년: " + d+"/");
                out.println("거래월 : " + e+"/");
                out.println("거래일 : " + i+"/");
                out.println("층: " + f+"/");
                //if(g == "우동"){
                out.println("동: " + g+"/");
                //}
                out.println("전용면적: " + h + "㎡");
                }else{
                	continue;
                }
                %> <br>
                <%
            }
        } catch (Exception e){
            e.printStackTrace();
        }
%>
</div>
<div id="yagada2">
<hr color="green">
11월 해운대구 실거래가 
<hr color="green">
<%
        try{
            // parsing할 url 지정(API 키 포함해서)
            String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D&pageNo=1&numOfRows=100&LAWD_CD=26350&DEAL_YMD=202211";
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("item");
            for(int temp = 0; temp < nList.getLength(); temp++){
                Node nNode = nList.item(temp);
                Element eElement = (Element) nNode;
                %>
                <%-- <input value="<%=getTagValue("일련번호", eElement)%>"> --%>
                <%
                String a = ("일련번호:"  +"\n");
               // String b = (getTagValue("거래금액", eElement));
                String b = (getTagValue("거래금액", eElement));
                String c = (getTagValue("아파트", eElement));
                String d = (getTagValue("년", eElement));
                String e = (getTagValue("월", eElement));
                String f = (getTagValue("층", eElement));
                String g = (getTagValue("법정동", eElement));
                String h = (getTagValue("전용면적", eElement));
                String i = (getTagValue("일", eElement));
                %>
                <%
                //out.println(b);
                b= b.replace(",", "");
                //System.out.println(g);
                //int k= Integer.parseInt(b);
                //out.println(k);
                //out.print(a);
                
                if(g.equals(" 우동")){
                	
               
                out.println("아파트 이름: "+c+"/");
                out.println("실거래가: " + b + "만원/");
                out.println("거래년: " + d+"/");
                out.println("거래월 : " + e+"/");
                out.println("거래일: " + i + "/");
                out.println("층: " + f+"/");
                //if(g == "우동"){
                out.println("동: " + g+"/");
                //}
                out.println("전용면적: " + h + "㎡");
                }else{
                	continue;
                }
                %> <br>
                <%
            }
        } catch (Exception e){
            e.printStackTrace();
        }
%>
</div>
<div id="yagada3">
<hr color="green">
10월 해운대구 실거래가 
<hr color="green">
<%
try{
    // parsing할 url 지정(API 키 포함해서)
    String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D&pageNo=1&numOfRows=100&LAWD_CD=26350&DEAL_YMD=202210";
    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
    Document doc = dBuilder.parse(url);
    // 제일 첫번째 태그
    doc.getDocumentElement().normalize();
    // 파싱할 tag
    NodeList nList = doc.getElementsByTagName("item");
    for(int temp = 0; temp < nList.getLength(); temp++){
        Node nNode = nList.item(temp);
        Element eElement = (Element) nNode;
        %>
        <%-- <input value="<%=getTagValue("일련번호", eElement)%>"> --%>
        <%
        String a = ("일련번호:"  +"\n");
       // String b = (getTagValue("거래금액", eElement));
        String b = (getTagValue("거래금액", eElement));
        String c = (getTagValue("아파트", eElement));
        String d = (getTagValue("년", eElement));
        String e = (getTagValue("월", eElement));
        String i = (getTagValue("일", eElement));
        String f = (getTagValue("층", eElement));
        String g = (getTagValue("법정동", eElement));
        String h = (getTagValue("전용면적", eElement));
        %>
        <%
        //out.println(b);
        b= b.replace(",", "");
        //System.out.println(g);
        //int k= Integer.parseInt(b);
        //out.println(k);
        //out.print(a);
        
        if(g.equals(" 우동")){
        	
       
        out.println("아파트 이름: "+c+"/");
        out.println("실거래가: " + b + "만원/");
        out.println("거래년: " + d+"/");
        out.println("거래월 : " + e+"/");
        out.println("거래일 : " + i+"/");
        out.println("층: " + f+"/");
        //if(g == "우동"){
        out.println("동: " + g+"/");
        //}
        out.println("전용면적: " + h + "㎡");
        }else{
        	continue;
        }
        %> <br>
        <%
    }
} catch (Exception e){
    e.printStackTrace();
}
%>
</div>
<div id="yagada4">
<hr color="green">
9월 해운대구 실거래가 
<hr color="green">
<%
try{
    // parsing할 url 지정(API 키 포함해서)
    String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D&pageNo=1&numOfRows=100&LAWD_CD=26350&DEAL_YMD=202209";
    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
    Document doc = dBuilder.parse(url);
    // 제일 첫번째 태그
    doc.getDocumentElement().normalize();
    // 파싱할 tag
    NodeList nList = doc.getElementsByTagName("item");
    for(int temp = 0; temp < nList.getLength(); temp++){
        Node nNode = nList.item(temp);
        Element eElement = (Element) nNode;
        %>
        <%-- <input value="<%=getTagValue("일련번호", eElement)%>"> --%>
        <%
        String a = ("일련번호:"  +"\n");
       // String b = (getTagValue("거래금액", eElement));
        String b = (getTagValue("거래금액", eElement));
        String c = (getTagValue("아파트", eElement));
        String d = (getTagValue("년", eElement));
        String e = (getTagValue("월", eElement));
        String i = (getTagValue("일", eElement));
        String f = (getTagValue("층", eElement));
        String g = (getTagValue("법정동", eElement));
        String h = (getTagValue("전용면적", eElement));
        %>
        <%
        //out.println(b);
        b= b.replace(",", "");
        //System.out.println(g);
        //int k= Integer.parseInt(b);
        //out.println(k);
        //out.print(a);
        
        if(g.equals(" 우동")){
        	
       
        out.println("아파트 이름: "+c+"/");
        out.println("실거래가: " + b + "만원/");
        out.println("거래년: " + d+"/");
        out.println("거래월 : " + e+"/");
        out.println("거래일 : " + i+"/");
        out.println("층: " + f+"/");
        //if(g == "우동"){
        out.println("동: " + g+"/");
        //}
        out.println("전용면적: " + h + "㎡");
        }else{
        	continue;
        }
        %> <br>
        <%
    }
} catch (Exception e){
    e.printStackTrace();
}
%>
</div>

<div id="chart" >
<hr color="green">
<div id="curve_chart" style="width: 900px; height: 500px"></div>
</div>
</body>
</html>