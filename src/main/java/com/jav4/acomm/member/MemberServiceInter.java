package com.jav4.acomm.member;

import java.util.List;

import com.jav4.acomm.apt.AptVO;

public interface MemberServiceInter {

	// 회원가입 버튼 누를 시 실행
	void insert(MemberVO vo);

	// local 페이지에서 내 정보로 이동하여 개인정보를 수정하는 버튼을 눌릴 때 실행
	void update(MemberVO vo);

	// 맴버에 대한 전체 값
	MemberVO print(MemberVO vo);

	// 회원탈퇴 시 member_nick을 제외하고 모두 사용불가능하게 변경
	void delete(MemberVO vo);

	MemberVO one(MemberVO vo);

	// member의 전체칼럼
	MemberVO login(MemberVO vo);

	// member의 이름
	AptVO code2name(MemberVO vo);

	// 중복확인
	MemberVO idck(MemberVO vo);

	//중복확인
	MemberVO nickck(MemberVO vo);

	//관리자 권한으로 회원정보 가져오기
	List<MemberVO> all(MemberVO vo);

}