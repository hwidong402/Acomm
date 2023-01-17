package com.jav4.acomm.ocr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.bbs_reply.BbsReplyDAO;
import com.jav4.acomm.member.MemberVO;


@Controller
public class OCRController {
	
	
	// ocr 실행하기
	@RequestMapping("ocr")
	public String ocr(Model model) {
		NaverOCRAPI ocr = new NaverOCRAPI();
		System.out.println(ocr);
		String result = ocr.ocr();
		model.addAttribute("ocr", result);
		return "bbs/ocr";
	}
	
	
	@RequestMapping("uploadForm")
	public void uploadForm(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
	}
	
	
	
}
