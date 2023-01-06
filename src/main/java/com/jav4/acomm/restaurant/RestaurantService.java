package com.jav4.acomm.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.member.MemberDAO;

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
	
	//레스토랑별 후기 목록 검색
	public List<RestReplyVO> list(RestReplyVO vo){
		return rrdao.list(vo);
	}
}
