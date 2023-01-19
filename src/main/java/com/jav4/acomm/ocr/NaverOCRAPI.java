package com.jav4.acomm.ocr;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

public class NaverOCRAPI {

	
	
	public OcrVO ocr(String savedName) {
		String apiURL = NaverVISIONAPI.OCR_URL;
		String secretKey = NaverVISIONAPI.SECRECT_KEY;
//		String imageFile = "id_card.jpg";
//		String imageFile = "dl_hwi.jpg";
//		String imageFile = "id_hwi.jpg";
//		String imageFile = "id_woo.jpg";
//		String imageFile = "id2.jpg";
		String imageFile = "D:\\Hwidong\\back-end_edu\\final-workspace\\Acomm\\src\\main\\webapp\\resources\\img\\" + savedName;
		System.out.println("받아온 파일 >> " + savedName);
		try {
			URL url = new URL(apiURL);
			// 연결설정
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			// long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

////////////////////////////////////////////////////////////////////////////////////////////////////
			System.out.println(response);
			JSONParser parser = new JSONParser();
			org.json.simple.JSONObject jsonResult2 = (org.json.simple.JSONObject) parser.parse(response.toString());

			// images key의 value가 array!!
			org.json.simple.JSONArray images2 = (org.json.simple.JSONArray) jsonResult2.get("images");

			// array중에서 첫번째 index추출!!
			org.json.simple.JSONObject imageOne = (org.json.simple.JSONObject) images2.get(0);

			// field키의 value가 array!!
			org.json.simple.JSONArray fields = (org.json.simple.JSONArray) imageOne.get("fields");
			ArrayList<String> list = new ArrayList<>();
			for (int i = 0; i < fields.size(); i++) {
				org.json.simple.JSONObject fields_one = (org.json.simple.JSONObject) fields.get(i);
				String inferText = (String) fields_one.get("inferText");
				System.out.println(inferText + " ");
//				String inferText2 = inferText.replaceAll("[^0-9]", ""); //숫자 0-9을 제외한 문자는 공백으로 대체
//				String inferText2 = inferText.substring(inferText.indexOf(",")); // , 밑으로 문자열 제거
//				String inferText2 = inferText.substring(0, inferText.indexOf(",") + 1);
//				System.out.println("추출된 인덱스는 " + inferText2);
//				if (inferText2.length() > 3 && inferText2.length() < 6) {
				list.add(inferText);
//				}
			}
			
			String name = list.get(0);
			String list_addr = list.get(1);
			System.out.println();
			System.out.println("괄호가 포함이 되어있습니까? >> " + name.contains("("));
			
			
			// 1번째 인덱스 추출
			if (name.contains("(")) {
				name = name.substring(0, list.get(0).indexOf("("));
			}
			
			if (name.contains(" ")) {
				name = name.substring(list.get(0).indexOf(" ")).replace(" ", "");
			}
			
			// 2번째 인덱스 추출
			if (list.get(1).contains(",")) {
				list_addr = list_addr.substring(0, list.get(1).indexOf(","));
			}
			String[] str = list_addr.split("\n");
			String str2 = String.join("", str);
			String addr = str2.replace(" ", "");
			
			
			System.out.println();
			System.out.println("추출된 이름은 \n" + name);
			System.out.println("추출된 주소는 \n" + list_addr);
			System.out.println("줄바꿈 추출 >> " + str[0]);
			System.out.println("줄바꿈 추출 >> " + str[1]);
			System.out.println("배열을 스트링으로 >> " + str2);
			System.out.println("공백제거 스트링으로 >> " + addr);
			
//			System.out.println();
//			System.out.println("ocr_result>> " + list);
			
			OcrVO vo = new OcrVO();
			vo.setApt_subaddr(addr);
			vo.setMember_name(name);
			System.out.println("성공했을때 vo >> " + vo);
			
			return vo;
			
		} catch (Exception e) {
			System.out.println(e);
			OcrVO vo = new OcrVO();
			System.out.println("실패했을때 vo >> " +vo);
			return vo;
		}
	}
	
	
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
	

}
