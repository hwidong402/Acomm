package com.jav4.acomm.restaurant;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jav4.acomm.apt.AptVO;
import com.jav4.acomm.member.MemberVO;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService service;

	// 상가 페이지 관련 맵핑

	// 주변 상가 페이지 이동
	@RequestMapping("matjip")
	public String restaurant(MemberVO vo, Model model, HttpSession session) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);
		// 페이지 로드용 정보
		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		return "rest/restaurant";// 주변상가 표시페이지
	}

	// 상가 등록 페이지 이동
	@RequestMapping("restwrite.rest")
	public String restwrite(MemberVO vo, Model model, HttpSession session) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);
		// 페이지 로드용 정보
		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		return "rest/restaurantwrite";// 주변상가 표시페이지
	}

	// 상가 위치 등록
	@RequestMapping("restinsert.rest")
	public String restinsert(MemberVO vo, RestaurantVO vo3, Model model, HttpSession session) {
		if (vo3.getRest_name() != null || vo3.getRest_lat() != 0.0 || vo3.getRest_lon() != 0.0) {
			vo.setMember_code((int) session.getAttribute("member_code"));
			// 세션의 코드값으로 홈페이지 정보값 불러오기
			vo = service.idck(vo);
			AptVO vo2 = service.code2name(vo);
			service.insert(vo3);

			// 페이지 로드용 정보
			// 멤버
			model.addAttribute("member", vo);
			// 아파트
			model.addAttribute("apt", vo2);
			return "rest/restaurant";
		} else {
			return "rest/restaurantwrite";
		}

	}

	// 상가에서 홈페이지로 이동
	@RequestMapping("back.rest")
	public String upstop(MemberVO vo, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		// 세션의 코드값으로 홈페이지 정보값 불러오기
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);
		// 페이지 로드용 정보
		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		return "local/homepage";
	}

	// 상가상세보기 페이지
	@RequestMapping("restone.rest")
	public String restone(MemberVO vo, RestaurantVO vo3, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		// 세션의 코드값으로 홈페이지 정보값 불러오기
		// 레스토랑 id로 하나의 정보 검색
		vo3 = service.one(vo3);
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);

		// 페이지 로드용 정보 전송
		// 레스토랑 관련 정보
		model.addAttribute("rest", vo3);
		// member 관련 정보
		model.addAttribute("member", vo);
		// apt 관련 정보
		model.addAttribute("apt", vo2);
		return "rest/restaurantone";
	}

	// 상가 list json으로 들고오기
	@RequestMapping("list.rest")
	@ResponseBody
	public List<RestaurantVO> all() {
		return service.list();// 저장된 상가목록
	}

	// 상가 하나 검색 json
	@RequestMapping("search.rest")
	@ResponseBody
	public RestaurantVO search(RestaurantVO vo) {
		return service.one(vo);
	}

	// 상가 후기 관련 맵핑

	// 상가 후기 리스트 검색 json
	@RequestMapping("list.reply")
	@ResponseBody
	public List<RestReplyVO> list(RestReplyVO vo) {
		return service.list(vo);
	}

	// 상가 후기 작성 페이지 이동 
	//restaurantone 페이지용
	@RequestMapping("replywrite.rest")
	public String replywrite(MemberVO vo, RestaurantVO vo3, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);

		// 페이지 로드용 정보
		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		// 레스토랑 id
		model.addAttribute("rest", vo3);
		return "rest/restreplywrite";
	}
	//restaurant 페이지용 작성페이지
	@RequestMapping("replywrite2.rest")
	public String replywrite2(MemberVO vo, RestaurantVO vo3, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);

		// 페이지 로드용 정보
		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		// 레스토랑 id
		model.addAttribute("rest", vo3);
		return "rest/restreplywrite2";
	}
	//작성한 후기 등록 버튼 기능
	//restaurantone 페이지용등록기능 매핑
	@RequestMapping("replyinsert.rest")
	public String replyinsert(RestaurantVO vo3, RestReplyVO vo4) {
//		vo.setMember_code((int)session.getAttribute("member_code"));
//		vo=service.idck(vo);
//		AptVO vo2=service.code2name(vo);
		vo3 = service.one(vo3);
		service.insert(vo4);
		// 페이지 로드용 정보

		return "redirect:restone.rest?rest_id=" + vo3.getRest_id();
	}

	// restaurant용 등록 기능매핑
	@RequestMapping("replyinsert2.rest")
	public String replyinsert2(MemberVO vo, RestaurantVO vo3, RestReplyVO vo4, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);
		service.insert(vo4);
		// 페이지 로드용 정보

		return "redirect:matjip";
	}// 먹통페이지로 연결하여 맛집 url을 불러와야 함.

	@RequestMapping("replydelete.rest")
	public String replydelete(MemberVO vo, RestaurantVO vo3, RestReplyVO vo4, HttpSession session, Model model) {
		vo.setMember_code((int) session.getAttribute("member_code"));
		vo = service.idck(vo);
		AptVO vo2 = service.code2name(vo);
		vo3 = service.one(vo3);
		System.out.println(vo4);
		service.delete(vo4);
		// 페이지 로드용 정보

		// 멤버
		model.addAttribute("member", vo);
		// 아파트
		model.addAttribute("apt", vo2);
		// 레스토랑 id
		model.addAttribute("rest", vo3);
		return "rest/restaurantone";
	}

	@RequestMapping("replydelete2.rest")
	public String replydelete2(RestReplyVO vo4) {

		boolean result = service.delete(vo4);
		// 페이지 로드용 정보
		System.out.println(result);
		return "rest/deletereply";
	}

	// 나의 후기 검색
	// restaurant페이지용
	@RequestMapping("myreview.reply")
	public String myreview(RestReplyVO vo4, Model model, HttpSession session) {
		vo4.setMember_code((int) session.getAttribute("member_code"));
		vo4 = service.myreview(vo4);
		model.addAttribute("reply", vo4);
		return "rest/myreview";
	}

	// restaurantone페이지용
	@RequestMapping("myreviewone.reply")
	public String myreviewone(RestReplyVO vo4, Model model, HttpSession session) {
		vo4.setMember_code((int) session.getAttribute("member_code"));
		vo4 = service.myreview(vo4);
		model.addAttribute("reply", vo4);
		return "rest/myreviewone";
	}

	// 다른 사람 후기 검색
	// restaurant용 후기 검색
	@RequestMapping("otherreview.reply")
	public String otherreview(RestReplyVO vo4, Model model, HttpSession session) {
		vo4.setMember_code((int) session.getAttribute("member_code"));
		List<RestReplyVO> list = service.otherreview(vo4);
		model.addAttribute("reply", list);
		return "rest/otherreview";
	}

	// 긍정 후기 검색
	@RequestMapping("posreview.reply")
	public String posreview(RestReplyVO vo4, Model model, HttpSession session) {
		vo4.setMember_code((int) session.getAttribute("member_code"));
		List<RestReplyVO> list = service.posreview(vo4);
		model.addAttribute("reply", list);
		return "rest/otherreview";
	}

	// 부정 후기 검색
	@RequestMapping("negreview.reply")
	public String negreview(RestReplyVO vo4, Model model, HttpSession session) {
		vo4.setMember_code((int) session.getAttribute("member_code"));
		List<RestReplyVO> list = service.negreview(vo4);
		model.addAttribute("reply", list);
		return "rest/otherreview";
	}

}
