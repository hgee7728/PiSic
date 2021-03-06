package kh.spring.pisic.mymusic.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.service.MyMusicService;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.model.service.SoundService;

@Controller
@RequestMapping("/mymusic")
public class MyMusicController {

	@Autowired
	private MyMusicService service;
	@Autowired
	private SoundService soundService;
	@Autowired
	private MemberService memberService;

	// 플레이 리스트 이름 조회(모달창) - ajax
	@ResponseBody
	@PostMapping(value = "/playlist.ax", produces = "text/plain;charset=UTF-8")
	public String selectPlaylistName(Authentication auth) {
		System.out.println("플레이 리스트 목록 ajax 들어옴");
		if(auth == null) {
			return "0";
		} else {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			return new Gson().toJson(service.selectPlaylist(ud.getUsername()));
		}
	}

	// 플레이 리스트에 노래 담기
	@ResponseBody
	@PostMapping(value = "/insertSound", produces = "text/plain;charset=UTF-8")
	public String insertSound(ModelAndView mv, @RequestParam(name = "a_no", required = false) String[] a_noArr,
			@RequestParam(name = "s_no", required = false) String[] s_noArr,
			@RequestParam(name = "l_no", required = false) String l_no, Authentication auth) {
		System.out.println("s_noArr.length: " + s_noArr.length);
		List<Sound> soundList = new ArrayList<Sound>();
		UserDetails ud = (UserDetails)auth.getPrincipal();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < s_noArr.length; i++) {
			Sound sound = new Sound();
			try { // number 파싱 try-catch
				sound.setA_no(Integer.parseInt(a_noArr[i]));
				sound.setS_no(Integer.parseInt(s_noArr[i]));
				sound.setL_no(Integer.parseInt(l_no));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			sound.setM_id(ud.getUsername());
			soundList.add(sound);
		}
		System.out.println("[[[soundList]]] : " + soundList);
		int result = service.insertSound(soundList);
		if (result < 1) {
			return "0";
		} else {
			return "1";
		}
	}

	// 새 플레이 리스트 만들기 - page
	@GetMapping("/insertPlaylist")
	public ModelAndView pageInsertPlaylist(ModelAndView mv, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mv.addObject("mymusicList", service.selectPlaylist(ud.getUsername()));
		mv.setViewName("mymusic/insertPlaylist");
		return mv;
	}
	// 새 플레이 리스트 만들기(담을 곡 가져가기) - page
	@PostMapping("/insertPlaylist")
	public ModelAndView pageInsertPlaylist(ModelAndView mv
			, Authentication auth
			, @RequestParam(name = "a_no", required = false) String[] a_noArr
			, @RequestParam(name = "s_no", required = false) String[] s_noArr) {
		
		UserDetails ud = (UserDetails)auth.getPrincipal();
		// 들고 온 데이터 domain형태로 list 시키기
		if(a_noArr != null && s_noArr != null) {
			List<Sound> soundList = new ArrayList<Sound>();
			for (int i = 0; i < s_noArr.length; i++) {
				Sound sound = new Sound();
				try { // number 파싱 try-catch
					sound.setA_no(Integer.parseInt(a_noArr[i]));
					sound.setS_no(Integer.parseInt(s_noArr[i]));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
				sound.setM_id(ud.getUsername());
				soundList.add(sound);
			}
			mv.addObject("soundList", service.selectSoundList(soundList));
		} 
		mv.addObject("mymusicList", service.selectPlaylist(ud.getUsername()));
		mv.setViewName("mymusic/insertPlaylist");
		return mv;
	}

	// 플레이 리스트 만들기
	@PostMapping("/insertPlaylist.do")
	@ResponseBody
	public String insertPlaylist(
			@RequestParam(name = "a_no", required = false) int[] a_noArr
			,@RequestParam(name = "s_no", required = false) int[] s_noArr
			, MyMusic mymusic, Authentication auth
			) {
		
		// 유저 정보 가져오기
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mymusic.setM_id(ud.getUsername());

		// 들고 온 데이터 domain형태로 list 시키기
		List<Sound> soundList = new ArrayList<Sound>();
		for (int i = 0; i < s_noArr.length; i++) {
			System.out.println("a_noArr: " + a_noArr[i]);
			System.out.println("s_noArr: " + s_noArr[i]);
			Sound sound = new Sound();
			try {
				sound.setA_no(a_noArr[i]);
				sound.setS_no(s_noArr[i]);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			sound.setM_id(ud.getUsername());
			soundList.add(sound);
		}
		
		// 플레이 리스트 만들기
		int result = service.insertPlaylist(mymusic, soundList);
		if (result < 1) { // 실패
			return "0";
		}

		return "1";
	}

	// 플레이 리스트 목록 조회
	@GetMapping("/playlist")
	public ModelAndView pageSelectPlaylist(ModelAndView mv, Authentication auth) {

		// TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();

		mv.addObject("listPlaylist", service.selectPlaylist(ud.getUsername()));
		mv.setViewName("mymusic/listPlaylist");
		return mv;
	}

	// 플레이 리스트 삭제
	@PostMapping("/deletePlaylist")
	public ModelAndView deletePlaylist(ModelAndView mv, Authentication auth, @RequestParam("l_no") int[] l_noArr,
			RedirectAttributes rttr) {
		UserDetails ud = (UserDetails)auth.getPrincipal();

		List<MyMusic> mymusicList = new ArrayList<MyMusic>();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < l_noArr.length; i++) {
			MyMusic mymusic = new MyMusic();
			System.out.println(l_noArr[i]);
			mymusic.setL_no(l_noArr[i]);
			mymusic.setM_id(ud.getUsername());
			mymusicList.add(mymusic);
		}
		// 플레이 리스트 삭제
		int result = service.deletePlaylist(mymusicList);
		if (result < 1) { // 삭제 실패
			rttr.addFlashAttribute("msg", "플레이리스트 삭제가 실패했습니다");
		} else {
			rttr.addFlashAttribute("msg", "플레이리스트를 삭제했습니다.");
		}
		mv.setViewName("redirect:/mymusic/playlist");
		return mv;
	}

	// 플레이 리스트에 담긴 곡 조회 - ajax
	@PostMapping(value = "/playlistSound", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectPlaylistSound(Authentication auth, MyMusic mymusic) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mymusic.setM_id(ud.getUsername());

		
		return new Gson().toJson(service.selectPlaylistSound(mymusic));
	}
	
	// 플레이 리스트에 담긴 곡 갯수 - ajax
	@PostMapping("/totalCntPlaylistSound")
	@ResponseBody
	public int totalCntPlaylistSound(Authentication auth, MyMusic mymusic) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mymusic.setM_id(ud.getUsername());

		
		return service.totalCntPlaylistSound(mymusic);
	}
	

