package kh.spring.pisic.main.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@GetMapping("/")
	public String MainPage() {
		return "main";
	}
	
	
	
	
	
	
	@GetMapping("/test")
	public ModelAndView testPage(
			ModelAndView mv
			) {
		
		mv.setViewName("testMain");
		return mv;
	}
}
