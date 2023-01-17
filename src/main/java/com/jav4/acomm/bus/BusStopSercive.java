package com.jav4.acomm.bus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberDAO;
import com.jav4.acomm.member.MemberVO;

@Service
public class BusStopSercive implements BusStopServiceInterface {
	// 버스db 관련 기능
	@Autowired
	BusStopDAOInterface bdao;
	// memberdb 관련 기능
	@Autowired
	MemberDAO mdao;
	
	//버스 정류장 리스트 불러오기 주기
	@Override
	public List<BusStopVO> all(){
		
		return bdao.all();
	}
	//버스정류장 버스정류장 id로 정보 검색해서 들고오기
	@Override
	public BusStopVO one(BusStopVO vo) {
		return bdao.one(vo);
	}
	// MemberDao 
	//member 정보 update
	@Override
	public boolean upstop(MemberVO vo) {
		if(mdao.upstop(vo)>0)return true;
		else return false;
	}
	//member정보 불러오기 (page 데이터 넘겨주기) 
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
}