	// 최근 들은 곡 조회 - ajax
	@PostMapping("/soundRecent")
	@ResponseBody
	public String selectSoundRecent(Authentication auth) {
		// TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();

		
		return new Gson().toJson(service.selectSoundRecent(ud.getUsername()));
	}

	// 자주 들은 곡 조회 - ajax
	@PostMapping("/soundOften")
	@ResponseBody
	public String selectSoundOften(Authentication auth) {
		// TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();
		
		return new Gson().toJson(service.selectSoundOften(ud.getUsername()));
	}

	// 좋아요 곡 조회 - ajax
	@PostMapping("/soundLike")
	@ResponseBody
	public String selectSoundLike(Authentication auth) {
		// TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();
		
		return new Gson().toJson(service.selectSoundLike(ud.getUsername()));
	}

	// 플레이 리스트 상세조회
	@GetMapping("/playlistDetail")
	public ModelAndView pagePlaylistDetail(ModelAndView mv, Authentication auth, MyMusic mymusic) {
		// TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();

		mymusic.setM_id(ud.getUsername());
		mv.addObject("MyMusic", service.selectPlaylistDetail(mymusic));
		mv.setViewName("mymusic/playlistDetail");
		return mv;
	}
	
	// 내가 좋아하는 아티스트 목록
	@GetMapping("/artistLikeList")
	public ModelAndView pageArtistLikeList(ModelAndView mv, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		;
		mv.addObject("ArtistList", service.selectArtistLikeList(ud.getUsername()));
		mv.addObject("member", memberService.selectLoginMember(ud.getUsername()));
		
		mv.setViewName("mymusic/artistLikeList");
		return mv;
	}
	
	// 아티스트 좋아요
	@PostMapping(value = "/artistLike", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String artistLike(Artist artist, Authentication auth) {

		String resultAjax = "";
		
		// 좋아요 여부 확인
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			artist.setM_id(ud.getUsername());
			
			if(service.checkArtistLike(artist) > 0) { // 좋아요가 되어있는 경우
				int result = service.deleteArtistLike(artist);
				if(result < 1) { // 좋아요 취소 실패
					resultAjax = "-1";
				} else { // 좋아요 취소 성공
					resultAjax = "0";
				}
			} else { // 좋아요가 안되어있는 경우
				int result = service.insertArtistLike(artist);
				if(result < 1) { // 좋아요 실패
					resultAjax = "1";
				} else { // 좋아요 성공
					resultAjax = "2";
				}
			}
		} else {
			resultAjax = "-2";
		}
		
		
		return resultAjax;
	}
	
