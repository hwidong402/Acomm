package com.jav4.acomm.restaurant;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jav4.acomm.apt.AptVO;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService service;
	//주변 상가 페이지 이동
	@RequestMapping("matjip")
	public String restaurant(AptVO vo,Model model) {
	
		model.addAttribute("vo", vo);
		return "rest/restaurant";
	}
	//상가 list json으로 들고오기
	@RequestMapping("list.rest")
	@ResponseBody
	public List<RestaurantVO> all() {
		
		return service.list();
	}
	
}
