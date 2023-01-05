package com.jav4.acomm.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.member.MemberVO;


@Controller
public class BbsController {
	
	@Autowired
	BbsDAO dao;
	
	// ▽▽▽▽▽ Read Zone ▽▽▽▽▽
	
	// homepage 열기
	@RequestMapping("openHomepage")
	public String openHomepage() {
		return "local/homepage";
		// 리턴 없이하니 http://localhost:8080/acomm/local/open.bbs 로가서 404 뜸
	}


	// bbs (전체용) 게시판으로 이동
	@RequestMapping("openBbs")
	public String openBbs(BbsVO vo,HttpSession session, Model model) {
		//(인기제외) cate별로 list를 최신 5개씩 들고와서 넘겨줌 
		vo.setApt_code((String)session.getAttribute("code")); // 원래는 apt_code
		
		// Bbs_cate를 다르게 주면서 list5로 넘겨 List VO를 받는다
		vo.setBbs_cate("noti");
		List<BbsVO> list5_noti = dao.getList5(vo);
		vo.setBbs_cate("free");
		List<BbsVO> list5_free = dao.getList5(vo);
		vo.setBbs_cate("market");
		List<BbsVO> list5_market = dao.getList5(vo);
		vo.setBbs_cate("sugg");
		List<BbsVO> list5_sugg = dao.getList5(vo);
		vo.setBbs_cate("worry");
		List<BbsVO> list5_worry = dao.getList5(vo);
		
		// List VO를 model로 넘긴다
		model.addAttribute("list5_noti", list5_noti);
		model.addAttribute("list5_free", list5_free);
		model.addAttribute("list5_market", list5_market);
		model.addAttribute("list5_sugg", list5_sugg);
		model.addAttribute("list5_worry", list5_worry);
		System.out.println("open bbs with list5");
		
		return "bbs/bbs";
	}
	
	// cate별로 상세 게시판으로 이동. fin
	@RequestMapping("openBbsCate")
	public String openBbsCate(BbsVO bvo, MemberVO mvo, HttpSession session,Model model) {
		//세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시물만 들고오기
		bvo.setApt_code((String)session.getAttribute("code"));
		List<BbsVO> list = dao.getListCate(bvo);
		model.addAttribute("list", list);
		System.out.println("open this cate list >> " + list);
		
		// noti write버튼 admin 필터링
		// id로 cls 확인 후 값 넘겨주기 
		mvo.setMember_id((String)session.getAttribute("id"));
		MemberVO member_cls = dao.id2cls(mvo); // member 정보 다 들고올 수 있는데 리소스 생각해서 cls 만
		model.addAttribute("member_cls", member_cls.getMember_cls());
		
		// write용 cate 값 넘겨주기 
		model.addAttribute("bbs_cate", bvo.getBbs_cate());
		return "bbs/bbsCate";
	}
	
	// 게시글로 이동
	@RequestMapping("openBbsPost")
	public String openBbsPost(BbsVO vo,Model model) {
		// <a href>의 bbs_id로 게시글 정보 가져오기
		BbsVO post = dao.getBbsPost(vo);
		// post로 받아서 bbsPost.jsp로 넘겨줌
		model.addAttribute("post", post);
		System.out.println("open this post >> " + post);
		return "bbs/bbsPost";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping("openBbsWrite")
	public String openBbsWrite(BbsVO vo, Model model) {
		model.addAttribute("bbs_cate", vo.getBbs_cate());
		System.out.println("open >>" + vo.getBbs_cate() + "<< cate write page");
		return "bbs/bbsWrite";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping("openBbsUpdate")
	public String openBbsUpdate(BbsVO vo, Model model) {
		// <a href>의 bbs_id로 게시글 정보 가져오기
		BbsVO post = dao.getBbsPost(vo);
		// post로 받아서 bbsUpdate.jsp로 넘겨줌
		model.addAttribute("post", post);
		System.out.println("update this post >> " + post);
		return "bbs/bbsUpdate";
	}
	
	
	
	// ▽▽▽▽▽ Create Zone ▽▽▽▽▽
	
	
	// 게시글 작성 완료 > data insert + cate로 이동
	@RequestMapping("insertPost")
	public String insertPost(BbsVO vo) {
		// insert 실행
		dao.insertPost(vo);
		// openBbsCate
		return "redirect:openBbsCate?bbs_cate="+vo.getBbs_cate();
	}
	
	// 게시글 수정 완료 > data update + post로 이동
	@RequestMapping("updatePost")
	public String updatePost(BbsVO vo) {
		System.out.println("지금 가진vo" + vo);
		//update 실행
		dao.updatePost(vo);
		// openBbsPost 실행3
		return "redirect:openBbsPost?bbs_id="+vo.getBbs_id();
	}
		
	// 게시글 삭제 완료 > data delete + cate로 이동
	@RequestMapping("deletePost")
	public String deletePost(BbsVO vo) {
		// cate로 가기위한 정보 검색 
		BbsVO post = dao.getBbsPost(vo);
		// insert 실행
		dao.deletePost(vo);
		// openBbsCate
		return "redirect:openBbsCate?bbs_cate="+post.getBbs_cate();
	}
	
	
	
	
}
