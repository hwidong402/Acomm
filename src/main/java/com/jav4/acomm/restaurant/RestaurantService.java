package com.jav4.acomm.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberDAO;
import com.jav4.acomm.member.MemberVO;

@Service
public class RestaurantService {
	//레스토랑 db 연결
	@Autowired
	RestaurantDAO rdao;
	//member db 연결
	@Autowired
	MemberDAO mdao;
	//restreply db 연결
	@Autowired
	RestReplyDAO rrdao;
	
	//레스토랑 리스트 검색
	public List<RestaurantVO> list() {
		return rdao.list();
	}
	//레스토랑 하나 검색
	public RestaurantVO one(RestaurantVO vo) {
		return rdao.one(vo);
	}
	
	// restaurant 등록 메써드
	public boolean insert(RestaurantVO vo) {
		if(rdao.insert(vo)>0)return true;
		else return false;
	}
	
	//페이지 로드용 member 정보 검색
	//member_code로 member 정보 가져오기
	public MemberVO idck(MemberVO vo) {
		
		MemberVO vo2 = mdao.print(vo); // vo2 member의 전체값
		return vo2;
	}
	
	//member정보로 apt 정보 불러오기
		public AptVO code2name(MemberVO vo) {
			
			AptVO vo3 = mdao.code2name(vo); //vo3 member 이름
			return vo3;
		}
		
	//restaurant reply 관련 메써드
	//레스토랑별 후기 목록 검색
	public List<RestReplyVO> list(RestReplyVO vo){
		return rrdao.list(vo);
	}
	
	public boolean insert(RestReplyVO vo) {
		if(rrdao.insert(vo)>0)return true;
		else return false;
	}
}
