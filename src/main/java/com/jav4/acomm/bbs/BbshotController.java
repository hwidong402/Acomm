package com.jav4.acomm.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbshotController {
	
	//@Autowired
	//BbshotDAO dao;
	
	@Autowired
	BbsService service;
	
	// 게시판 전체 가져오기
	@RequestMapping("bbs/bbshotall")
	public void all(BbsVO vo,Model model) {
		List<BbsVO> list = service.list(vo);
		model.addAttribute("list", list);
	}
	
	// 게시판 상세 보기
	@RequestMapping("bbs/bbshotone")
	public void info(BbsVO vo,Model model) {
		// bbs 테이블에서 bbs_id로 게시판 내용 검색하기
//		System.out.println("-----서비스 부르기 전------ " + vo.getBbs_id());
		service.bbsCount(vo.getBbs_id());

		BbsVO one = service.one(vo);
//		System.out.println("----------하나검색 후 " + one);
		model.addAttribute("vo", one);
	}
	
}
