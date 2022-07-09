package kh.spring.pisic.mymusic.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.service.MyMusicService;
import kh.spring.pisic.sound.domain.Sound;

@Controller
@RequestMapping("/mymusic")
public class MyMusicController {
	
	@Autowired
	private MyMusicService service;
	
	
	// 플레이 리스트 이름 조회(모달창) - ajax
	@ResponseBody
	@PostMapping("/playlist.ax")
	public List<MyMusic> selectPlaylistName(
			HttpSession session
			) {
		System.out.println("플레이 리스트 목록 ajax 들어옴");
		
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
			, @RequestParam(name="a_no", required = false) String[] a_noArr
			, @RequestParam(name="s_no", required = false) String[] s_noArr
			, @RequestParam(name="l_no", required = false) String l_no
			, HttpSession session
			) {
		System.out.println("s_noArr.length: "+s_noArr.length);
		List<Sound> soundList = new ArrayList<Sound>();
		Member member = (Member)session.getAttribute("loginSsInfo");
		// number 파싱 try-catch
		try {
			// 들고 온 데이터 domain형태로 list 시키기
			for (int i = 0; i < s_noArr.length; i++) {
				Sound sound = new Sound();
				try {
					sound.setA_no(Integer.parseInt(a_noArr[i]));
					sound.setS_no(Integer.parseInt(s_noArr[i]));
					sound.setL_no(Integer.parseInt(l_no));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
				sound.setM_id(member.getM_id());
				soundList.add(sound);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		System.out.println("[[[soundList]]] : " + soundList);
		int result = service.insertSound(soundList);
		if(result < 1) {
			return "0";
		} else {
			return "1";
		}
	}
	
	// 새 플레이 리스트 만들기
	@GetMapping("/insertPlaylist")
	public ModelAndView pageInsertPlaylist(
			ModelAndView mv
			, HttpSession session
			) {
		// TODO 로그인 여부
		Member member = (Member)session.getAttribute("loginSsInfo");
		mv.addObject("mymusicList",service.selectPlaylist(member.getM_id()));
		mv.setViewName("mymusic/insertPlaylist");
		return mv;
	}
	@PostMapping("/insertPlaylist")
	public ModelAndView insertPlaylist(
			ModelAndView mv
			, MyMusic mymusic
			) {
		
		mv.setViewName("redirect:/mymusic/selectPlaylist");
		return mv;
	}
	
	// 플레이 리스트 목록 조회
	@GetMapping("/selectPlaylist")
	public ModelAndView pageSelectPlaylist(ModelAndView mv, HttpSession session) {
		
		// TODO 로그인 여부
		Member member = (Member)session.getAttribute("loginSsInfo");
		
		mv.addObject("listPlaylist", service.selectPlaylist(member.getM_id()));
		mv.setViewName("mymusic/listPlaylist");
		return mv;
	}
	
	// 플레이 리스트 삭제
	@PostMapping("/deletePlaylist")
	public ModelAndView deletePlaylist(ModelAndView mv, HttpSession session, @RequestParam("l_no") int[] l_noArr, RedirectAttributes rttr) {
		// TODO 로그인 여부
		Member member = (Member)session.getAttribute("loginSsInfo");
		
		List<MyMusic> mymusicList = new ArrayList<MyMusic>();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < l_noArr.length; i++) {
			MyMusic mymusic = new MyMusic();
			System.out.println(l_noArr[i]);
			mymusic.setL_no(l_noArr[i]);
			mymusic.setM_id(member.getM_id());
			mymusicList.add(mymusic);
		}
		// 플레이 리스트 삭제
		int result = service.deletePlaylist(mymusicList);
		if(result < 1) { // 삭제 실패
			rttr.addFlashAttribute("msg","플레이리스트 삭제가 실패했습니다");
		} else {
			rttr.addFlashAttribute("msg","플레이리스트를 삭제했습니다.");
		}
		mv.setViewName("redirect:/mymusic/selectPlaylist");
		return mv;
	}
	// 플레이 리스트 만들기(담을 곡으로 옮기기) - ajax
	@PostMapping("/selectSoundList")
	@ResponseBody
	public List<Sound> selectSound(@RequestParam(name="a_no", required = false) String[] a_noArr,
			@RequestParam(name="s_no", required = false) String[] s_noArr) {
		List<Sound> soundList = new ArrayList<Sound>();
		
		// number 파싱 try-catch
		try {
			// 들고 온 데이터 domain형태로 list 시키기
			for (int i = 0; i < s_noArr.length; i++) {
				Sound sound = new Sound();
				sound.setA_no(Integer.parseInt(a_noArr[i]));
				sound.setS_no(Integer.parseInt(s_noArr[i]));
				soundList.add(sound);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		System.out.println("controller result :" + service.selectSoundList(soundList));
		return service.selectSoundList(soundList);
	}
	
	// 최근 들은 곡 - ajax
	@PostMapping("/selectSoundRecent")
	@ResponseBody
	public List<Sound> selectSoundRecent(HttpSession session){
		// TODO 로그인 여부
		Member member = (Member)session.getAttribute("loginSsInfo");
		
		return service.selectSoundRecent(member.getM_id());
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
