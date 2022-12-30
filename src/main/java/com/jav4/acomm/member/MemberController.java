package com.jav4.acomm.member;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.bbs.BbsVO;
@Controller
public class MemberController {
    @Autowired
    MemberDAO dao; // di (의존성 주입)
    @RequestMapping("m_create")
    public void insert(MemberVO vo) {
        dao.insert(vo);
    }
    
      //local 페이지에서 내 정보로 이동하여 개인정보를 수정할 때 실행되는 컨트롤러
      @RequestMapping("local/m_up")// 수정이 마치면 view아래 local/m_up으로 gogo public void
      public void update(MemberVO vo, HttpSession session) {
      vo.setMember_id((String)session.getAttribute("id")); 
      System.out.println(vo);
      dao.update(vo);
      session.invalidate(); // 로그인으로 돌아가면서 session 풀기
      }
   
    @RequestMapping("local/myinfo")// 내정보를 보여주는 페이지
    public void print(MemberVO vo, Model model, HttpSession session) {
        vo.setMember_id((String)session.getAttribute("id")); 
        MemberVO one=dao.print(vo);
        model.addAttribute("one",one);
    }
    
    @RequestMapping("m_one")
    public void one(MemberVO vo, Model model) {
        MemberVO result = dao.one(vo);
        model.addAttribute("vo", result);
    }
    @RequestMapping("m_all")
    public void all(Model model) {
        List<MemberVO> list = dao.all();
        model.addAttribute("list", list);
    }
    
    
    @RequestMapping("m_login")
      public String login(MemberVO vo, HttpSession session, Model model) {
        MemberVO vo2 = dao.login(vo); // vo2 member의 전체값
        AptVO vo3 = dao.code2name(vo); //vo3 member 이름
         
        if (vo2 == null) {
          return "no";
        } else {
          session.setAttribute("id", vo2.getMember_id());
          session.setAttribute("code", vo2.getApt_code());
          model.addAttribute("member", vo2);
          model.addAttribute("apt", vo3);
          return "local/homepage";
        }
     }
    @RequestMapping("m_logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index.jsp";
    }
    
    @RequestMapping("ckok")
    public void idck(MemberVO vo, Model model) {
        MemberVO vo2 = dao.idck(vo);
        String result = "no";
        if(vo2 != null) {
            result = "yes";
        }
        model.addAttribute("result", result);
    }
    
 
     
}
	