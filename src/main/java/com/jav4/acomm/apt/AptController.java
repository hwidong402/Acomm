package com.jav4.acomm.apt;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AptController {
	
	@Autowired
	AptDAO dao;	
	
	// index파일에서 RDB에 있는 아파트 검색을 처리하기 위한 컨트롤러
	@RequestMapping("apt/apt_name") //view아래에 apt/apt_name이라는 파일이 있음!
	public void all(AptVO vo, Model model) { //AptVO에 아파트 이름값만 들어감.. 이대로 하던가 수정하던가 둘 중 하나! model은 view에 보여주기 위한 용도!
		List<AptVO> list = dao.readall(vo); // 데이터베이스로 gogo
		model.addAttribute("list", list);
	}
	
	@RequestMapping("apt/apt_code")
	public void code(AptVO vo, Model model) {
		List<AptVO> list = dao.readcode(vo);
		model.addAttribute("list", list);
	}
}
