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
		
		return "member/login";
	}
	
	@GetMapping("/join")
	public String pageInsertMember() {
		return "member/join";
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
}
