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

	
	
	public String ocr() {
		String apiURL = NaverVISIONAPI.OCR_URL;
		String secretKey = NaverVISIONAPI.SECRECT_KEY;
//		String imageFile = "id_card.jpg";
//		String imageFile = "dl_hwi.jpg";
		String imageFile = "D:\\Hwidong\\back-end_edu\\final-workspace\\Acomm\\id_hwi.jpg";
//		String imageFile = "id_woo.jpg";
//		String imageFile = "id2.jpg";
//		String imageFile = "dl_young.jpg";

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
			System.out.println("레즈폰스 코드는 >> " + responseCode);
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
//				if (inferText2.length() > 3 && inferText2.length() < 6) {
					list.add(inferText);
//				}
			}
			System.out.println();
			System.out.println("ocr_result>> " + list);
			return "success";
		} catch (Exception e) {
			System.out.println(e);
		}
			return "fail";
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
