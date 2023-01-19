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
	
	@Autowired
	OcrServiceinter service;
	
	// ocr
	@RequestMapping("ocr")
	public String uploadForm(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		String savedName = file.getOriginalFilename();
//		String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");
		File target = new File("D:\\Hwidong\\back-end_edu\\final-workspace\\Acomm\\src\\main\\webapp\\resources\\img\\" + savedName);
		file.transferTo(target);
		
		NaverOCRAPI ocr = new NaverOCRAPI();
		OcrVO vo = ocr.ocr(savedName);
		
		boolean result = service.ocrlist(vo); 
		
		System.out.println("컨트롤러의 vo >> " + vo);
		model.addAttribute("ocr", result);
		return "bbs/ocr";
	}
	
	
	
}
