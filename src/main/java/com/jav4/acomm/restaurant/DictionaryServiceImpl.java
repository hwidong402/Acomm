package com.jav4.acomm.restaurant;

import java.io.BufferedReader;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

@Service
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	DictionaryDAO dictionaryDAO;

	@Override
	public int emotion(String sentence) {
		
		Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
		
		KomoranResult komoranResult = komoran.analyze(sentence); // 단어 분석 결과
		String[] sentences = sentence.split(" ");
		List<String> list2=Arrays.asList(sentences);
		List<String> nounList = komoranResult.getNouns(); // 명사 목록만 추출
		List<Token> list = komoranResult.getTokenList(); //  목록만 추출
		System.out.println(list);
		nounList.addAll(list2);
		System.out.println(nounList);
		
		System.out.println();

		//stopWords만들기 
		HashSet<String> stopWords = new HashSet<>();
		//file 1byte inputstreamreader 1 to 2 byte  bufferedreader 2byte
		try {
			BufferedReader buffer = new BufferedReader(new InputStreamReader(new FileInputStream(
					"data/stop.txt")));
			String line = null;
			// System.out.println(buffer.readLine());
			while ((line = buffer.readLine()) != null) {
				if (line.trim().length() > 0) {
					stopWords.add(line.trim());
				}
			}
		} catch (Exception e) {
		}
		System.out.println(stopWords); //stopWords프린트 
		System.out.println(stopWords.size());
		
		//금칙어 제외처리
		List<String> nounList2 = new ArrayList<String>(); //stopwords 뺀 명사목록
		for (String s : nounList) {
			if(stopWords.contains(s)) {
				continue;
			}
			nounList2.add(s);
		}
		//금칙어 제외된 명사목록 
		System.out.println(nounList2);
		
		int sum = 0;
		for (String word : nounList2) {
			DictionaryVO vo = dictionaryDAO.one(word);
			System.out.println("---- " + vo);
			if(vo != null) { //사전에 없는 단어일수도 있으므로 
				sum += vo.getJumsu();
			}
		}
		
		System.out.println("긍부정 점수 >> " + sum);
		int result = 1;
		if(sum < 0) {
			result = 0;
		}
		return result;
	}
}