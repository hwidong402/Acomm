package com.jav4.acomm.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberDAOInter;
import com.jav4.acomm.member.MemberVO;

@Service
public class RestaurantService implements RestaurantServiceInterface {
	//레스토랑 db 연결
	@Autowired
	RestaurantDAOInterface rdao;
	//member db 연결
	@Autowired
	MemberDAOInter mdao;
	//restreply db 연결
	@Autowired
	RestReplyDAOInterface rrdao;
	//긍부정평가서비스
	@Autowired
	DictionaryService dservice;
	
	//레스토랑 리스트 검색
	@Override
	public List<RestaurantVO> list() {
		return rdao.list();
	}
	//레스토랑 하나 검색
	@Override
	public RestaurantVO one(RestaurantVO vo) {
		return rdao.one(vo);
	}
	
	// restaurant 등록 메써드
	@Override
	public boolean insert(RestaurantVO vo) {
		if(rdao.insert(vo)>0)return true;
		else return false;
	}
	
	//페이지 로드용 member 정보 검색
	//member_code로 member 정보 가져오기
	@Override
	public MemberVO idck(MemberVO vo) {
		
		MemberVO vo2 = mdao.print(vo); // vo2 member의 전체값
		return vo2;
	}
	
	//member정보로 apt 정보 불러오기
		@Override
		public AptVO code2name(MemberVO vo) {
			
			AptVO vo3 = mdao.code2name(vo); //vo3 member 이름
			return vo3;
		}
		
	//restaurant reply 관련 메써드
	//레스토랑별 후기 목록 검색
	@Override
	public List<RestReplyVO> list(RestReplyVO vo){
		return rrdao.list(vo);
	}
	//상가 후기 insert 
	@Override
	public boolean insert(RestReplyVO vo) {
		vo.setRere_posneg(dservice.emotion(vo.getRere_content()));
		if(rrdao.insert(vo)>0)return true;
		else return false;
	}
	//후기 삭제
	@Override
	public boolean delete(RestReplyVO vo) {
		if(rrdao.delete(vo)>0)return true;
		else return false;
	}
	//나의 후기 검색
	@Override
	public RestReplyVO myreview(RestReplyVO vo) {
		return rrdao.myreview(vo);
	}
	//다른사람 후기 검색
	@Override
	public List<RestReplyVO> otherreview(RestReplyVO vo) {
		return rrdao.otherreview(vo);
	}
	//긍정 후기 검색 메써드
	@Override
	public List<RestReplyVO> posreview(RestReplyVO vo) {
		return rrdao.posreview(vo);
	}
	//부정 후기 검색 메써드
	@Override
	public List<RestReplyVO> negreview(RestReplyVO vo) {
		return rrdao.negreview(vo);
	}
}
