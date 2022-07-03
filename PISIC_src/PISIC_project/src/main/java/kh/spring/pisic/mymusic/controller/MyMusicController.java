package kh.spring.pisic.mymusic.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.service.MyMusicService;
import kh.spring.pisic.sound.domain.Sound;

@Controller
@RequestMapping("/mymusic")
public class MyMusicController {
	
	@Autowired
	private MyMusicService service;
	
	
	// 플레이 리스트 목록 조회 - ajax
	@ResponseBody
	@PostMapping("/playlist.ax")
	public List<MyMusic> selectPlaylist(
			HttpSession session
			) {
		System.out.println("ajax 들어옴");
		
		Member member = (Member)session.getAttribute("loginSsInfo");
		System.out.println(member.getM_id());
		List<MyMusic> result = service.selectPlaylist(member.getM_id());
		return result;
	}
	
	// 플레이 리스트에 노래 담기
	@ResponseBody
	@PostMapping("/insertSound")
	public String insertSound(
			ModelAndView mv
			, @RequestParam("a_no") int[] a_no
			, @RequestParam("s_no") int[] s_no
			, @RequestParam("l_no") int l_no
			, HttpSession session
			) {
		
		List<Sound> soundList = new ArrayList<Sound>();
		Member member = (Member)session.getAttribute("loginSsInfo");
		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < s_no.length; i++) {
			Sound sound = new Sound();
			System.out.println(a_no[i]);
			System.out.println(s_no[i]);
			sound.setA_no(a_no[i]);
			sound.setS_no(s_no[i]);
			sound.setL_no(l_no);
			sound.setM_id(member.getM_id());
			soundList.add(sound);
		}
		System.out.println("[[[soundList]]] : " + soundList);
		int result = service.insertSound(soundList);
		if(result < 1) {
			return "0";
		} else {
			return "1";
		}
	}
}
