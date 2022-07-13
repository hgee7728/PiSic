package kh.spring.pisic.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.admin.model.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/editArtist")
	public ModelAndView EditArtistPage(ModelAndView mv) { 
		mv.addObject("aristList",  service.selectArtistList());
		mv.setViewName("admin/editArtist");
		
		return mv; 
	}

}
