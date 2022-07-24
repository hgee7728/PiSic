package kh.spring.pisic.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;

import kh.spring.pisic.admin.model.service.AdminService;
import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

@Controller
@RequestMapping("/admin")
@PropertySource("classpath:cloudinary.properties") // properties 파일 등록
public class AdminController {
	@Autowired
	private AdminService service;
	
	
	/*아티스트 관리자 페이지*/
	@GetMapping("/artist")
	public ModelAndView SearchArtistPage(ModelAndView mv) { 
		mv.addObject("aristList",  service.selectArtistList());
		mv.setViewName("admin/artistList");
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
	@PostMapping(value = "/deleteArtist", produces = "text/plain;charset=UTF-8")
	public String deleteArtist(
			@RequestParam(name = "artist_no", required = false) int[] artist_noArray){
		List<Artist> artistList = new ArrayList<Artist>();
		
		for (int i = 0; i < artist_noArray.length; i++) {
			Artist artist = new Artist();
			artist.setArtist_no(artist_noArray[i]);
			artistList.add(artist);
		}
		System.out.println("[[[artistList]]] : " + artistList);

		if (service.deleteArtist(artistList) < 1) { // 삭제 실패
			return "0";
		} else {
			return "1";
		}
		
	}

	// 앨범 목록 조회
	@GetMapping("/album")
	public ModelAndView pageAlbumList(ModelAndView mv) {

		mv.addObject("albumList", service.selectAlbumList());
		mv.setViewName("admin/albumList");
		return mv;
	}

	// 앨범 검색
	@GetMapping("/album.do")
	@ResponseBody
	public String searchAlbumList(ModelAndView mv, Album album) {
		return new Gson().toJson(service.selectSearchAlbumList(album.getKeyword()));
	}

	// 앨범 추가 페이지로 이동
	@GetMapping("/insertAlbum")
	public ModelAndView pageInsertAlbum(ModelAndView mv) {
		mv.setViewName("admin/insertAlbum");
		return mv;
	}

	// 앨범 추가하기
	@PostMapping("/insertAlbum")
	public ModelAndView insertAlbum(ModelAndView mv, Album album, RedirectAttributes rttr) {
	
		int result = service.insertAlbum(album);
		if (result == 0) {
			rttr.addFlashAttribute("msg", "앨범 추가에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/admin/album");
		} else {
			rttr.addFlashAttribute("msg", "앨범 추가 성공하였습니다");
			mv.setViewName("redirect:/admin/album");
		}
		return mv;
	}

	// 앨범 수정 페이지로 이동
	@GetMapping("/updateAlbum")
	public ModelAndView pageUpdateAlbum(ModelAndView mv, Album album) {

		mv.addObject("album", service.selectAlbum(album.getA_no()));
		mv.setViewName("admin/updateAlbum");
		return mv;
	}

	// 앨범 수정
	@PostMapping("/updateAlbum")
	public ModelAndView updateAlbum(ModelAndView mv, Album album, RedirectAttributes rttr) {

		if (service.updateAlbum(album) < 1) { // 변경 실패
			rttr.addFlashAttribute("msg", "앨범 정보 변경에 실패했습니다.");
		} else { // 변경 성공
			rttr.addFlashAttribute("msg", "앨범 정보를 변경했습니다.");
		}
		mv.setViewName("redirect:/admin/album");
		return mv;
	}

	// 앨범 삭제
	@ResponseBody
	@PostMapping("/deleteAlbum")
	public String deleteAlbum(@RequestParam(name = "a_no", required = false) int[] a_noArray) {
		List<Album> albumList = new ArrayList<Album>();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < a_noArray.length; i++) {
			Album album = new Album();
			album.setA_no(a_noArray[i]);
			albumList.add(album);
		}
		System.out.println("[[[albumList]]] : " + albumList);

		if (service.deleteAlbum(albumList) < 1) { // 삭제 실패
			return "0";
		} else {
			return "1";
		}
	}
	
	// 곡 목록 조회
	@GetMapping("/sound")
	public ModelAndView pageSoundList(ModelAndView mv) {

		mv.addObject("soundList", service.selectSoundList());
		mv.setViewName("admin/soundList");
		return mv;
	}
	
//	@RequestMapping(value="/getSoundList", produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public String getSoundList() {
//		return "";
//	}

