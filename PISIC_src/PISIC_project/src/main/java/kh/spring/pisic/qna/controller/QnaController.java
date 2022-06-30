package kh.spring.pisic.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.pisic.qna.model.service.QnaServiceImpl;

@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger Logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaServiceImpl service;
	
	@GetMapping("/list")
	public String pageSelectQna() {
		return "qna/list";
	}
	
	
	

}
