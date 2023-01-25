package com.jav4.acomm.bbs;

import java.util.List;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

public interface BbsDAOInter {

	// bbs의 전체 게시판 보기*
	// cate별로 list를 최신 5개씩 들고와서 넘겨줌 
	List<BbsVO> getList5(BbsVO vo);

	// cate별로 상세 게시판 보기*
	// 세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시글 목록 들고오기
	List<BbsVO> getListCate(BbsVO vo);

	// apt * by apt_code*
	AptVO aptAll(AptVO avo);

	//	member * by member_code*
	MemberVO memberAll(MemberVO mvo);

	// noti write버튼 admin 필터링
	// id로 cls 확인
	MemberVO id2cls(MemberVO mvo);

	// 게시글 보기
	// <a href>의 bbs_id로 게시글 정보 가져오기
	BbsVO getBbsPost(BbsVO vo);

	// 게시글 작성 
	void insertPost(BbsVO vo);

	// 게시글 수정
	// id로 게시글 검색하여 게시글의 content 값 수정하기
	void updatePost(BbsVO vo);

	// 게시글 삭제
	// id로 게시글 검색하여 게시글삭제
	void deletePost(BbsVO vo);

}