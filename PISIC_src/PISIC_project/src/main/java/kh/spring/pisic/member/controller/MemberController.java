package kh.spring.pisic.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
			, RedirectAttributes rttr
			) {
		
		int result = service.insertMember(member);
		if(result < 1) {
			rttr.addFlashAttribute("msg","회원가입 실패");
			mv.setViewName("redirect:/");
		} else {
			rttr.addFlashAttribute("msg","회원가입 성공");
			mv.setViewName("redirect:/");
		}
	
		return mv;
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
