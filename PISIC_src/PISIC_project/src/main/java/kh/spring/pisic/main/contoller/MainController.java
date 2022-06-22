package kh.spring.pisic.main.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String MainPage() {
		return "main";
	}
	
	
	
	
	
	
	@GetMapping("/test")
	public String testPage() {
		return "testMain";
	}
}
