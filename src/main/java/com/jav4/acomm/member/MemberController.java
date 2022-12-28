package com.jav4.acomm.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.apt.AptVO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao; // di (의존성 주입)

	@RequestMapping("m_create")
	public void insert(MemberVO vo) {
		dao.insert(vo);
	}

	@RequestMapping("m_up")
	public void update(MemberVO vo) {
		dao.update(vo);
	}

	@RequestMapping("m_one")
	public void one(MemberVO vo, Model model) {
		MemberVO result = dao.one(vo);
		model.addAttribute("vo", result);
	}

	@RequestMapping("m_all")
	public void all(Model model) {
		List<MemberVO> list = dao.all();
		model.addAttribute("list", list);
	}

	@RequestMapping("m_login")
	  public String login(MemberVO vo, HttpSession session, Model model) {
	    MemberVO vo2 = dao.login(vo);
	    AptVO vo3 = dao.code2name(vo);
	     
	    if (vo2 == null) {
	      return "no";
	    } else {
	      session.setAttribute("id", vo2.getId());
	      session.setAttribute("code", vo2.getCode());
	      model.addAttribute("member", vo2);
	      model.addAttribute("apt", vo3);
	      return "local/homepage";
	    }
	 }
	
	@RequestMapping("m_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.jsp";
	}
	
	@RequestMapping("ckok")
	public void idck(MemberVO vo, Model model) {
		MemberVO vo2 = dao.idck(vo);
		String result = "no";
		if(vo2 != null) {
			result = "yes";
		}
		model.addAttribute("result", result);
	}

}
