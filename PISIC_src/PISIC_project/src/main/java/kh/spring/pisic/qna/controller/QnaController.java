package kh.spring.pisic.qna.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.model.service.*;
import kh.spring.pisic.qna.model.service.QnaServiceImpl;

@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger Logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaServiceImpl service;
	
	@GetMapping("/qnaList")
	public ModelAndView pageSelectQna(ModelAndView mv) {
		List<QnaBoard> qnalist = service.pageSelectQna();
		mv.addObject("qnalist", qnalist);
		mv.setViewName("qna/qnaList");
		return mv;
	}
	@GetMapping("/qnaRead")
	public ModelAndView selectQnaBoard(ModelAndView mv
			, @RequestParam(name="qna_no", required = false) String qna_no  
			)  throws Throwable{
		if(qna_no == null) {
			mv.setViewName("redirect:qna/qnaList");
			return mv;
		}
		mv.addObject("qnaBoard", service.selectQnaBoard(qna_no));
		mv.setViewName("qna/qnaRead");
		return mv;
	}
	
	@GetMapping("/qnaWrite")
	public String pageWriteQna() {
		return "qna/qnaWrite";
	}
	
	
	

}
