package kh.spring.pisic.sound.controller;

import java.util.ArrayList;
import java.util.List;


import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
import kh.spring.pisic.sound.domain.PlayInfo;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.domain.SoundRecomment;
import kh.spring.pisic.sound.model.service.SoundService;
import kh.spring.pisic.weather.util.Region;

@Controller
@RequestMapping("/sound")

public class SoundController {
	private static final Logger logger = LoggerFactory.getLogger(SoundController.class);
	@Autowired
	private SoundService service;
	@Autowired
	private MemberService memberService;
	// 음악 재생
	@PostMapping("/play")
	public ModelAndView musicPlayer(ModelAndView mv
			, @RequestParam(name="a_no", required = false) int[] a_noArr
			, @RequestParam(name="s_no", required = false) int[] s_noArr
			, Authentication auth
			, RedirectAttributes rttr
			) {
		System.out.println("음악 재생!!");
		if(auth == null) {
			System.out.println("[[[[[[[[[[[[[[[[[[[여기냐]]]]]]]]]]]]]]]]]");
			mv.addObject("msg", "로그인 후 이용해주세요.");
			mv.setViewName("sound/soundPlayer");
			return mv;
		} else {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			Member member = memberService.selectLoginMember(ud.getUsername());
			
			List<Sound> soundList = new ArrayList<Sound>();

			// 들고 온 데이터 domain형태로 list 시키기
			for (int i = 0; i < s_noArr.length; i++) {
				Sound sound = new Sound();
				System.out.println("a_no : " + a_noArr[i]);
				System.out.println("s_no : " + s_noArr[i]);
				sound.setA_no(a_noArr[i]);
				sound.setS_no(s_noArr[i]);
				sound.setM_id(ud.getUsername());
				soundList.add(sound);
			}
			System.out.println("[[[soundList]]] : " + soundList);
			
			//System.out.println("Gson : " + new Gson().toJson(service.selectSoundList(soundList, member)));

			// list<domain> 형태 JSON형태로 바꿔 보내기
			mv.addObject("soundList", new Gson().toJson(service.selectSoundList(soundList, member)));
			mv.setViewName("sound/soundPlayer");
			return mv;
		}
		

	}

	// 앨범 상세조회
	@GetMapping("/albumDetail")
	public ModelAndView selectAlbumDetail(ModelAndView mv, @RequestParam(name = "a_no", required = false) String a_no) {

		mv.addObject("album", service.selectAlbum(a_no));
		mv.setViewName("sound/albumDetail");
		return mv;
	}
	
	// 곡 상세조회
	@GetMapping("/soundDetail")
	public ModelAndView selectSoundDetail(ModelAndView mv, Sound sound, Authentication auth) {
		
		
		
		// 곡 기본정보 + 댓글
		mv.addObject("sound", service.selectSound(sound));
		// 수록곡 앨범
		mv.addObject("album", service.selectSoundAlbum(sound));
		// 관련 아티스트 앨범
		mv.addObject("relArtistAlbum",service.selectRelArtistAlbum(sound));
		// 관련 플레이리스트 공유 게시판
		mv.addObject("relPlaylistBoard",service.selectRelPlaylistBoard(sound));
		
		// 이곡의 기록
		// 데일리 감상자수
		if(service.selectDailyListen(sound) == null) {
			mv.addObject("dailyListen", "N");
		} else {
			mv.addObject("dailyListen", service.selectDailyListen(sound));
		}
		// 어제의 차트 순위
		if(service.selectYesterChart(sound) == null) {
			mv.addObject("yesterChart", "N");
		} else {
			mv.addObject("yesterChart", service.selectYesterChart(sound));
		}
		// 최고 순위 (일간)
		if(service.selectBestChart(sound) == null) {
			mv.addObject("bestChart", "N");
		} else {
			mv.addObject("bestChart", service.selectBestChart(sound));
		}
		
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			Member member = memberService.selectLoginMember(ud.getUsername());
			mv.addObject("member", member);
			
			// 스트리밍 리포트
			// 내가 처음 들은 날
			mv.addObject("firstDay",service.selectSoundFirstDay(member,sound));
			// 총 감상 횟수
			mv.addObject("totalListen",service.selectTotalListen(member,sound));
		}
		
		
		