	// 아티스트 좋아요 취소
	@PostMapping("/deleteArtistLike")
	public ModelAndView deleteArtistLike(
			ModelAndView mv
			, Authentication auth
			, Artist artist
			, RedirectAttributes rttr
			) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		artist.setM_id(ud.getUsername());
		int result = service.deleteArtistLike(artist);
		if(result < 1) {
			rttr.addFlashAttribute("msg", "좋아요 취소에 실패했습니다. 다시 시도해 주세요");
		} else {
			rttr.addFlashAttribute("msg", "해당 아티스트 좋아요를 취소했습니다.");
		}
		mv.setViewName("redirect:/mymusic/artistLikeList");
		return mv;
	}
	
	// 좋아하는 노래 목록
	@GetMapping("/soundLikeList")
	public ModelAndView pageSoundLikeList(ModelAndView mv, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		
		mv.addObject("member", memberService.selectLoginMember(ud.getUsername()));
		mv.addObject("selectSoundLikeTotalCnt", service.selectSoundLikeTotalCnt(ud.getUsername()));
		mv.addObject("SoundList", service.selectSoundLikeList(ud.getUsername()));
		mv.setViewName("mymusic/soundLikeList");
		return mv;
	}
	
	// 최근 들은 노래 목록
	@GetMapping("/soundRecentList")
	public ModelAndView pageSoundRecentList(ModelAndView mv, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		
		mv.addObject("member", memberService.selectLoginMember(ud.getUsername()));
		mv.addObject("selectSoundRecentTotalCnt", service.selectSoundRecentTotalCnt(ud.getUsername()));
		mv.addObject("SoundList",service.selectSoundRecent(ud.getUsername())); 
		mv.setViewName("mymusic/soundRecentList");
		return mv;
	}
	
	// 많이 들은 노래 목록
	@GetMapping("/soundOftenList")
	public ModelAndView pageSoundOftenList(ModelAndView mv, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		
		mv.addObject("member", memberService.selectLoginMember(ud.getUsername()));
		mv.addObject("SoundList",service.selectSoundOften(ud.getUsername())); 
		mv.setViewName("mymusic/soundOftenList");
		return mv;
	}
	
	// 플레이 리스트 변경
	@PostMapping("/updatePlaylist")
	public ModelAndView pageUpdatePlaylist(
			ModelAndView mv
			, MyMusic mymusic
			, Authentication auth
			) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mymusic.setM_id(ud.getUsername());
		
		mv.addObject("mymusicList", service.selectPlaylist(ud.getUsername()));
		mv.addObject("MyMusic", service.selectPlaylistDetail(mymusic));
		mv.setViewName("mymusic/updatePlaylist");
		return mv;
	}
	
	// 플레이 리스트 수정하기 - ajax
	@PostMapping(value = "/updatePlaylist.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updatePlaylist(
			@RequestParam(name = "a_no", required = false) int[] a_noArr
			,@RequestParam(name = "s_no", required = false) int[] s_noArr
			, MyMusic mymusic, Authentication auth) {
		
		// 유저 정보 가져오기
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mymusic.setM_id(ud.getUsername());
		
		// 들고 온 데이터 domain형태로 list 시키기
		List<Sound> soundList = new ArrayList<Sound>();
		for (int i = 0; i < s_noArr.length; i++) {
			System.out.println("a_noArr: " + a_noArr[i]);
			System.out.println("s_noArr: " + s_noArr[i]);
			Sound sound = new Sound();
			try {
				sound.setA_no(a_noArr[i]);
				sound.setS_no(s_noArr[i]);
				sound.setL_no(mymusic.getL_no());
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			sound.setM_id(ud.getUsername());
			soundList.add(sound);
		}
		
		// 플레이 리스트 update
		int result = service.updatePlaylist(mymusic, soundList);
		if (result < 1) { // 실패
			return "0";
		}
		return "1";
	}
	
	// 현재 플레이 리스트에서 곡 삭제 - ajax
	@PostMapping(value = "/deleteSoundPlaylist0", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteSoundPlaylist0(
			//@RequestParam(name = "a_no", required = false) int a_no
			//, @RequestParam(name = "s_no", required = false) int s_no
			Sound sound
			, Authentication auth
			) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		sound.setM_id(ud.getUsername());
		if(service.deleteSoundPlaylist0(sound) < 1) {
			sound.setA_no(0);
			sound.setS_no(0);
			return  new Gson().toJson(sound);
		} else {
			return new Gson().toJson(sound);
		}
	}
	
	// 셔플 기능 작동하면 현재 플레이 리스트 순서 맞추기
	@PostMapping("/insertPlaylist0Order")
	@ResponseBody
	public String insertPlaylist0Order(
			 @RequestParam(name="s_name", required = false) String[] s_nameArray
			, @RequestParam(name="artist_name", required = false) String[] artist_nameArray
			, Authentication auth
			){
		
		// 유저 정보 확인
		UserDetails ud = (UserDetails)auth.getPrincipal();
		Member member = memberService.selectLoginMember(ud.getUsername());
		// 들고 온 데이터 domain형태로 list 시키기
		List<Sound> soundList = new ArrayList<Sound>();
		
		for (int i = 0; i < s_nameArray.length; i++) {
			Sound sound = new Sound();
			sound.setS_name(s_nameArray[i]);
			sound.setM_id(ud.getUsername());
			sound.setArtist_name(artist_nameArray[i]);
			soundList.add(sound);
		}
		
		// 가수명과 제목으로 s_no , a_no 가져오기
		List<Sound> resultSoundList = soundService.checkAnoSno(soundList);
		
		 
		return new Gson().toJson(service.insertPlaylist0Order(resultSoundList, member));
	}
	

}
