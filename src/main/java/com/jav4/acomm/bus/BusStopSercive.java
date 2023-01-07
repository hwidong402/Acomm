package com.jav4.acomm.bus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberDAO;
import com.jav4.acomm.member.MemberVO;

@Service
public class BusStopSercive {

	@Autowired
	BusStopDAO bdao;
	
	@Autowired
	MemberDAO mdao;
	public MemberVO idck(MemberVO vo) {
		
		MemberVO vo2 = mdao.print(vo); // vo2 member의 전체값
		return vo2;
	}
	public AptVO code2name(MemberVO vo) {
		
		AptVO vo3 = mdao.code2name(vo); //vo3 member 이름
		return vo3;
	}
	
	public boolean upstop(MemberVO vo) {
		if(mdao.upstop(vo)>0)return true;
		else return false;
	}
	public List<BusStopVO> all(){
		
		return bdao.all();
	}
	public BusStopVO one(BusStopVO vo) {
		return bdao.one(vo);
	}
	
}
