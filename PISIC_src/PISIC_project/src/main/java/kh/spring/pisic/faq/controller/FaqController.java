package kh.spring.pisic.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.faq.model.dao.*;
import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.service.*;
import kh.spring.pisic.sound.domain.Artist;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService service;
	
	@GetMapping("/faqList")
	public ModelAndView pageSelectFaq(ModelAndView mv) {
		List<FaqBoard> faqBoard = service.selectFaqBoard();
		mv.addObject("faqBoard", faqBoard);
		mv.setViewName("faq/faqList");
		return mv;
	}
	
	@GetMapping("/insertFaq")
	public String InsertFaq() {
		return "faq/insertFaq";
	}

	@PostMapping("/insertFaq")
	public ModelAndView InsertFaqBoard(ModelAndView mv, 
			FaqBoard faqBoard, 
			HttpServletRequest req, 
			HttpSession session,
			RedirectAttributes rttr) throws Throwable {

		int result = service.insertFaq(faqBoard);

		System.out.println("{{{{{{{{{{"+result);
		if (result == 0) {
			rttr.addFlashAttribute("msg", "faq 추가에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/faq/insertFaq");
		} else {
			rttr.addFlashAttribute("msg", "faq 추가 성공하였습니다");
			mv.setViewName("redirect:/faq/faqList");
		}
		return mv;
	}
	
	@GetMapping("/updateFaq")
	public ModelAndView UpdateFaqBoard(ModelAndView mv
			,@RequestParam(name="faq_no", defaultValue = "0") int faq_no) {
		
		mv.addObject("faqBoard", service.selectFaq(faq_no));
		mv.setViewName("faq/updateFaq");
		
		return mv;
		
	}
	
	@PostMapping("/updateFaq")
	public ModelAndView UpdateFaqBoard(ModelAndView mv
			, FaqBoard faqBoard
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr) throws Throwable { 
		
		int result = service.updateFaq(faqBoard);
		
		if(result==0) {
			rttr.addFlashAttribute("msg", "FAQ 정보 수정에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/faq/faqList");
		}else {
			rttr.addFlashAttribute("msg", "FAQ 정보 수정 성공하였습니다.");
		mv.setViewName("redirect:/faq/faqList");
		}
		return mv; 
	}
	
	@ResponseBody
	@PostMapping(value="deleteFaq", produces = "text/plain;charset=UTF-8")
	public String deleteFaq(
			@RequestParam(name = "faq_no", required = false) int faq_no
			) throws Throwable {
		int result = service.deleteFaq(faq_no);
		
		if(result<1) {
			return "0";
		}else {
			return "1";
		}
	}




}
