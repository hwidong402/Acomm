package com.jav4.acomm.ocr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OcrService implements OcrServiceinter {

	@Autowired
	OcrDAOInter dao;
	
	// 사진으로 온 값 추출해서 DB와 비교
	@Override
	public boolean ocrlist(OcrVO vo) {
		boolean rs = dao.ocrlist(vo);
		if (rs) {
			int result = dao.ocrup(vo);
			return true;
		} else {
			return false;
		}
	}
	
	
}
