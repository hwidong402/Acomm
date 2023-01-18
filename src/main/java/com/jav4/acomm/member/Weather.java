package com.jav4.acomm.member;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.management.modelmbean.XMLParseException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;

public class Weather {
		public String getWeather() throws Exception{
//    	public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=y0noidy96H9dVgR4ObeTOM1Mn5ubh1oCd7%2FBuQwR0dLAdCtZCsfS615cCIPBvnhI5s8rh2i6LopAgmQG4iQ54w%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode("20230117", "UTF-8")); /*‘23년 1월 17일 발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0600", "UTF-8")); /*06시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("98", "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("76", "UTF-8")); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        String result= sb.toString();
        
        System.out.println(result);

        // 문자열 Document 로 변경해서 List 형태로 가져와서 객체에 파싱함.
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        InputSource is = new InputSource(new StringReader(result));
        Document document = db.parse(is);

            document.getDocumentElement().normalize();
            System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
            NodeList nList = document.getElementsByTagName("item");
            System.out.println("--------------------------");
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                // 현재 Element 확인하려면 아래 주석 해제
//                System.out.println("\nCurrent Element :" + nNode.getNodeName());
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;

                    String category = eElement.getElementsByTagName("category").item(0).getTextContent();
                    double value = Double.parseDouble(eElement.getElementsByTagName("obsrValue").item(0).getTextContent());

//                    WeatherValue weatherValue = WeatherValue.valueOf(category);
//                    // 변환한 값이 몇번째인지 확인하려면 아래 주석 해제
////                    System.out.println(WeatherValue.valueOf(category).ordinal());
//
//                    switch (weatherValue) {
//                        case PTY:
//                            weather.setPTY(value);
//                            break;
//                        case REH:
//                            weather.setREH(value);
//                            break;
//                        case RN1:
//                            weather.setRN1(value);
//                            break;
//                        case T1H:
//                            weather.setT1H(value);
//                            break;
//                        case UUU:
//                            weather.setUUU(value);
//                            break;
//                        case VEC:
//                            weather.setVEC(value);
//                            break;
//                        case VVV:
//                            weather.setVVV(value);
//                            break;
//                        case WSD:
//                            weather.setWSD(value);
//                            break;
//                        default:
//                            throw new XMLParseException();
//                    }
                }
            }
			return result;

//            System.out.println(weather.toString());
       
    }
}