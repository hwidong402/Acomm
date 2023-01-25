package com.jav4.acomm.bbs;

import java.util.List;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

public interface BbsServiceTInter {

	// apt * by apt_code
	AptVO aptAll(AptVO avo);

	// member * by member_code
	MemberVO memberAll(MemberVO mvo);

	// bbs의 전체 게시판 보기
	List<BbsVO> getList5(BbsVO vo);

	// cate별로 상세 게시판 보기
	List<BbsVO> getListCate(BbsVO bvo);

	//
	MemberVO id2cls(MemberVO mvo);

	//
	BbsVO getBbsPost(BbsVO vo);

	//
	void insertPost(BbsVO vo);

	//
	void updatePost(BbsVO vo);

	//
	void deletePost(BbsVO vo);

}