	// 곡 검색
	@GetMapping("/sound.do")
	@ResponseBody
	public String searchSoundList(ModelAndView mv, Sound sound) {
		return new Gson().toJson(service.selectSearchSoundList(sound.getKeyword()));
	}
		
	// 곡 추가 페이지로 이동
	@GetMapping("/insertSound")
	public ModelAndView pageInsertSound(ModelAndView mv) {
		mv.setViewName("admin/insertSound");
		return mv;
	}

	// 곡 추가하기
	// properties 파일 내 설정된 변수 불러오기
	@Value("${cloud_name}")
	private String cloud_name;
	@Value("${api_key}")
	private String api_key;
	@Value("${api_secret}")
	private String api_secret;
	
	@PostMapping("/insertSound")
	public ModelAndView insertSound(ModelAndView mv, Sound sound
			, @RequestParam(name="singer_no", required = false) int[] singer_noArr
			, @RequestParam(name="writer_no", required = false) int[] writer_noArr
			, @RequestParam(name="composer_no", required = false) int[] composer_noArr
			, @RequestParam(name = "upload_sound", required = false) MultipartFile multiFile
			, HttpServletRequest request
			,RedirectAttributes rttr) {
		for (int i = 0; i < singer_noArr.length; i++) {
			System.out.println("가수 : "+singer_noArr[i]);
		}
		for (int i = 0; i < writer_noArr.length; i++) {
			System.out.println("작사가 : " + writer_noArr[i]);
		}
		for (int i = 0; i < composer_noArr.length; i++) {
			System.out.println("작곡가 : "+composer_noArr[i]);
		}
		
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
		
		sound.setS_path(url);
		
		int result = service.insertSound(sound, singer_noArr, writer_noArr, composer_noArr);
		if (result == 0) {
			rttr.addFlashAttribute("msg", "곡 추가에 실패했습니다. 다시 시도해주세요");
			mv.setViewName("redirect:/admin/sound");
		} else {
			rttr.addFlashAttribute("msg", "곡 추가 성공하였습니다");
			mv.setViewName("redirect:/admin/sound");
		}
		
		
		return mv;
	}
	// 곡 수정 페이지로 이동
	@GetMapping("/updateSound")
	public ModelAndView pageUpdateSound(ModelAndView mv, Sound sound) {

		mv.addObject("sound", service.selectSound(sound));
		mv.setViewName("admin/updateSound");
		return mv;
	}

	// 곡 수정
	@PostMapping("/updateSound")
	public ModelAndView updateSound(ModelAndView mv, Sound sound
			, @RequestParam(name="singer_no", required = false) int[] singer_noArr
			, @RequestParam(name="writer_no", required = false) int[] writer_noArr
			, @RequestParam(name="composer_no", required = false) int[] composer_noArr
			, @RequestParam(name = "upload_sound", required = false) MultipartFile multiFile
			, HttpServletRequest request
			, RedirectAttributes rttr) {

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
		
		sound.setS_path(url);
		if (service.updateSound(sound, singer_noArr, writer_noArr, composer_noArr) < 1) { // 변경 실패
			rttr.addFlashAttribute("msg", "곡 정보 변경에 실패했습니다.");
		} else { // 변경 성공
			rttr.addFlashAttribute("msg", "곡 정보를 변경했습니다.");
		}
		mv.setViewName("redirect:/admin/sound");
		return mv;
	}
	
	// 곡 삭제
	@ResponseBody
	@PostMapping("/deleteSound")
	public String deleteSound(
			@RequestParam(name = "a_no", required = false) int[] a_noArray
			, @RequestParam(name = "s_no", required = false) int[] s_noArray
			) {
		List<Sound> soundList = new ArrayList<Sound>();

		// 들고 온 데이터 domain형태로 list 시키기
		for (int i = 0; i < a_noArray.length; i++) {
			Sound sound = new Sound();
			sound.setA_no(a_noArray[i]);
			sound.setS_no(s_noArray[i]);
			soundList.add(sound);
		}
		System.out.println("[[[soundList]]] : " + soundList);

		if (service.deleteSound(soundList) < 1) { // 삭제 실패
			return "0";
		} else {
			return "1";
		}
	}
		
	@GetMapping("/test")
	public String TestPage() {
		return "pymusic/test";
	}

}
