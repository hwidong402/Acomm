package com.jav4.acomm.bbs;

import java.util.List;

public interface BbsServiceInter {

	// 인기게시글 5개만 검색
	List<BbsVO> list(BbsVO vo);

	// 인기게시글 전체 검색
	List<BbsVO> listAll(BbsVO vo);

	// 조회수
	void bbsCount(int bbs_id);

	// 하나 상세 검색
	BbsVO one(BbsVO vo);

	// 통합 테이블 좋아요 추가
	void bbslike(BbslikeVO vo);

	// 통합 테이블 좋아요 취소
	void bbslikedel(BbslikeVO vo);

	// bbs_id와 member_code가 일치하는 테이블 전체검색
	List<BbslikeVO> hotlist(BbslikeVO vo);

	// bbs_id와 member_code가 일치하는 테이블 하나검색
	BbslikeVO bbslikeone(BbslikeVO vo);

}