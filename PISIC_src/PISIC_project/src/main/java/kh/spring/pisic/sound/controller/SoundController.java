package kh.spring.pisic.sound.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.model.service.MyMusicService;
import kh.spring.pisic.mymusic.model.service.MyMusicServiceImpl;
import kh.spring.pisic.sound.domain.PlayInfo;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.domain.SoundRecomment;
import kh.spring.pisic.sound.model.service.SoundService;

@Controller
@RequestMapping("/sound")
@PropertySource("classpath:cloudinary.properties") // properties 파일 등록
public class SoundController {
	private static final Logger logger = LoggerFactory.getLogger(SoundController.class);
	@Autowired
	private SoundService service;

	// 음악 재생
	@PostMapping("/play")
	public ModelAndView musicPlayer(ModelAndView mv
			, @RequestParam(name="a_no", required = false) int[] a_noArr
			, @RequestParam(name="s_no", required = false) int[] s_noArr
			, HttpSession session
			) {
		//TODO 로그인 여부 확인
		Member member = (Member)session.getAttribute("loginSsInfo");
		
		
		List<Sound> soundList = new ArrayList<Sound>();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < s_noArr.length; i++) {
			Sound sound = new Sound();
			System.out.println(a_noArr[i]);
			System.out.println(s_noArr[i]);
			sound.setA_no(a_noArr[i]);
			sound.setS_no(s_noArr[i]);
			sound.setM_id(member.getM_id());
			soundList.add(sound);
		}
		System.out.println("[[[soundList]]] : " + soundList);
		
		//System.out.println("Gson : " + new Gson().toJson(service.selectSoundList(soundList, member)));

		// list<domain> 형태 JSON형태로 바꿔 보내기
		mv.addObject("soundList", new Gson().toJson(service.selectSoundList(soundList, member)));
		mv.setViewName("sound/soundPlayer");
		return mv;

	}
	

	// properties 파일 내 설정된 변수 불러오기
	@Value("${cloud_name}")
	private String cloud_name;
	@Value("${api_key}")
	private String api_key;
	@Value("${api_secret}")
	private String api_secret;

	@PostMapping("/upload")
	public ModelAndView uploadSound(ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "upload", required = false) MultipartFile multiFile) {
		// cloudinary 사용을 위해 등록(properties 파일 이용)
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", cloud_name, "api_key", api_key,
				"api_secret", api_secret, "secure", true));
		// 파일이 저장될 폴더 이름
		String fileSavePath = "upload";
		// 업로드 될 경로
		String uploadPath = request.getSession().getServletContext().getRealPath(fileSavePath);
		System.out.println("uploadPath: " + uploadPath);

		// metadata안 폴더 만들기
		File folder = new File(uploadPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String orgFileName = multiFile.getOriginalFilename(); // 전송되어오기전 client에서 파일이름
		String type = multiFile.getContentType(); // 전송된 파일의 타입
		System.out.println("오리지날 네임:" + orgFileName);
		System.out.println("type: " + type);

		// metadata 안에 파일 저장
		try {
			multiFile.transferTo(new File(uploadPath + "/" + orgFileName));
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		// 저장된 파일 가지고 cloudinary에 저장
		File newFile = new File(uploadPath + "/" + orgFileName);
		@SuppressWarnings("rawtypes")
		Map uploadResult = null;
		try {
			uploadResult = cloudinary.uploader().upload(newFile, ObjectUtils.asMap("public_id",
					orgFileName.replace(".mp3", ""), "folder", "upload", "resource_type", "auto"));
		} catch (IOException e) {
			e.printStackTrace();
		}

		// cloudinary에 저장된 url
		String url = (String) uploadResult.get("url");
		System.out.println("url: " + url);

		mv.setViewName("redirect:/");
		return mv;
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
	public ModelAndView selectSoundDetail(ModelAndView mv, Sound sound, HttpSession session) {
		
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
		
		
		// 스트리밍 리포트
		Member member = (Member)session.getAttribute("loginSsInfo");
		// 내가 처음 들은 날
		mv.addObject("firstDay",service.selectSoundFirstDay(member,sound));
		// 총 감상 횟수
		mv.addObject("totalListen",service.selectTotalListen(member,sound));
		
		
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
	public String soundLike(Sound sound, HttpSession session) {

		// 로그인 여부 확인
		String resultAjax = "";
		if (session.getAttribute("loginSsInfo") == null) {
			resultAjax = "-2"; 
		} else {
			// 좋아요 여부 확인
			Member member = (Member)session.getAttribute("loginSsInfo");
			if(service.checkLike(member,sound) > 0) { // 좋아요가 되어있는 경우
				int result = service.deleteLike(member,sound);
				if(result < 1) { // 좋아요 취소 실패
					resultAjax = "-1";
				} else { // 좋아요 취소 성공
					resultAjax = "0";
				}
			} else { // 좋아요가 안되어있는 경우
				int result = service.insertLike((Member)session.getAttribute("loginSsInfo"),sound);
				if(result < 1) { // 좋아요 실패
					resultAjax = "1";
				} else { // 좋아요 성공
					resultAjax = "2";
				}
			}
		}
		return resultAjax;
	}

	// 노래 댓글 등록 - ajax
	@PostMapping(value = "/insertRecomment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRecomment(SoundRecomment soundRecomment, HttpSession session) {
		
		// 로그인 여부 확인
		String resultAjax = "";
		if (session.getAttribute("loginSsInfo") == null) {
			resultAjax = "-1"; 
		} else { // 댓글 등록
			Member member = (Member)session.getAttribute("loginSsInfo");
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
	public String deleteRecomment(SoundRecomment soundRecomment, HttpSession session) {
		
		// 로그인 여부 확인
		String resultAjax = "";
		if (session.getAttribute("loginSsInfo") == null) {
			resultAjax = "-1"; 
		} else { // 댓글 삭제
			Member member = (Member)session.getAttribute("loginSsInfo");
			int result = service.deleteSoundRecomment(member, soundRecomment);
			if(result < 1) { // 댓글 삭제 실패
				resultAjax = "0"; 
			} else { // 댓글 삭제 성공
				resultAjax = "1";
			}
		}
		return resultAjax;
	}
	
	// playInfo 테이블에 데이터 삽입 - ajax
	@PostMapping(value = "/insertPalyInfo", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertPalyInfo(
			PlayInfo playInfo
			, HttpSession session
			) {
		//TODO 로그인 여부
		Member member = (Member)session.getAttribute("loginSsInfo");
		playInfo.setM_id(member.getM_id());
		
		// TODO 위치 정보 담기
//		playInfo.setArea_code(0);
		
		
		// TODO 날씨 정보 담기
//		playInfo.setSky(api_key);
//		playInfo.setPty(api_key);
//		playInfo.setTmp(0);
		
		if(service.insertPalyInfo(playInfo) < 1) {
			return "0";
		}
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
