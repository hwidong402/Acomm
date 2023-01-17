package com.jav4.acomm.bus;

import java.util.List;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

public interface BusStopServiceInterface {

	//버스 정류장 리스트 불러오기 주기
	List<BusStopVO> all();

	//버스정류장 버스정류장 id로 정보 검색해서 들고오기
	BusStopVO one(BusStopVO vo);

	// MemberDao 
	//member 정보 update
	boolean upstop(MemberVO vo);

	//member정보 불러오기 (page 데이터 넘겨주기) 
	MemberVO idck(MemberVO vo);

	//member정보로 apt 정보 불러오기
	AptVO code2name(MemberVO vo);

}