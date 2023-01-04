package com.jav4.acomm.aptsell;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.member.MemberVO;

@Controller
public class AptSellController {
	
	@Autowired
	AptSellDAO dao;	
	
	@RequestMapping("open.aptsell")
	public String open(MemberVO vo,HttpSession session, Model model) {
	
		vo.setApt_code((String)session.getAttribute("code")); 
		System.out.println(vo);
		
		
		return "aptsell/aptinfo";
	
	}
}