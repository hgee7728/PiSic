package kh.spring.pisic.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.faq.model.dao.*;
import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.service.*;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqServiceImpl service;
	
	@GetMapping("/faqList")
	public ModelAndView pageSelectFaq(ModelAndView mv) {
		List<FaqBoard> faqlist = service.pageSelectFaq();
		mv.addObject("faqlist", faqlist);
		mv.setViewName("faq/faqList");
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView selectFaqBoard(ModelAndView mv
			, @RequestParam(name="faq_no", required = false) String faq_no 
			) {
		if(faq_no == null) {
			mv.setViewName("redirect:/faq/list");
			return mv;
		}
		mv.addObject("faq", service.selectFaqBoard(faq_no));
		mv.setViewName("faq/read");
		return mv;
	}

}
