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
	BusStopDAO dao;
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
	@RequestMapping("bus/busstopmap4.bus")
	public void mapinfo4(AptVO vo, Model model) {
		List<BusStopVO> list= service.all();
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
	}
	@RequestMapping("all.bus")
	@ResponseBody
	public List<BusStopVO> mapinfo5(AptVO vo, Model model ) {
		 service.all();
		model.addAttribute("vo",vo);
		return service.all();
	}
	@RequestMapping("upstop.bus")
	public void upstop(MemberVO vo, HttpSession session ) {
		vo.setMember_id((String)session.getAttribute("id"));
		service.upstop(vo);
		
	}
}
