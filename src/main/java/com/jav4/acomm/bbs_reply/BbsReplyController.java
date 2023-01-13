package com.jav4.acomm.bbs_reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.bbs.BbsVO;
import com.jav4.acomm.member.MemberVO;

@Controller
public class BbsReplyController {
	
	@Autowired
	BbsReplyDAO dao;
	
	// bbsReply 들고오기
	@RequestMapping("getBbsReply")
	public String getBbsReply(BbsReplyVO vo, Model model) {
		List<BbsReplyVO> bbsReply = dao.getBbsReply(vo); 
        model.addAttribute("bbsReply", bbsReply); 
		System.out.println("들고 온 댓글 = " + bbsReply);
		return "bbs/bbsReply";
	}
	
	// bbsReply 넣기
	@RequestMapping("insertBbsReply")
	public String insertBbsReply(BbsReplyVO vo, HttpSession session) {
		// 세션의 member_code로 nick 가져오기 
		vo.setMember_code((int)session.getAttribute("member_code"));
		String nick = dao.mcode2nick((int)session.getAttribute("member_code"));
		vo.setMember_nick(nick);
		// insert 실행
		System.out.println("insert할 BbsReplyVO = "+vo);
		dao.insertBbsReply(vo); 
		return "trashRoute";
	}
	
	// bbsReply 삭제
	@RequestMapping("deleteBbsReply")
	public String deleteBbsReply(BbsReplyVO vo) {
		// delete 실행
		dao.deleteBbsReply(vo);
		// openBbsCate
		return "trashRoute";
	}
	
	

	
}
