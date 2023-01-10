package com.jav4.acomm.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbshotDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	//실험용 리스트 내용전체 다들고오기
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.bbshotall",vo);
		return list;
	}
	
	// 게시글 하나검색
	public BbsVO one(BbsVO vo) {
		BbsVO one = my.selectOne("bbs.bbshotone", vo);
		return one;
	}
	
	// 조회수 카운트
	public void bbsCount(int bbs_id) {
		// int count = my.update("bbs.bbshotup", bbs_id);
		my.update("bbs.bbshotup", bbs_id);
		// return count;
	}
	
//	// bbs 테이블에 좋아요 추가
//	public void bbshotlike(LikeVO vo) {
//		System.out.println("DAO syso ------- " + vo);
//		my.update("bbs.bbshotlike", vo);
//	}
	
	// 통합 테이블에 좋아요 추가
	public void bbslike(BbslikeVO vo) {
//		BbslikeVO one = my.selectOne("bbs.bbslikeone", vo);
		my.insert("bbs.bbslike", vo);
//		return one;
	}
	
	// 좋아요 취소
	public void bbslikedel(BbslikeVO vo) {
//		BbslikeVO one = my.selectOne("bbs.bbslikeone", vo);
		my.delete("bbs.bbslikedel", vo);
//		return one;
	}
	
	// bbs_id와 member_code가 일치하는 테이블 전체검색
	public List<BbslikeVO> hotlist(BbslikeVO vo) {
		List<BbslikeVO> list = my.selectList("bbs.likeall",vo);
		return list;
	}
	
	// bbs_id와 member_code가 일치하는 테이블 하나검색
	public BbslikeVO bbslikeone(BbslikeVO vo) {
		return my.selectOne("bbs.bbslikeone", vo);
	}
}
