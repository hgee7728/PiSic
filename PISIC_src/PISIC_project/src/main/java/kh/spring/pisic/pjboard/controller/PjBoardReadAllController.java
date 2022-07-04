package kh.spring.pisic.pjboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.pisic.pjboard.model.service.PjBoardServiceImpl;

@Controller
@RequestMapping("/pjlounge")
public class PjBoardReadAllController {
	private static final Logger Logger = LoggerFactory.getLogger(PjBoardReadAllController.class);
	
	@Autowired
	private PjBoardServiceImpl service;
	
	@GetMapping("/main")
	public String mainSelectPj() {
		return "pjlounge/main";
	}
}
