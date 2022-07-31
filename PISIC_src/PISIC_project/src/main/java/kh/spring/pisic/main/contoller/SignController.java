package kh.spring.pisic.main.contoller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.RedirectUrlBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class SignController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/login")
	public String pageLogin(
			HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, Model model) throws UnsupportedEncodingException {
		String returnUrl = request.getHeader("Referer");
		if (returnUrl != null && !returnUrl.contains("/login")) {
//			session.setAttribute("prevPage", returnUrl);
			request.getSession().setAttribute("prevPage", returnUrl);
		}
		System.out.println("===========================================" + returnUrl);
		
		return "sign/login";
	}
	
	// 스프링 시큐리티 대체
//	@PostMapping("/login")
//	public ModelAndView loginCheck(
//			ModelAndView mv
//			, Member member
//			, RedirectAttributes rttr
//			, HttpSession session) {
////		if (pwEncoding.matches(null, null))
//		
////	member.setPasswd(pwEncoding.encode(member.getPasswd()));
//		
//		// login 세선이 존재하면 제거
//		if (session.getAttribute("loginSsInfo") != null) {
//			session.removeAttribute("loginSsInfo");
//		}
//		
//		Member result = service.loginCheck(member);
//		
//		if (result != null) {
//			session.setAttribute("loginSsInfo", result);
//			System.out.println("로그인 성공");
//			mv.setViewName("redirect:/");
//		} else {
//			System.out.println("로그인 실패");
//			mv.setViewName("redirect:/member/login");
//		}
//		return mv;
//	}
	
	// 스프링 시큐리티 대체
//	@GetMapping("/logout")
//	public String pageLogout(
//			HttpSession session) {
//		// 세션 초기화
//		session.invalidate();
////		session.removeAttribute("loginSsInfo");
//		return "redirect:/";
//	}
	
	@GetMapping("/join")
	public String pageInsertMember() {
		return "sign/join";
	}
	
	@PostMapping("/join")
	public ModelAndView insertMember(
			ModelAndView mv
			, Member member
			, RedirectAttributes rttr) {
		
		// 암호화
		String endcodedPassword = bCryptPasswordEncoder.encode(member.getM_password());
		member.setM_password(endcodedPassword);
		
		int result = service.insertMember(member);
		if(result < 1) {
			System.out.println("회원가입실패");
			mv.addObject("msg", "회원가입에 실패하였습니다.");
			mv.setViewName("redirect:/");
		} else {
			System.out.println("회원가입성공");
			mv.addObject("msg", "회원가입에 성공하였습니다.");
			mv.setViewName("redirect:/");
		}
		return mv;
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
		return "sign/findId";
	}
	
	@PostMapping("/findId")
	public ModelAndView findId(
			ModelAndView mv
			, Member member
			, RedirectAttributes rttr) {
		Member result = service.findId(member);
		if (result == null) {
			System.out.println("아이디 찾기 실패");
			mv.addObject("msg", "입력하신 정보와 일치하는 계정이 없습니다.");
			mv.setViewName("sign/findId");
		} else {
			System.out.println("아이디 찾기 성공");
			mv.addObject("member", result);
			mv.setViewName("sign/findIdA");
		}
		return mv;
	}
	
	@GetMapping("/findIdA")
	public String pageFindIdA() {
		return "sign/findIdA";
	}
	
	@GetMapping("/findPw")
	public String pageFindPw() {
		return "sign/findPw";
	}
	
	@PostMapping("/findPw")
	public ModelAndView findPw(
			ModelAndView mv
			, Member member
			, RedirectAttributes rttr) {
		Member result = service.findPw(member);
		if (result == null) {
			System.out.println("비밀번호 찾기 실패");
			mv.addObject("msg", "입력하신 정보와 일치하는 계정이 없습니다.");
			mv.setViewName("sign/findPw");
		} else {
			System.out.println("비밀번호 찾기 성공");
			mv.addObject("member", result);
			mv.setViewName("sign/findPwA");
		}
		return mv;
	}
	
	@GetMapping("/findPwA")
	public String pageFindPwA() {
		return "sign/findPwA";
	}
	
	@PostMapping("/findPwA")
	public ModelAndView findPwA(
			ModelAndView mv
			, Member member) {
		// 암호화
		String endcodedPassword = bCryptPasswordEncoder.encode(member.getM_password());
		member.setM_password(endcodedPassword);
		
		int result = service.findPwA(member);
		if (result < 1) {
			System.out.println("비밀번호 변경 실패");
			mv.addObject("msg", "비밀번호 변경에 실패하였습니다. 다시 시도해 주세요.");
			mv.setViewName("sign/findPw");
		} else {
			System.out.println("비밀번호 변경 성공");
			mv.addObject("msg", "비밀번호 변경에 성공하였습니다. 로그인 페이지로 이동합니다.");
			mv.setViewName("sign/login");
		}
		return mv;
	}
}
