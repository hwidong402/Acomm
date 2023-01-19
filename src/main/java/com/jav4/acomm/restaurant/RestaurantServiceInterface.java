package com.jav4.acomm.restaurant;

import java.util.List;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

public interface RestaurantServiceInterface {

	//레스토랑 리스트 검색
	List<RestaurantVO> list();

	//레스토랑 하나 검색
	RestaurantVO one(RestaurantVO vo);

	// restaurant 등록 메써드
	boolean insert(RestaurantVO vo);

	//페이지 로드용 member 정보 검색
	//member_code로 member 정보 가져오기
	MemberVO idck(MemberVO vo);

	//member정보로 apt 정보 불러오기
	AptVO code2name(MemberVO vo);

	//restaurant reply 관련 메써드
	//레스토랑별 후기 목록 검색
	List<RestReplyVO> list(RestReplyVO vo);

	//상가 후기 insert 
	boolean insert(RestReplyVO vo);

	//후기 삭제
	boolean delete(RestReplyVO vo);

	//나의 후기 검색
	RestReplyVO myreview(RestReplyVO vo);

	//다른사람 후기 검색
	List<RestReplyVO> otherreview(RestReplyVO vo);

	//긍정 후기 검색 메써드
	List<RestReplyVO> posreview(RestReplyVO vo);

	//부정 후기 검색 메써드
	List<RestReplyVO> negreview(RestReplyVO vo);

}