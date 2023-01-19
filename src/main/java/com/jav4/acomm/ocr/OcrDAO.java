package com.jav4.acomm.ocr;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OcrDAO implements OcrDAOInter  {

	@Autowired
	SqlSessionTemplate my;
	
		
	// 사진으로 온 값 추출해서 DB와 비교
	@Override
	public boolean ocrlist(OcrVO vo) {
		List<OcrVO> list = my.selectList("bbs.ocr",vo); 
		if (list.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}
	
	
}
