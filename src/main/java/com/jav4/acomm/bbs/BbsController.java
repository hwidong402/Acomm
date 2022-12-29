package com.jav4.acomm.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {
	
	@Autowired
	BbsDAO dao;
	
	// 게시글 작성 완료버튼 클릭시 동작맵핑
		@RequestMapping("bbs/create.bbs")
	public String insert(BbsVO vo,Model model,HttpSession session) {
		//인설트시 넣을 code값을 세션에서 가져오기
//		vo.setCode((String)session.getAttribute("code"));
		System.out.println(vo);
		//dao의 insert실행하여 vo로 묶인 입력값들 집어 넣기
		dao.insert(vo);
		//insert후 게시글 목록을 불러오기 위한 리스트 검색
		List<BbsVO> list =dao.list(vo);
		//게시판 리스트 값 보내기
		model.addAttribute("list", list);
		return "bbs/bbs";
	}
		
	// 게시글 삭제 버튼 클릭시 동작 맵핑
	@RequestMapping("delete.bbs")
	public String delete(BbsVO vo,Model model,HttpSession session) {
//		vo.setCode((String)session.getAttribute("code"));
		//입력된 id값으로 delete 실행
		dao.delete(vo);
		//insert후 게시글 목록을 불러오기 위한 리스트 검색
		List<BbsVO> list =dao.list(vo);
		//게시판 리스트 값 보내기
		model.addAttribute("list", list);
		return "bbs/bbs";
	}
	
	//작성이나 수정후 bbs로 돌아오기
	@RequestMapping("back.bbs")
	public String back(BbsVO vo,Model model,HttpSession session) {
		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
		//code에 따른 게시판 내용 불러오기
		List<BbsVO> list =dao.list(vo);
		//게시판 리스트 값 보내기
		model.addAttribute("list", list);
		//게시판 홈으로 돌려보내기
		return "bbs/bbs";
	}
	
	//수정 하기 전 게시글로 가기
	@RequestMapping("back2.bbs")
	public String back2(BbsVO vo,Model model) {
		// 수정페이지에서 받은 id값을 통해 뒤로 가기
		BbsVO one =dao.one(vo);
		//검색된 게시글 값 보내기
		model.addAttribute("dto", one);
		// 게시판 상세보기 뷰 이름으로 연결
		return "bbs/bbsinfo";
	}
	
	//수정하기 후 상세정보 보기
	@RequestMapping("up.bbs")
	public String up(BbsVO vo,Model model) {
		// bbs 테이블에서 id와 code로 게시판 내용 검색하기
		dao.update(vo);
		BbsVO one =dao.one(vo);
		model.addAttribute("dto", one);
		// 게시판 상세보기 뷰 이름으로 연결
		return "bbs/bbsinfo";
	}
	
	//게시판 실행 맵퍼
	@RequestMapping("open.bbs")
	public String open(BbsVO vo,Model model,HttpSession session) {
		//검색할 게시판 목록의 검색 코드 값을 세션값에서 가져오기 
//		vo.setCode((String)session.getAttribute("code"));
		//코드를 통한 게시판 검색 목록 
		List<BbsVO> list =dao.list(vo);
		//코드를 통한 게시판 검색 목록 보내기
		model.addAttribute("list", list);
		// 게시판 jsp이름
		return "bbs/bbs";
	}
	
	// 게시판 상세 보기 맵퍼
	@RequestMapping("info.bbs")
	public String info(BbsVO vo,Model model) {
		// bbs 테이블에서 id와 code로 게시판 내용 검색하기
		BbsVO one =dao.one(vo);
		model.addAttribute("dto", one);
		// 게시판 상세보기 뷰 이름으로 연결
		return "bbs/bbsinfo";
	}
	
	//글 타이틀로 검색하기
	@RequestMapping("search.bbs")
	public String search(BbsVO vo,Model model,HttpSession session) {
		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
		List<BbsVO> list =dao.serch(vo);
		model.addAttribute("list", list);
		//게시판 홈으로 돌려보내기
		return "bbs/bbs";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping("bbs/jspwrite.bbs")
	public void write(BbsVO vo,Model model,HttpSession session) {
		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
		BbsVO one =dao.one(vo);
		model.addAttribute("dto", one);
		
	}
	
	//게시글 내용 수정하기
	@RequestMapping("bbs/bbsup.bbs")
	public void bbsup(BbsVO vo,Model model) {
		//vo의id로 나머지 vo 값 다들고오기
		BbsVO one =dao.one(vo);
		model.addAttribute("dto", one);
		
	}
	
//	// 게시글 작성 완료버튼 클릭시 동작맵핑
//		@RequestMapping("bbs/create.bbs")
//	public String insert(BbsVO vo,Model model,HttpSession session) {
//		//인설트시 넣을 code값을 세션에서 가져오기
//		vo.setCode((String)session.getAttribute("code"));
//		System.out.println(vo);
//		//dao의 insert실행하여 vo로 묶인 입력값들 집어 넣기
//		dao.insert(vo);
//		//insert후 게시글 목록을 불러오기 위한 리스트 검색
//		List<BbsVO> list =dao.list(vo);
//		//게시판 리스트 값 보내기
//		model.addAttribute("list", list);
//		return "bbs/bbs";
//	}
//		
//	// 게시글 삭제 버튼 클릭시 동작 맵핑
//	@RequestMapping("delete.bbs")
//	public String delete(BbsVO vo,Model model,HttpSession session) {
//		vo.setCode((String)session.getAttribute("code"));
//		//입력된 id값으로 delete 실행
//		dao.delete(vo);
//		//insert후 게시글 목록을 불러오기 위한 리스트 검색
//		List<BbsVO> list =dao.list(vo);
//		//게시판 리스트 값 보내기
//		model.addAttribute("list", list);
//		return "bbs/bbs";
//	}
//	
//	//작성이나 수정후 bbs로 돌아오기
//	@RequestMapping("back.bbs")
//	public String back(BbsVO vo,Model model,HttpSession session) {
//		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
//		//code에 따른 게시판 내용 불러오기
//		List<BbsVO> list =dao.list(vo);
//		//게시판 리스트 값 보내기
//		model.addAttribute("list", list);
//		//게시판 홈으로 돌려보내기
//		return "bbs/bbs";
//	}
//	
//	//수정 하기 전 게시글로 가기
//	@RequestMapping("back2.bbs")
//	public String back2(BbsVO vo,Model model) {
//		// 수정페이지에서 받은 id값을 통해 뒤로 가기
//		BbsVO one =dao.one(vo);
//		//검색된 게시글 값 보내기
//		model.addAttribute("dto", one);
//		// 게시판 상세보기 뷰 이름으로 연결
//		return "bbs/bbsinfo";
//	}
//	
//	//수정하기 후 상세정보 보기
//	@RequestMapping("up.bbs")
//	public String up(BbsVO vo,Model model) {
//		// bbs 테이블에서 id와 code로 게시판 내용 검색하기
//		dao.update(vo);
//		BbsVO one =dao.one(vo);
//		model.addAttribute("dto", one);
//		// 게시판 상세보기 뷰 이름으로 연결
//		return "bbs/bbsinfo";
//	}
//	
//	//게시판 실행 맵퍼
//	@RequestMapping("open.bbs")
//	public String open(BbsVO vo,Model model,HttpSession session) {
//		//검색할 게시판 목록의 검색 코드 값을 세션값에서 가져오기 
//		vo.setCode((String)session.getAttribute("code"));
//		//코드를 통한 게시판 검색 목록 
//		List<BbsVO> list =dao.list(vo);
//		//코드를 통한 게시판 검색 목록 보내기
//		model.addAttribute("list", list);
//		// 게시판 jsp이름
//		return "bbs/bbs";
//	}
//	
//	// 게시판 상세 보기 맵퍼
//	@RequestMapping("info.bbs")
//	public String info(BbsVO vo,Model model) {
//		// bbs 테이블에서 id와 code로 게시판 내용 검색하기
//		BbsVO one =dao.one(vo);
//		model.addAttribute("dto", one);
//		// 게시판 상세보기 뷰 이름으로 연결
//		return "bbs/bbsinfo";
//	}
//	
//	//글 타이틀로 검색하기
//	@RequestMapping("search.bbs")
//	public String search(BbsVO vo,Model model,HttpSession session) {
//		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
//		List<BbsVO> list =dao.serch(vo);
//		model.addAttribute("list", list);
//		//게시판 홈으로 돌려보내기
//		return "bbs/bbs";
//	}
//	
//	// 게시글 작성 페이지 이동
//	@RequestMapping("bbs/jspwrite.bbs")
//	public void write(BbsVO vo,Model model,HttpSession session) {
//		//뒤로가기 부를 때 vo에 코드 값넣어 검색 값 주기
//		vo.setCode((String)session.getAttribute("code"));
//		BbsVO one =dao.one(vo);
//		model.addAttribute("dto", one);
//		
//	}
//	
//	//게시글 내용 수정하기
//	@RequestMapping("bbs/bbsup.bbs")
//	public void bbsup(BbsVO vo,Model model) {
//		//vo의id로 나머지 vo 값 다들고오기
//		BbsVO one =dao.one(vo);
//		model.addAttribute("dto", one);
//		
//	}
	
}
