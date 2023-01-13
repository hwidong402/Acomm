package com.jav4.acomm.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	// 회원가입 버튼 누를 시 실행
	public void insert(MemberVO vo) {
		dao.insert(vo);
	}

	// local 페이지에서 내 정보로 이동하여 개인정보를 수정하는 버튼을 눌릴 때 실행
	public void update(MemberVO vo) {
		dao.update(vo);
	}

	// 맴버에 대한 전체 값
	public MemberVO print(MemberVO vo) {
		return dao.print(vo);
	}

	public MemberVO one(MemberVO vo) {
		return dao.one(vo);
	}

	// member의 전체칼럼
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	// member의 이름
	public AptVO code2name(MemberVO vo) {
		return dao.code2name(vo);
	}
	// 중복확인
	public MemberVO idck(MemberVO vo) {
		return dao.idck(vo);
	}
	
	//중복확인
	public MemberVO nickck(MemberVO vo) {
    	return dao.nickck(vo);
    }
	
	//관리자 권한으로 회원정보 가져오기
	public List<MemberVO> all(MemberVO vo) {
        return dao.all(vo);
    }

}
