package kh.spring.pisic.admin.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		mv.addObject("artistInfo",  service.selectArtist(artist_no));
		
		mv.setViewName("admin/editArtist");
		return mv; 
	}
	
	
	@GetMapping("/artistAdd")
	public ModelAndView AddArtistPage(ModelAndView mv
			, @RequestParam(name = "artist_no", defaultValue = "0") String artist_no) {
		mv.addObject("artist_no", artist_no);
		mv.setViewName("admin/addArtist");
		
		return mv;
	}
	
	@PostMapping("/artistAdd")
	public ModelAndView AddArtist(ModelAndView mv
			, Artist artist
			, RedirectAttributes rttr) throws Throwable { 
		int result = service.insertArtist(artist);
		
		if(result==0) {
			rttr.addFlashAttribute("msg", "아티스트 추가에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/admin/addArtist");
		}else {
		mv.setViewName("redirect:/admin/searchArtist");
		}
		return mv; 
	}
	
	@ResponseBody
	@PostMapping(value = "/delete", produces = "text/plain;charset=UTF-8")
	public String deleteArtist(
			@RequestParam(name="artist_no", required = false) String artist_no
			) throws Throwable{
		int result = service.deleteArtist(artist_no);
		
		String msg;
		if(result>0) {
			msg="게시글 "+artist_no+"번이 삭제되었습니다.";
		}else {
			msg="게시글 삭제를 하지못했습니다. 다시 시도해주세요.";
		}
		return msg;
	}
	
	
	
	@GetMapping("/test")
	public String TestPage() {
		return "pymusic/test";
	}

}
