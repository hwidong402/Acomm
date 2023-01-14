package com.jav4.acomm.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService {

	@Autowired
	BbshotDAO dao;
	
	// 인기게시글 5개만 검색
	public List<BbsVO> list(BbsVO vo) {
		 return dao.list(vo);
	}
	
	// 인기게시글 전체 검색
	public List<BbsVO> listAll(BbsVO vo) {
		return dao.listAll(vo);
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
	
	// 통합 테이블 좋아요 취소
	public void bbslikedel(BbslikeVO vo) {
//		BbslikeVO one = dao.bbslikeone(vo);
		dao.bbslikedel(vo);
//		return one;
	}
	
	// bbs_id와 member_code가 일치하는 테이블 전체검색
	public List<BbslikeVO> hotlist(BbslikeVO vo) {
		 return dao.hotlist(vo);
	}
	
	// bbs_id와 member_code가 일치하는 테이블 하나검색
	public BbslikeVO bbslikeone(BbslikeVO vo) {
		return dao.bbslikeone(vo);
	}
}
