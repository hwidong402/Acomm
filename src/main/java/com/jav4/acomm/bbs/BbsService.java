package com.jav4.acomm.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService {

	@Autowired
	BbshotDAO dao;
	
	// 전체 검색
	public List<BbsVO> list(BbsVO vo) {
		 return dao.list(vo);
	}
	
	// 조회수
	public void bbsCount(int bbs_id) {
		dao.bbsCount(bbs_id);
	}
	
	// 하나 상세 검색
	public BbsVO one(BbsVO vo) {
		return dao.one(vo);
	}
	
//	// bbs 좋아요
//	public void bbslike(LikeVO vo) {
//		dao.bbshotlike(vo);
//	}
	
	// 통합 테이블 좋아요 추가
	public void bbslike(BbslikeVO vo) {
		dao.bbslike(vo);
	}
	
}
