package com.jav4.acomm.apt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AptService {
	
	@Autowired
	AptDAO dao;
	//index 아파트 전체 검색
	public List<AptVO> all(AptVO vo) { 
		return dao.readall(vo);
	}
	//회원가입 아파트 전체 검색
	public List<AptVO> code(AptVO vo) {
		return dao.readcode(vo);
	}
	
}
