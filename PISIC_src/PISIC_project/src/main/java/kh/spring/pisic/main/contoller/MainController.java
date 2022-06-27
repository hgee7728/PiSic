package kh.spring.pisic.main.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.artist.model.service.ArtistService;

@Controller
public class MainController {
	@Autowired
	private ArtistService service;

	
	@GetMapping("/") 
	public ModelAndView MainPage(ModelAndView mv, Model model) { 
		List<kh.spring.pisic.sound.domain.Artist> artistRandom = service.selectArtistRandom();
		mv.addObject("artistRandom", artistRandom);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		
		model.addAttribute("serverTime", formattedDate );
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
