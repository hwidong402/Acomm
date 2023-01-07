package com.jav4.acomm.aptsell;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;
@Controller
public class AptSellController {
	
	@Autowired
	AptSellDAO dao;	
	
	//homepage로 들어와서 부동산 메뉴바를 클릭했을 때 실행되는 컨트롤러 입니다.
	@RequestMapping("open.aptsell") // !- 간단한 컨트롤러를 넣었지 손대야할 부분이 많습니다.
	public String open(MemberVO vo, AptVO vo2, HttpSession session, Model model) {
		vo.setApt_code((String)session.getAttribute("code")); 
		vo2.setApt_city((String)session.getAttribute("city")); //code 및 도시(부산, 경기, 서울 등)을 세션으로 잡음
		System.out.println(vo);
		System.out.println(vo2);
		return "aptsell/aptinfo";
	
	}
}