package kh.spring.pisic.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.admin.model.service.AdminService;
import kh.spring.pisic.sound.domain.Artist;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/artist")
	public ModelAndView SearchArtistPage(ModelAndView mv) { 
		mv.addObject("aristList",  service.selectArtistList());
		mv.setViewName("admin/searchArtist");
		return mv; 
	}
	
	@GetMapping("/artist.do")
	@ResponseBody
	public List<Artist> SearchArtistAjax(ModelAndView mv, @RequestParam("keyword") String keyword) { 
		Artist artist = new Artist();
		artist.setKeyword(keyword);
		return service.selectArtistAjax(keyword); 
	}
	
	@GetMapping("/artistEdit")
	public ModelAndView EditArtistPage(ModelAndView mv, @RequestParam(name = "artist_no", required = false) String artist_no) { 
		//mv.addObject("artist_no", artist_no);
		mv.addObject("artistInfo",  service.selectArtist(artist_no));
		
		mv.setViewName("admin/editArtist");
		return mv; 
	}
	
	@GetMapping("/artistAdd")
	public ModelAndView AddArtistPage(ModelAndView mv) { 
		
		mv.setViewName("admin/addArtist");
		return mv; 
	}
	
	@GetMapping("/test")
	public String TestPage() {
		return "pymusic/test";
	}

}
