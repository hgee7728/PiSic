package kh.spring.pisic.pjboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.pjboard.model.service.PjBoardServiceImpl;

@Controller
@RequestMapping("/pjlounge")
public class PjBoardController {
	private static final Logger Logger = LoggerFactory.getLogger(PjBoardController.class);
	
	@Autowired
	private PjBoardServiceImpl service;
	
	@GetMapping("/pjlounge_list")
	public String mainSelectPj() {
		return "pjlounge/pjlounge_list";
	}
	@GetMapping("/pjlounge_read")
	public String readPjList() {
		return "pjlounge/pjlounge_read";
	}
	@GetMapping("/pjlounge_write")
	public ModelAndView pageInsertPj(ModelAndView mv
			, @RequestParam(name="b_no", defaultValue = "0") String refnumStr
			)  throws Throwable {
		int b_no = 0;
		try {
			b_no = Integer.parseInt(refnumStr);
		}catch (Exception e) {
		}
		mv.addObject("b_no", b_no);
		mv.setViewName("pjlounge/pjlounge_write");
		return mv;
	}
}
