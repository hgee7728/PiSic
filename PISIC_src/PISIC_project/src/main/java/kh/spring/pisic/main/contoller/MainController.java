package kh.spring.pisic.main.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.artist.model.service.ArtistService;

@Controller
public class MainController {
	@Autowired
	private ArtistService service;

	
	@GetMapping("/") 
	public ModelAndView MainPage(ModelAndView mv) { 
		List<kh.spring.pisic.sound.domain.Artist> artistRandom = service.selectArtistRandom();
		mv.addObject("artistRandom", artistRandom);
		mv.setViewName("main");
		return mv; 
	}
	

	
	
	
	
	@GetMapping("/test")
	public ModelAndView testPage(
			ModelAndView mv
			) {
		
		mv.setViewName("testMain");
		return mv;
	}
}
