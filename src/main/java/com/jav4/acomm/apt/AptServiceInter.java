package com.jav4.acomm.apt;

import java.util.List;

public interface AptServiceInter {

	//index 아파트 전체 검색
	List<AptVO> all(AptVO vo);

	//회원가입 아파트 전체 검색
	List<AptVO> code(AptVO vo);

}