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
//	@RequestMapping("bbshotone")
//	public String info(BbsVO vo,Model model) {
//		// bbs 테이블에서 id와 code로 게시판 내용 검색하기
//		BbsVO one =dao.one(vo);
//		model.addAttribute("dto", one);
//		// 게시판 상세보기 뷰 이름으로 연결
//		return "bbs/bbsinfo";
//	}
	
}
