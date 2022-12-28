package com.jav4.acomm.apt;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AptController {
	
	@Autowired
	AptDAO dao;	
	
	
//	@RequestMapping("apt_all")
//	public void all(Model model) {
//		List<AptVO> list = dao.readAll();
//		System.out.println(list.size());
//		model.addAttribute("list", list);
//	}
//	@RequestMapping("apt_one")
//	public void one(AptVO vo, Model model) {
//		AptVO one = dao.readOne(vo);
//		model.addAttribute("one", one);
//	}
}
