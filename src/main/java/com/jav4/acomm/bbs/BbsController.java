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
	
	// ▽▽▽▽▽ Read Zone ▽▽▽▽▽
	
		// bbs (전체용) 게시판 페이지 열기 
		@RequestMapping("open.bbs")
		public String open(BbsVO vo,HttpSession session, Model model) {
			//(인기제외) cate별로 list를 최신 5개씩 들고와서 넘겨줌 
			vo.setApt_code((String)session.getAttribute("code")); // 원래는 apt_code
			//vo.setBbs_cate("free");
			
			// Bbs_cate를 다르게 주면서 list5로 넘겨 List VO를 받는다
			vo.setBbs_cate("noti");
			List<BbsVO> list5_noti = dao.list5(vo);
			vo.setBbs_cate("free");
			List<BbsVO> list5_free = dao.list5(vo);
			vo.setBbs_cate("market");
			List<BbsVO> list5_market = dao.list5(vo);
			vo.setBbs_cate("sugg");
			List<BbsVO> list5_sugg = dao.list5(vo);
			vo.setBbs_cate("worry");
			List<BbsVO> list5_worry = dao.list5(vo);
			
			// List VO를 model로 넘긴다
			model.addAttribute("list5_noti", list5_noti);
			model.addAttribute("list5_free", list5_free);
			model.addAttribute("list5_market", list5_market);
			model.addAttribute("list5_sugg", list5_sugg);
			model.addAttribute("list5_worry", list5_worry);
			
			return "bbs/bbs";
		}
		
		// cate별로 상세 게시판 보기. fin
		@RequestMapping("bbs_cate.bbs")
		public String bbs_cate(BbsVO vo,HttpSession session,Model model) {
			//세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시물만 들고오기
			vo.setApt_code((String)session.getAttribute("code"));
			// list로 받아서 bbs_cate.jsp로 넘겨줌 
			List<BbsVO> list = dao.list(vo);
			model.addAttribute("list", list);
			System.out.println("들고온 list >> " + list);
			return "bbs/bbs_cate";
		}
		
		// 게시글 보기
		@RequestMapping("article.bbs")
		public String article(BbsVO vo,Model model) {
			// <a href>의 bbs_id로 게시글 정보 가져오기
			BbsVO one = dao.one(vo);
			// one으로 받아서 article.jsp로 넘겨줌
			model.addAttribute("one", one);
			System.out.println("들고온 one >> " + one);
			return "bbs/article";
		}
		
		
		// ▽▽▽▽▽ Create Zone ▽▽▽▽▽
		
		// 게시글 작성 페이지 이동
		@RequestMapping("bbs/write.bbs")
		public void write() {
			
		}
		
		// 게시글 작성 완료 > data insert + 게시판으로 이
		@RequestMapping("bbs/create.bbs")
		public String insert(BbsVO vo,Model model,HttpSession session) {
			//세션에서 apt_code get
			vo.setApt_code((String)session.getAttribute("code"));
			System.out.println(vo);
			//insert 실
			dao.insert(vo);
			// 게시글 list 불러오고 model로 다음 jsp로 보냄
			List<BbsVO> list =dao.list(vo);
			model.addAttribute("list", list);
			return "bbs/noti";
		}
	
}
