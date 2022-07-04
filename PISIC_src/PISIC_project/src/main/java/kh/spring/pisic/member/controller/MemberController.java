package kh.spring.pisic.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/insert")
	public String pageInsertMember() {
		return "member/insert";
	}
	
	@PostMapping("/insert")
	public ModelAndView insertMember(
			ModelAndView mv
			, Member member
			, RedirectAttributes rttr) {
		
		int result = service.insertMember(member);
		if(result < 1) {
			rttr.addFlashAttribute("msg","회원가입 실패");
			System.out.println("가입실패");
			mv.setViewName("redirect:/");
		} else {
			rttr.addFlashAttribute("msg","회원가입 성공");
			System.out.println("가입성공");
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@GetMapping("/login")
	public String pageLogin() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public ModelAndView selectLogin(
			ModelAndView mv
			, Member member
			, RedirectAttributes rttr
			, HttpSession session) {
//?		if (pwEncoding.matches(null, null))
		
//암호화	member.setPasswd(pwEncoding.encode(member.getPasswd()));
		Member result = service.selectLogin(member);
		if (result == null) {
			rttr.addFlashAttribute("msg", "로그인에 실패했습니다. 아이디와 패스워드를 다시 확인하고 로그인 시도해 주세요.");
			mv.setViewName("redirect:/member/login");
			System.out.println("로그인 실패");
			return mv;
		}
		session.setAttribute("loginSsInfo", result);
		rttr.addFlashAttribute("msg", result.getM_name() + "님 로그인 되었습니다.");
		System.out.println("로그인 성공");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@GetMapping("/logout")
	public String pageLogout(
			HttpSession session) {
		session.removeAttribute("loginSsInfo");
		return "redirect:/";
	}
	
	@PostMapping("/profileUpdate.ax")
	public String profile(
			@RequestParam (name = "fileUrl", required = false) String filename) {
		return filename;
	}
	
	@PostMapping("/idCheck.ax")
	@ResponseBody
	public int idCheck(
			@RequestParam (name = "m_id", required = false) String m_id) {
		int result = service.idCheck(m_id);
		return result;
	}
	
	@PostMapping("/nicknameCheck.ax")
	@ResponseBody
	public int nicknameCheck(
			@RequestParam (name = "m_nickname", required = false) String m_nickname) {
		int result = service.nicknameCheck(m_nickname);
		return result;
	}
	
	@PostMapping("/emailCheck.ax")
	@ResponseBody
	public int emailCheck(
			@RequestParam (name = "m_email", required = false) String m_email) {
		int result = service.emailCheck(m_email);
		return result;
	}
	
	@PostMapping("/phoneCheck.ax")
	@ResponseBody
	public int phoneCheck(
			@RequestParam (name = "m_phone", required = false) int m_phone) {
		int result = service.phoneCheck(m_phone);
		return result;
	}
	
	@GetMapping("/findId")
	public String PageFindId() {
		return "member/findId";
	}
	
	@PostMapping("/findId")
	public ModelAndView findId(
			ModelAndView mv
			, Member member) {
		Member result = service.findId(member);
		if (result == null) {
			System.out.println("아이디 찾기 실패");
		} else {
			System.out.println("아이디 찾기 성공");
			mv.addObject("member", result);
			mv.setViewName("member/findIdA");
		}
		return mv;
	}
	
	@GetMapping("/findIdA")
	public String pageFindIdA() {
		return "member/findIdA";
	}
	
	@PostMapping("/findIdA")
	public ModelAndView findIdA(
			ModelAndView mv
			, Member member) {
		int result = service.findPwA(member);
		if (result < 1) {
			System.out.println("비밀번호 변경 실패");
		} else {
			System.out.println("비밀번호 변경 성공");
			mv.setViewName(null);
		}
		return mv;
	}
	
	@GetMapping("/findPw")
	public String pageFindPw() {
		return "member/findPw";
	}
	
	@PostMapping("/findPw")
	public ModelAndView findPw(
			ModelAndView mv
			, Member member) {
		Member result = service.findPw(member);
		if (result == null) {
			System.out.println("비밀번호 찾기 실패");
		} else {
			System.out.println("비밀번호 찾기 성공");
			mv.addObject("member", result);
			mv.setViewName("member/findPwA");
		}
		return mv;
	}
	
	@GetMapping("/findPwA")
	public String pageFindPwA() {
		return "member/findPwA";
	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView handlerBoardException(Exception e) { // 얘가 최상이라 아래거로 들어갈 일 없어.
		logger.error(e.getMessage());
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", "오류");
		mv.setViewName("redirect:/");
		return mv;
	}
}
