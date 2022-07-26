package kh.spring.pisic.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.search.model.service.SearchService;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Paging;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	
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
	
	// 검색 상세조회
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
		}
		if(type.equals("album")) {
			Paging paging = new Paging(cri, service.totalCntSearchAlbum(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("albumList", service.selectSearchAlbumAll(keyword, cri));
		}
		if(type.equals("artist")) {
			Paging paging = new Paging(cri, service.totalCntSearchArtist(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("artistList", service.selectSearchArtistAll(keyword, cri));
		}
		if(type.equals("board")) {
			Paging paging = new Paging(cri, service.totalCntSearchBoard(keyword));
	        mv.addObject("paging", paging);
			mv.addObject("boardList", service.selectSearchBoardAll(keyword, cri));
		}
		mv.addObject("keyword", keyword);
		mv.setViewName("search/searchAll");
		return mv;
	}
}
