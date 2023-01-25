package com.jav4.acomm.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

@Service
public class BbsServiceT implements BbsServiceTInter {

	@Autowired
	BbsDAOInter dao;
	
	// apt * by apt_code
	@Override
	public AptVO aptAll(AptVO avo) {
		 return dao.aptAll(avo);
	}
	
	// member * by member_code
	@Override
	public MemberVO memberAll(MemberVO mvo) {
		 return dao.memberAll(mvo);
	}
	
	// bbs의 전체 게시판 보기
	@Override
	public List<BbsVO> getList5(BbsVO vo) {
		 return dao.getList5(vo);
	}
	
	// cate별로 상세 게시판 보기
	@Override
	public List<BbsVO> getListCate(BbsVO bvo) {
		 return dao.getListCate(bvo);
	}
	
	//
	@Override
	public MemberVO id2cls(MemberVO mvo) {
		 return dao.id2cls(mvo);
	}
	
	//
	@Override
	public BbsVO getBbsPost(BbsVO vo) {
		 return dao.getBbsPost(vo);
	}
	
	//
	@Override
	public void insertPost(BbsVO vo) {
		 dao.insertPost(vo);
	}
	
	//
	@Override
	public void updatePost(BbsVO vo) {
		 dao.updatePost(vo);
	}
	//
	@Override
	public void deletePost(BbsVO vo) {
		 dao.deletePost(vo);
	}
	
}
