package com.jav4.acomm.bus;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

@Controller
public class BusStopController {
	
	@Autowired
	BusStopSercive service;
	
	@RequestMapping("bus/busstopmap.bus")
	public void mapinfo(AptVO vo,Model model) {
		List<BusStopVO> list= service.all();
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
	}	
	@RequestMapping("bus/busstopmap2.bus")
	public void mapinfo2(AptVO vo,Model model) {
		List<BusStopVO> list= service.all();
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
	}	
	@RequestMapping("bus/busstopmap3.bus")
	public void mapinfo3(AptVO vo,Model model) {
		List<BusStopVO> list= service.all();
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
	}	
	@RequestMapping("busstopmap4.bus")
	public String mapinfo4(AptVO vo, Model model) {
		List<BusStopVO> list= service.all();
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "bus/busstopmap4";
	}
	@RequestMapping("busstopmap5.bus")
	public String mapinfo5(MemberVO vo, Model model,HttpSession session) {
		vo.setMember_code((int)session.getAttribute("member_code"));
		//세션의 코드값으로 홈페이지 정보값 불러오기
		MemberVO vo2= service.idck(vo);
		AptVO vo3=service.code2name(vo2);
		model.addAttribute("member", vo2);
        model.addAttribute("apt", vo3);
		
		return "bus/busstopmap5";
	}
	@RequestMapping("list.bus")
	@ResponseBody
	public List<BusStopVO> mapinfo5( ) {
		
		return service.all();
	}
	@RequestMapping("upstop.bus")
	public String upstop(MemberVO vo, HttpSession session,Model model ) {
		vo.setMember_code((int)session.getAttribute("member_code"));
		boolean a=service.upstop(vo);
		//세션의 코드값으로 홈페이지 정보값 불러오기
		MemberVO vo2= service.idck(vo);
		AptVO vo3=service.code2name(vo2);
		model.addAttribute("member", vo2);
        model.addAttribute("apt", vo3);
        return "local/homepage";
	}	
	@RequestMapping("stopsearch.bus")
	@ResponseBody
	public BusStopVO stopsearch(BusStopVO vo ) {
		return service.one(vo);
	}
}
