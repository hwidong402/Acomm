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
	//OcrDAO dao;
	
	@Autowired
	BbsServiceInter service;
	
	// 인기 게시글 5개만 가져오기
	@RequestMapping("bbs/bbshotall")
	public void all(BbsVO vo,Model model, HttpSession session) {
		vo.setApt_code((String)session.getAttribute("apt_code"));
		List<BbsVO> list = service.list(vo);
		model.addAttribute("hotlist", list);
	}
	
	// 인기 게시글 전체 가져오기
	@RequestMapping("bbslistall")
	public String listall(BbsVO vo,Model model, HttpSession session) {
		vo.setApt_code((String)session.getAttribute("apt_code"));
		List<BbsVO> list = service.listAll(vo);
		model.addAttribute("hotlist", list);
		return "bbs/bbslistall";
	}
	
	// 게시판 상세 보기 --> 추후 원영님껄로 합쳐질 예정
//	@RequestMapping("bbs/bbshotone")
//	public String info(BbsVO vo, BbslikeVO vo2, Model model, HttpSession session) {
//		// bbs 테이블에서 bbs_id로 게시판 내용 검색하기
//		System.out.println("-----서비스 부르기 전------ " + vo.getBbs_id());
//		service.bbsCount(vo.getBbs_id()); // 게시글 조회수 증가
//		System.out.println("-------서비스 부른 후 ----- " + vo);
//		BbsVO one = service.one(vo);  // 게시글 하나 상세 검색
//		System.out.println("서비스 부른후 bbs 게시글 하나 검색 ---- " + vo);
//		System.out.println("vo2에 bbs_id가 찍히냐? => " + vo2);
//		vo2.setMember_code((Integer)session.getAttribute("member_code"));
//		BbslikeVO one2 = service.bbslikeone(vo2);
//		System.out.println("----------하나검색 후 " + one + "\n BbslikeVO : " + one2);
//		model.addAttribute("vo", one);
//		model.addAttribute("vo2", one2);
//		return "bbs/bbsPost2";
//	}
	
	// 게시판 좋아요
//	@RequestMapping("bbs/bbshotlike")
//	public String like(LikeVO vo, Model model,HttpSession session) {
//		vo.setMember_id((String)session.getAttribute("id"));
//		System.out.println("서비스 가기전 ----------" + vo);
//		service.bbslike(vo); // bbs 좋아요
//		service.memberlike(vo); // member 좋아요
//		return "redirect:/bbshot.jsp";
//	}
	
	// 게시판 좋아요
	@RequestMapping("bbs/bbshotlike")
	public String bbslike(BbslikeVO vo, Model model, HttpSession session) {
		vo.setMember_code((Integer)session.getAttribute("member_code"));
		System.out.println("bbs_like 디비 추가 가기전--------> " + vo);
		service.bbslike(vo);
		model.addAttribute("likeVO", vo);
		return "bbs/bbshotone";
	}
	
	// 게시판 좋아요 취소
	@RequestMapping("bbs/bbslikedel")
	public String bbslikeDel(BbslikeVO vo, Model model, HttpSession session) {
		vo.setMember_code((Integer)session.getAttribute("member_code"));
		System.out.println("bbs_like 디비 삭제 가기전--------> " + vo);
		service.bbslikedel(vo);
		return "bbs/bbshotone";
	}
	
}
