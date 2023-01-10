package com.jav4.acomm.bbs_reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.bbs.BbsVO;
import com.jav4.acomm.member.MemberVO;

@Controller
public class BbsReplyController {
	
	@Autowired
	BbsReplyDAO dao;
	
	// bbsReply 들고오기
	@RequestMapping("bbsReply")
	public String getBbsReply(BbsReplyVO vo, HttpSession session, Model model) {
		List<BbsReplyVO> bbsReply = dao.getBbsReply(vo); 
        model.addAttribute("bbsReply", bbsReply); 
		System.out.println("들고 온 댓글 = " + bbsReply);
		return "bbs/bbsReply";
	}
	
	

	
}
