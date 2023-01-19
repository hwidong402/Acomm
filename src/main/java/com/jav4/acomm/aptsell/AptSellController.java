package com.jav4.acomm.aptsell;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.apt.AptDAOInter;
import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;
@Controller
public class AptSellController {
	
	@Autowired
	AptSellDAO dao;	
	
	@Autowired
	AptDAOInter dao2;
	//homepage로 들어와서 부동산 메뉴바를 클릭했을 때 실행되는 컨트롤러 입니다.
	@RequestMapping("open.aptsell") // 로그인 시 세션 설정한 아파트 코트를 세션으로 잡고 모델로 도시를 불러옴
	public String open(AptVO vo, HttpSession session, Model model) {
		vo.setApt_code((String)session.getAttribute("apt_code"));
		System.out.println("1차vo>>>"+vo);
		AptVO city = dao2.city(vo);
		System.out.println("2차city>>>"+city);
		model.addAttribute("city", city);
		System.out.println("3차model>>>"+model);
		return "aptsell/aptinfo";
	
	}
}