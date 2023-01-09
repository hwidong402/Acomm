package com.jav4.acomm.restaurant;

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
public class RestaurantController {
	
	@Autowired
	RestaurantService service;
	//주변 상가 페이지 이동
	@RequestMapping("matjip")
	public String restaurant(AptVO vo,MemberVO vo2,Model model,HttpSession session) {
		vo2.setMember_code((int)session.getAttribute("member_code"));
		vo2=service.idck(vo2);
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		return "rest/restaurant";//주변상가 표시페이지
	}
	//
	@RequestMapping("restwrite.rest")
	public String restwrite(AptVO vo,MemberVO vo2,Model model,HttpSession session) {
		vo2.setMember_code((int)session.getAttribute("member_code"));
		vo2=service.idck(vo2);
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		return "rest/restaurantwrite";//주변상가 표시페이지
	}
	@RequestMapping("restinsert.rest")
	public String restinsert(AptVO vo,MemberVO vo2,RestaurantVO vo3,Model model,HttpSession session) {
		vo2.setMember_code((int)session.getAttribute("member_code"));
		vo2=service.idck(vo2);
		vo=service.code2name(vo2);
		boolean s =service.insert(vo3);
		if(s) {
		System.out.println(s);
		
			model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		return "rest/restaurant";}
		else{
			
				model.addAttribute("vo", vo);
			model.addAttribute("vo2", vo2);
			return "rest/restaurantwrite";
		}
	}
	//상가 list json으로 들고오기
	@RequestMapping("list.rest")
	@ResponseBody
	public List<RestaurantVO> all() {
		
		return service.list();//저장된 상가목록 
	}
	//상가 후기 리스트 검색  json
	@RequestMapping("list.reply")
	@ResponseBody
	public List<RestReplyVO> list(RestReplyVO vo){
		return service.list(vo);
	}
	// 상가 하나 검색 json
	@RequestMapping("search.rest")
	@ResponseBody
	public RestaurantVO search(RestaurantVO vo){
		return service.one(vo);
	}
	
}
