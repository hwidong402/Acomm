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
    
    //회원가입 버튼 누릴 시 실행
    @RequestMapping("m_create") 
    public void insert(MemberVO vo, HttpSession session) {
        dao.insert(vo);
        session.invalidate(); // 세션해제
    }
    //index페이지에서 아파트 검색 후 회원가입으로 넘어갈 때 실행되는 컨트롤러 
    @RequestMapping("enrolldirect")
    public void sign(AptVO vo, Model model, HttpSession session) {
        session.setAttribute("apt_name", vo.getApt_name()); // 아파트 이름
        session.setAttribute("apt_code", vo.getApt_code()); // 아파트 고유번호  // 이 두개를 고유 세션으로 잡아놨음.
        //System.out.println(vo);
    }
    
      //local 페이지에서 내 정보로 이동하여 개인정보를 수정하는 버튼을 눌릴때 실행됨
      @RequestMapping("local/m_up")// 수정이 마치면 view아래 local/m_up으로 gogo public void
      public void update(MemberVO vo, HttpSession session) {
      vo.setMember_code((Integer)session.getAttribute("member_code")); //member_code로 세션값을 잡아줌
      System.out.println(vo);
      dao.update(vo); //db에서 member_code값을 가지고 update문 실행해서 개인정보 내역 수정
      session.invalidate(); // 로그인으로 돌아가면서 session 풀기
      }
    
    // 내 정보 
    @RequestMapping("myinfo")// 내 정보를 보여주는 페이지(수정하기 전 단계)
    public String print(MemberVO vo, Model model, HttpSession session) { // 내 정보를 출력하다 (print)로 간단히 해석
    	vo.setMember_code((Integer)session.getAttribute("member_code")); // 세션값은 member_code값으로 줌
        MemberVO one=dao.print(vo); //세션을 잡은 값으로 vo에 담아서 맴버에 대한 전체 값을 담아옵니다.
        model.addAttribute("one",one);  
        return "local/myinfo";  // local/myinfo에 model에 담았던 내 정보를 보여줍시다.
    }
    
    @RequestMapping("m_one")
    public void one(MemberVO vo, Model model) {
        MemberVO result = dao.one(vo);
        model.addAttribute("vo", result);
    }
	/*
	 * @RequesMapping("m_all") public void all(Model model) { List<MemberVO> list =
	 * dao.all(); model.addAttribute("list", list); }
	 */
   
    // 로그인이 실행되는 로직
    @RequestMapping("m_login")
      public String login(MemberVO vo, HttpSession session, Model model) {
        MemberVO vo2 = dao.login(vo); // vo2 한 member의 전체칼럼
        AptVO vo3 = dao.code2name(vo); //vo3 member 이름
         
        if (vo2 == null) {  // vo2가 만약 비어있다면 (로그인이 실패를 했다면) 
          return "no";  // no.jsp로 이동
        } else { // member_code, code, id, city를 세션값으로 잡음
          session.setAttribute("member_code", vo2.getMember_code());
          session.setAttribute("apt_code", vo2.getApt_code());
          //System.out.println(vo2);
          //session.setAttribute("id", vo2.getMember_id());
          //session.setAttribute("city", vo3.getApt_city());
          model.addAttribute("member", vo2); 
          model.addAttribute("apt", vo3);
          //System.out.println(vo3);
          return "local/homepage"; //local/homepage로 넘어감
        }
     }
    
    //로그아웃 실행 로직
    @RequestMapping("m_logout") //homepage에서 로그아웃 버튼을 눌렸을 때 실행되는 컨트롤러
    public String logout(HttpSession session) {
        session.invalidate(); // 세션값을 끊어줌
        return "redirect:index.jsp"; // 모든 세션값을 끊은 상태에서 로그아웃이 완료가 되고 index(초기메인)페이지로 돌아감
    }
    
    //아이디중복검사
	/*
	 * 1. enroll.jsp의 member_id에 값을 입력 
	 * 2. enroll.jsp의 자바스크립트에서 data로 member_id를 여기로 보내는 ajax실행 
	 * 3. MemberController.java.에서 ckok.jsp가 mapping된 구문 실행 
	 * 4. 중복이면 result를 yes, 중복이 아니면 result를 no로 모델값을 보냄 
	 * 5. 받아오는 데 성공했으면 받은 모델값을 x로 이하 스크립트 실행 
	 * 6. x가 no이면 중복이 아닐 때의 조건문을 실행 
	 * 7. x가 yes이면 중복일 때의 조건문을 실행
	 */
    
    @RequestMapping("ckok") //회원가입 enroll에서 아이디 중복검사를 할 때 실행되는 컨트롤러 
    public void idck(MemberVO vo, Model model) {
        MemberVO vo2 = dao.idck(vo); //  DB에 id값을 넣어서 아이디 중복이 있는지 확인하러감.
        String result = "no"; 
        if(vo2 != null) {  // if 구문 mapper에서 id를 검색하러 가는데 select * from 전체검색을 해서 검색 된 값이 있으면 vo는 꽉 찬 가방이 되어서 중복된 아이디가 있다는걸 암시
            result = "yes"; // 꽉 차 있음면 result 값을 yes을 주어서 모델로 값을 넘김 여기까지가 백엔드가 처리해주고 나머지는 프론트가 도와줌
        }
        model.addAttribute("result", result); // yes는 중복임 no는 중복이 아님
    }
    
    //닉네임중복검사
	/*
	 * 1. enroll.jsp의 member_nick에 값을 입력 
	 * 2. enroll.jsp의 자바스크립트에서 data로 member_nick을 여기로 보내는 ajax실행 
	 * 3. MemberController.java.에서 nickok.jsp가 mapping된 구문 실행 
	 * 4. 중복이면 result를 yes, 중복이 아니면 result를 no로 모델값을 보냄 
	 * 5. 받아오는 데 성공했으면 받은 모델값을 x로 이하 스크립트 실행 
	 * 6. x가 no이면 중복이 아닐 때의 조건문을 실행 
	 * 7. x가 yes이면 중복일 때의 조건문을 실행
	 */
    @RequestMapping("nickok") //닉네임 enroll에서 닉네임 중복검사를 할 때 실행됨 
    public void nickck(MemberVO vo, Model model) {
    	MemberVO vo2 = dao.nickck(vo); //  DB에 nickname값을 넣어서 아이디 중복이 있는지 확인하러감.
    	String result = "no";
    	if(vo2 != null) { // if 구문 mapper에서 id를 검색하러 가는데 select * from 전체검색을 해서 검색 된 값이 있으면 vo는 꽉 찬 가방이 되어서 중복된 닉네임이 있다는걸 암시
    		result = "yes"; // 꽉 차 있음면 result 값을 yes을 주어서 모델로 값을 넘김 여기까지가 백엔드가 처리해주고 나머지는 프론트가 도와줌
    	}
    	model.addAttribute("result", result); // yes는 중복임 no는 중복이 아님
    }
    
    //관리자가 버튼 실행 시 
    @RequestMapping("everyinfo") // homepage에 버튼 로직(member.member_cls==1) 구문이 있는데 이 구문은 관리자만 볼 수 있는 버튼이며 클릭시 실행되는 로직
    public String everyinfo(MemberVO vo, Model model, HttpSession session) { 
    	vo.setApt_code((String)session.getAttribute("apt_code")); // 세션 값은 Apt_code에서 가지고옴
    	//System.out.println(vo);
    	List<MemberVO> list = dao.all(vo); // 관리자 권한으로 회원들의 정보를 가져와서 list에 담기
        model.addAttribute("list", list); // list에 담아서
        //System.out.println(list);
        return "maneger/everyinfo"; // maneger/everyinfo 파일에 출력
        
    }
    
 
     
}