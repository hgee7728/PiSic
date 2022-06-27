package kh.spring.pisic.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.service.*;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqServiceImpl service;
	
	@GetMapping("/list")
	public String pageSelectFaq() {
		return "faq/list";
	}
	

}