		mv.setViewName("sound/soundDetail");
		return mv;
	}
	
	// 아티스트 상세조회
	@GetMapping("/artistDetail")
	public ModelAndView selectArtistDetail(ModelAndView mv, @RequestParam(name="artist_no", required = false) String artist_no) {
		
		mv.addObject("artist",service.selectArtist(artist_no)); 
		mv.addObject("artistJoinAlbum", service.selectArtistJoinAlbum(artist_no));
		mv.addObject("artistJoinSound", service.selectArtistJoinSound(artist_no));
		
		mv.setViewName("sound/artistDetail");
		return mv;
	
	
	}
	
	
	
	
	// 노래 좋아요 - ajax
	@PostMapping(value = "/like", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String soundLike(Sound sound, Authentication auth) {
		String resultAjax = "";
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			
			
			// 좋아요 여부 확인
			Member member = memberService.selectLoginMember(ud.getUsername());
			if(service.checkLike(member,sound) > 0) { // 좋아요가 되어있는 경우
				int result = service.deleteLike(member,sound);
				if(result < 1) { // 좋아요 취소 실패
					resultAjax = "-1";
				} else { // 좋아요 취소 성공
					resultAjax = "0";
				}
			} else { // 좋아요가 안되어있는 경우
				int result = service.insertLike(member,sound);
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

	// 노래 댓글 등록 - ajax
	@PostMapping(value = "/insertRecomment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRecomment(SoundRecomment soundRecomment, Authentication auth) {
		
		String resultAjax = "";
		if(auth == null) {
			resultAjax = "-1";
		} else {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			Member member = memberService.selectLoginMember(ud.getUsername());
			// 댓글 등록
			int result = service.insertSoundRecomment(member, soundRecomment);
			if(result < 1) { // 댓글 등록 실패
				resultAjax = "0"; 
			} else { // 댓글 등록 성공
				resultAjax = "1";
			}
		}
		
		
		return resultAjax;
	}
	
	// 노래 댓글 삭제 - ajax
	@PostMapping(value = "/deleteRecomment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteRecomment(SoundRecomment soundRecomment, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		Member member = memberService.selectLoginMember(ud.getUsername());
		String resultAjax = "";
		// 댓글 삭제
		int result = service.deleteSoundRecomment(member, soundRecomment);
		if(result < 1) { // 댓글 삭제 실패
			resultAjax = "0"; 
		} else { // 댓글 삭제 성공
			resultAjax = "1";
		}
		
		return resultAjax;
	}
	
	// playInfo 테이블에 데이터 삽입 - ajax
	@PostMapping(value = "/insertPalyInfo", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertPalyInfo(
			PlayInfo playInfo
			, Authentication auth
			, String currentLat
			, String currentLon
			) throws Throwable {
		//TODO 로그인 여부
		UserDetails ud = (UserDetails)auth.getPrincipal();
		playInfo.setM_id(ud.getUsername());
		
		// 위치 정보 담기
		Region region = new Region();
		
		JSONObject area_name = null;
		try {
			area_name = region.lookUpAddress(currentLat, currentLon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(area_name);
		
		
		
		

		
		
		// TODO 날씨 정보 담기
//		playInfo.setSky(api_key);
//		playInfo.setPty(api_key);
//		playInfo.setTmp(0);
		
		// TODO
//		if(service.insertPalyInfo(playInfo) < 1) {
//			return "0";
//		}
		return "1";
	}
	
	
	
	
	@ExceptionHandler(Exception.class)
	private ModelAndView handlerBoardException(Exception e) { // 얘가 최상이라 아래거로 들어갈 일 없어.
		logger.error(e.getMessage());
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", "오류");
		mv.setViewName("redirect:/");
		return mv;
	}
}
