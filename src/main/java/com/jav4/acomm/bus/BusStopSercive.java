package com.jav4.acomm.bus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jav4.acomm.member.MemberDAO;
import com.jav4.acomm.member.MemberVO;

@Service
public class BusStopSercive {

	@Autowired
	BusStopDAO bdao;
	
	@Autowired
	MemberDAO mdao;
	
	public void upstop(MemberVO vo) {
		mdao.upstop(vo);
	}
	public List<BusStopVO> all(){
		
		return bdao.all();
	}
}
