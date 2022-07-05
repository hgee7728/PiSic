package kh.spring.pisic.pymusic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.pymusic.model.service.PymusicService;
import kh.spring.pisic.sound.domain.Sound;

@Controller
@RequestMapping("/pymusic")
public class PymusicController {
	@Autowired
	private PymusicService service;
	
	@RequestMapping(value = {"/", "/pymusicMain"}, method = RequestMethod.GET)
	public String mainPage() {
		return "pymusic/pymusicMain";
	}

	@GetMapping("/local")
	public ModelAndView LocationPy(ModelAndView mv) {
		List<Sound> pyLocal = service.selectPyLocal();
		
		mv.addObject("pyLocal", pyLocal);
		mv.setViewName("pymusic/local");
		return mv;
		
	}
}
