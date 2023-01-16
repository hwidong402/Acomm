package com.jav4.acomm.member;

import java.util.List;

import com.jav4.acomm.apt.AptVO;

public interface MemberDAOInter {

	MemberVO one(MemberVO vo);

	//현재 내 정보값을 dao에서 부릅니다.
	// namespace= member // id=print
	MemberVO print(MemberVO vo);

	//관리자가 회원정보를 볼 때 실행되는 all함수
	// namespace= member // id=all
	List<MemberVO> all(MemberVO vo);

	// 회원가입에 입력했던 정보를 insert로 넣음 return값 없음
	// namespace= member // id=create
	void insert(MemberVO vo);

	void delete(MemberVO vo);

	// 개인정보 수정할 때 실행되는 update문
	// namespace= member // id=up
	void update(MemberVO vo);

	// 아이디와 비밀번호가 일치한 한 맴버에 대한 칼럼 모두 줌
	// namespace= member // id=login
	MemberVO login(MemberVO vo);

	AptVO code2name(MemberVO vo);

	// 아이디 중복검사하러 DB를 뒤져봅시다.
	MemberVO idck(MemberVO vo);

	// 닉네임 중복검사하러 DB를 뒤져봅시다.
	MemberVO nickck(MemberVO vo);

	int upstop(MemberVO vo);

}