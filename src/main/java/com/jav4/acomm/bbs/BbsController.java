package com.jav4.acomm.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.bbs_reply.BbsReplyDAO;
import com.jav4.acomm.member.MemberVO;


@Controller
public class BbsController {
	
	@Autowired
	BbsDAO dao;
	
	@Autowired
	BbsServiceInter service;
	
	// ▽▽▽▽▽ Read Zone ▽▽▽▽▽
	
	// homepage 열기
	@RequestMapping("openHomepage")
	public String openHomepage(AptVO avo, MemberVO mvo, HttpSession session, Model model) {
		avo.setApt_code((String)session.getAttribute("apt_code"));
		mvo.setMember_code((int)session.getAttribute("member_code"));
		AptVO avo2 = dao.aptAll(avo); 
		MemberVO mvo2 = dao.memberAll(mvo); 
        model.addAttribute("member", mvo2); 
        model.addAttribute("apt", avo2);
		
		return "local/homepage";
		// 리턴 없이하니 http://localhost:8080/acomm/local/open.bbs 로가서 404 뜸
	}

	// bbs에서 list5 들고오기
	@RequestMapping("bbsList5")
	public String bbsList5(BbsVO vo, HttpSession session, Model model) {
		vo.setApt_code((String)session.getAttribute("apt_code")); // 원래는 apt_code
		List<BbsVO> list5 = dao.getList5(vo);
		// List VO를 model로 넘긴다
		model.addAttribute("list5", list5);
		model.addAttribute("cate", vo.getBbs_cate());
		
		return "bbs/bbsList5";
	}


	// bbs (전체용) 게시판으로 이동
	@RequestMapping("openBbs")
	public String openBbs(BbsVO vo,HttpSession session, Model model) {
//		//(인기제외) cate별로 list를 최신 5개씩 들고와서 넘겨줌 
//		vo.setApt_code((String)session.getAttribute("code")); // 원래는 apt_code
		
		return "bbs/bbs";
	}
	
	// cate별로 상세 게시판으로 이동. fin
	@RequestMapping("openBbsCate")
	public String openBbsCate(BbsVO bvo, MemberVO mvo, HttpSession session,Model model) {
		//세션의 apt_code 와 <a href>의 bbs_cate를 둘 다 일치하는 게시물만 들고오기
		bvo.setApt_code((String)session.getAttribute("apt_code"));
		List<BbsVO> list = dao.getListCate(bvo);
		model.addAttribute("list", list);
		System.out.println("open this cate list >> " + list);
		
		// noti write버튼 admin 필터링
		// code로 cls 확인 후 값 넘겨주기 
		mvo.setMember_code((int)session.getAttribute("member_code"));
		MemberVO member_cls = dao.id2cls(mvo); // member 정보 다 들고올 수 있는데 리소스 생각해서 cls 만
		model.addAttribute("member_cls", member_cls.getMember_cls());
		
		// write용 cate 값 넘겨주기 
		model.addAttribute("bbs_cate", bvo.getBbs_cate());
		return "bbs/bbsCate";
	}
	
	// 게시글로 이동
	@RequestMapping("openBbsPost")
	public String openBbsPost(BbsVO vo, BbslikeVO vo2, Model model, HttpSession session) {
		service.bbsCount(vo.getBbs_id()); // 게시글 조회수 증가
		// <a href>의 bbs_id로 게시글 정보 가져오기
		BbsVO post = dao.getBbsPost(vo);
		// post로 받아서 bbsPost.jsp로 넘겨줌
		vo2.setMember_code((Integer)session.getAttribute("member_code"));
		BbslikeVO one = service.bbslikeone(vo2);
		model.addAttribute("post", post);
		model.addAttribute("post2", one);
		System.out.println("BbslikeVO 검색 >> " + one);
		System.out.println("open this post >> " + post);
		return "bbs/bbsPost";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping("openBbsWrite")
	public String openBbsWrite(BbsVO bvo, MemberVO mvo, HttpSession session, Model model) {
		mvo.setMember_code((int)session.getAttribute("member_code"));
		MemberVO mvo2 = dao.memberAll(mvo); 
        model.addAttribute("member", mvo2); 
		model.addAttribute("bbs_cate", bvo.getBbs_cate());
		System.out.println(bvo.getBbs_cate() + "<< cate의 글 작성페이지로 이동");
		return "bbs/bbsWrite";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping("openBbsUpdate")
	public String openBbsUpdate(BbsVO bvo, MemberVO mvo, HttpSession session,Model model) {
		// code로 cls 확인 후 값 넘겨주기 
		mvo.setMember_code((int)session.getAttribute("member_code"));
		MemberVO member_cls = dao.id2cls(mvo); // member 정보 다 들고올 수 있는데 리소스 생각해서 cls 만
		model.addAttribute("member_cls", member_cls.getMember_cls());
		
		// <a href>의 bbs_id로 게시글 정보 가져오기
		BbsVO post = dao.getBbsPost(bvo);
		// post로 받아서 bbsUpdate.jsp로 넘겨줌
		model.addAttribute("post", post);
		System.out.println("update post get >> " + post);
		return "bbs/bbsUpdate";
	}
	
	
	
	// ▽▽▽▽▽ Create Zone ▽▽▽▽▽
	
	
	// 게시글 작성 완료 > data insert + cate로 이동
	@RequestMapping("insertPost")
	public String insertPost(BbsVO vo) {
		// insert 실행
		System.out.println("insert할 BbsVO = "+vo);
		dao.insertPost(vo);
		// openBbsCate
		return "redirect:openBbsCate?bbs_cate="+vo.getBbs_cate();
	}
	
	// 게시글 수정 완료 > data update + post로 이동
	@RequestMapping("updatePost")
	public String updatePost(BbsVO vo) {
		System.out.println("update할 BbsVO = " + vo);
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
