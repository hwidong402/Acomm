package com.jav4.acomm.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbshotController {
	
	@Autowired
	BbshotDAO dao;
	
	// 게시판 전체 가져오기
	@RequestMapping("bbs/bbshotall")
	public void all(BbsVO vo,Model model) {
		List<BbsVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}
	
	// 게시판 상세 보기
	@RequestMapping("bbs/bbshotone")
	public void info(BbsVO vo,Model model) {
		// bbs 테이블에서 bbs_id로 게시판 내용 검색하기
		BbsVO one =dao.one(vo);
		model.addAttribute("vo", one);
	}
	
}
