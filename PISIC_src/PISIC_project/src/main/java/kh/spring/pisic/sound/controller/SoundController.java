package kh.spring.pisic.sound.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sound")
public class SoundController {
	
	@PostMapping("/play")
	public ModelAndView musicPlayer( ModelAndView mv
			, @RequestParam("post_data") String postData
			) {
		mv.setViewName("soundPlayer");
		return mv;
		
	}

}
