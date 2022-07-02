package kh.spring.pisic.mymusic.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.service.MyMusicService;

@Controller
@RequestMapping("/mymusic")
public class MyMusicController {
	
	@Autowired
	private MyMusicService service;
	
	@ResponseBody
	@PostMapping("/playlist.ax")
	public List<MyMusic> selectPlaylist(
			HttpSession session
			) {
		System.out.println("ajax 들어옴");
		
		Member member = (Member)session.getAttribute("loginSsInfo");
		System.out.println(member.getM_id());
		List<MyMusic> result = service.selectPlaylistName(member.getM_id());
		return result;
	}
}
