package com.jav4.acomm.apt;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller   
public class AptController  {
	
	@Autowired
	AptServiceInter service;	
	
	// index파일에서 RDB에 있는 아파트 검색을 처리하기 위한 컨트롤러
	@RequestMapping("apt/apt_name") //view아래에 apt/apt_name이라는 파일이 있음!
	public void all(AptVO vo, Model model) { //AptVO에 아파트 이름값만 들어감.. 이대로 하던가 수정하던가 둘 중 하나! model은 view에 보여주기 위한 용도!
		List<AptVO> list = service.all(vo); // 서비스단으로 갑니다.
		model.addAttribute("list", list);   //model을 사용해서 웹 화면에 띄어줍니다. 속성이름은 list!
	}
	// 회원가입 enroll에서  아파트 검색을 처리하기 위한 컨트롤러 입니다. 위에거와 실행로직은 같고 위치도 동일합니다.
	@RequestMapping("apt/apt_code")
	public void code(AptVO vo, Model model) {
		List<AptVO> list = service.code(vo);
		model.addAttribute("list", list);
	}
	

}
