package kh.spring.pisic.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.admin.model.service.AdminService;
import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.sound.domain.Artist;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	
	/*아티스트 관리자 페이지*/
	@GetMapping("/artist")
	public ModelAndView SearchArtistPage(ModelAndView mv) { 
		mv.addObject("aristList",  service.selectArtistList());
		mv.setViewName("admin/searchArtist");
		return mv; 
	}
	
	/*아티스트 검색*/
	@GetMapping("/artist.do")
	@ResponseBody
	public List<Artist> SearchArtistAjax(ModelAndView mv, @RequestParam("keyword") String keyword) { 
		Artist artist = new Artist();
		artist.setKeyword(keyword);
		return service.selectArtistAjax(keyword); 
	}
	
	/*아티스트 수정 페이지로 이동*/
	@GetMapping("/editArtist")
	public ModelAndView EditArtistPage(ModelAndView mv
			, @RequestParam(name = "artist_no", defaultValue = "0") String artist_no) {
		int artist_no_new = 0;
		try {
			artist_no_new = Integer.parseInt(artist_no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("artistInfo",  service.selectArtist(artist_no));
		mv.addObject("artist_no", artist_no_new);
		mv.setViewName("admin/editArtist");
		return mv; 
	}
	
	@PostMapping("/editArtist")
	public ModelAndView EditArtist(ModelAndView mv
			, Artist artist
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr) throws Throwable { 
		Member loginInfo = (Member)session.getAttribute("loginSsInfo");
		if(loginInfo == null) {
			rttr.addFlashAttribute("msg", "관리자로 접근하여 다시 시도해 주세요.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		int result = service.updateArtist(artist);
		
		if(result==0) {
			rttr.addFlashAttribute("msg", "아티스트 정보 수정에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/admin/artist");
		}else {
			rttr.addFlashAttribute("msg", "아티스트 정보 수정 성공하였습니다.");
		mv.setViewName("redirect:/admin/artist");
		}
		return mv; 
	}
	
	/*아티스트 추가 페이지로 이동*/
	@GetMapping("/addArtist")
	public ModelAndView AddArtistPage(ModelAndView mv
			, @RequestParam(name = "artist_no", defaultValue = "0") String artist_noStr) {
		int artist_no = 0;
		try {
			artist_no = Integer.parseInt(artist_noStr);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("artist_no", artist_no);
		mv.setViewName("admin/addArtist");
		
		return mv;
	}
	
	/*아티스트 추가하기*/
	@PostMapping("/addArtist")
	public ModelAndView AddArtist(ModelAndView mv
			, Artist artist
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr) throws Throwable { 
		Member loginInfo = (Member)session.getAttribute("loginSsInfo");
		if(loginInfo == null) {
			rttr.addFlashAttribute("msg", "관리자로 접근하여 다시 시도해 주세요.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		

		
		int result = service.insertArtist(artist);
		
		if(result==0) {
			rttr.addFlashAttribute("msg", "아티스트 추가에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/admin/artist");
		}else {
			rttr.addFlashAttribute("msg", "아티스트 추가 성공하였습니다");
		mv.setViewName("redirect:/admin/artist");
		}
		return mv; 
	}
	
	/*아티스트 삭제하기*/
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
