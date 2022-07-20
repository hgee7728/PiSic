package kh.spring.pisic.main.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.artist.model.service.ArtistService;
import kh.spring.pisic.chart.model.service.ChartService;
import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

@Controller
public class MainController {
	@Autowired
	private ArtistService serviceA;

	@Autowired
	private ChartService serviceC;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping(value = {"/", "/main"})
	public ModelAndView MainPage(ModelAndView mv, Model model) { 
		List<Artist> artistRandom = serviceA.selectArtistRandom();
		mv.addObject("artistRandom", artistRandom);
		
		mv.addObject("chartDetail", serviceC.selectChartTopTen("top", 10));
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		mv.setViewName("main");
		return mv; 
	}
	
	@GetMapping("/login")
	public String pageLogin(
			HttpSession session
			, HttpServletRequest request) {
		String returnUrl = request.getHeader("Referer");
		if (returnUrl != null && !returnUrl.contains("/login")) {
			session.setAttribute("prevPage", returnUrl);
		}
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
	
	@GetMapping("/test")
	public ModelAndView testPage(
			ModelAndView mv
			) {
		
		mv.setViewName("testMain");
		return mv;
	}
	
	@GetMapping("/test/list")
	public String pageListMember(
			HttpSession session) {
		session.setAttribute("memberList", service.listMember());
		session.setAttribute("adminList", service.listAdmin());
		return "member/list";
	}
}
