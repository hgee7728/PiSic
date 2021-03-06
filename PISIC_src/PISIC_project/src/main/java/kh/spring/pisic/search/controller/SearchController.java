package kh.spring.pisic.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.search.model.service.SearchService;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Paging;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	@Autowired
	private MemberService memberService;
	
	// 통합 검색 - 요약
	@GetMapping("/searchKeyword")
	public ModelAndView searchResultPage(ModelAndView mv, @RequestParam(name="keyword", defaultValue = "") String keyword) {
		
		
		mv.addObject("soundList", service.selectSearchSound(keyword));
		mv.addObject("searchSoundCnt", service.totalCntSearchSound(keyword));
		mv.addObject("albumList", service.selectSearchAlbum(keyword));
		mv.addObject("searchAlbumCnt", service.totalCntSearchAlbum(keyword));
		mv.addObject("artistList", service.selectSearchArtist(keyword));
		mv.addObject("searchArtistCnt", service.totalCntSearchArtist(keyword));
		mv.addObject("boardList", service.selectSearchBoard(keyword));
		mv.addObject("searchBoardCnt", service.totalCntSearchBoard(keyword));
		mv.addObject("keyword", keyword);
		mv.setViewName("search/searchPage");
		return mv;
	}
	
	// 검색 상세조회 - 페이징
	@GetMapping("/searchDetail")
	public ModelAndView searchDetailPage(ModelAndView mv
			, @RequestParam(name="type", required = false) String type
			, @RequestParam(name="keyword", required = false) String keyword
			, Criteria cri
			) {
		
		if(type.equals("sound")) {
			Paging paging = new Paging(cri, service.totalCntSearchSound(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("soundList", service.selectSearchSoundAll(keyword, cri));
			mv.addObject("searchSoundCnt", service.totalCntSearchSound(keyword));
		}
		if(type.equals("album")) {
			Paging paging = new Paging(cri, service.totalCntSearchAlbum(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("albumList", service.selectSearchAlbumAll(keyword, cri));
			mv.addObject("searchAlbumCnt", service.totalCntSearchAlbum(keyword));
		}
		if(type.equals("artist")) {
			Paging paging = new Paging(cri, service.totalCntSearchArtist(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("artistList", service.selectSearchArtistAll(keyword, cri));
			mv.addObject("searchArtistCnt", service.totalCntSearchArtist(keyword));
		}
		if(type.equals("board")) {
			Paging paging = new Paging(cri, service.totalCntSearchBoard(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("boardList", service.selectSearchBoardAll(keyword, cri));
			mv.addObject("searchBoardCnt", service.totalCntSearchBoard(keyword));
		}
		mv.addObject("keyword", keyword);
		mv.setViewName("search/searchAll");
		return mv;
	}
	
	// 플레이 리스트 만들기 - 곡 검색
	@GetMapping("/searchSound")
	@ResponseBody
	public String searchSound(@RequestParam(name="keyword", required = false) String keyword) {
		
		return new Gson().toJson(service.selectSearchSoundPlaylist(keyword));
	}
	
	// pjBoard 검색
	@GetMapping("/searchBoard")
	public ModelAndView searchBoard(
			ModelAndView mv
			, Criteria cri
			, @RequestParam(name="keyword", required = false) String keyword
			, @RequestParam(name="type", required = false) int type
			, Authentication auth
			, RedirectAttributes rttr
			) {
		
		if(auth == null) {
			rttr.addFlashAttribute("msg", "로그인 후 이용해 주세요");
			mv.setViewName("redirect:/pjBoard/list");
		} else {
			if(type == -1) {
				UserDetails ud = (UserDetails)auth.getPrincipal();
				Member member = memberService.selectLoginMember(ud.getUsername());
				keyword = member.getM_nickname();
				type = 2;
			}
			Paging paging = new Paging(cri, service.totalCntSearchBoardWithType(keyword, type));
	        mv.addObject("paging", paging);
			mv.addObject("boardList", service.selectSearchBoardWithType(keyword, cri, type));
			mv.addObject("searchBoardCnt", service.totalCntSearchBoardWithType(keyword, type));
			mv.addObject("keyword", keyword);
			mv.addObject("type", type);
			mv.setViewName("pjBoard/searchList");
			
		}
		
		return mv;
	}
	
	
	
}
