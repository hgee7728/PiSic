package kh.spring.pisic.pymusic.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.pymusic.model.service.PymusicService;

@Controller
@RequestMapping("/pymusic")
public class PymusicController {
	@Autowired
	private PymusicService service;
	
	@GetMapping(value = {"/", "/pymusicMain"})
	public String mainPage() {
		return "pymusic/pymusicMain";
	}

	@GetMapping("/area")
	public ModelAndView PyAreaPage (ModelAndView mv, Model model, int area_code) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyArea", service.selectPyArea(area_code));
		mv.setViewName("pymusic/area");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	
	@GetMapping("/genre")
	public ModelAndView PyGenrePage (ModelAndView mv, Model model, int g_no) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyGenre", service.selectPyGenre(g_no));
		mv.setViewName("pymusic/genre");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	
	@GetMapping("/agender")
	public ModelAndView PyAgenderPage (ModelAndView mv, Model model, String agender) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyAgender", service.selectPyAgender(agender));
		mv.addObject("agender", agender);
		mv.setViewName("pymusic/agender");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
}
