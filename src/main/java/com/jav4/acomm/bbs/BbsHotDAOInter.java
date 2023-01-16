package com.jav4.acomm.bbs;

import java.util.List;

public interface BbsHotDAOInter {

	// 인기 게시글 리스트 내용 5개만 들고오기
	List<BbsVO> list(BbsVO vo);

	// 인기 게시글 리스트 내용 전체 다들고오기
	List<BbsVO> listAll(BbsVO vo);

	// 게시글 하나검색
	BbsVO one(BbsVO vo);

	// 조회수 카운트
	void bbsCount(int bbs_id);

	// 통합 테이블에 좋아요 추가
	void bbslike(BbslikeVO vo);

	// 좋아요 취소
	void bbslikedel(BbslikeVO vo);

	// bbs_id와 member_code가 일치하는 테이블 전체검색
	List<BbslikeVO> hotlist(BbslikeVO vo);

	// bbs_id와 member_code가 일치하는 테이블 하나검색
	BbslikeVO bbslikeone(BbslikeVO vo);

}