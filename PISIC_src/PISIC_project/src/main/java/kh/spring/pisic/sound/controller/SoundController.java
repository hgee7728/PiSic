package kh.spring.pisic.sound.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.model.service.SoundService;
import kh.spring.pisic.sound.model.service.SoundServiceImpl;

@Controller
@RequestMapping("/sound")
@PropertySource("classpath:cloudinary.properties") // properties 파일 등록
public class SoundController {
	
	@Autowired
	private SoundService service;
	
//	@Autowired
//	private List<Sound> soundList;
//	
//	@Autowired
//	private Sound sound;
	
	
	@PostMapping("/play")
	public ModelAndView musicPlayer( ModelAndView mv
			, @RequestParam("a_no") int[] a_no
			, @RequestParam("s_no") int[] s_no
			) {
		
		List<Sound> soundList = new ArrayList<Sound>();
		
		
		for(int i = 0 ; i < s_no.length ; i++) {
			Sound sound = new Sound();
			System.out.println(a_no[i]);
			System.out.println(s_no[i]);
			sound.setA_no(a_no[i]);
			sound.setS_no(s_no[i]);
			soundList.add(sound);
		}
		System.out.println("[[[soundList]]] : "+soundList);
		System.out.println("Gson : "+new Gson().toJson(service.selectSoundList(soundList)));
		mv.addObject("soundList",new Gson().toJson(service.selectSoundList(soundList)));
		mv.setViewName("sound/soundPlayer");
		return mv;
		
	}
	
	@PostMapping("/playOne")
	public ModelAndView soundPlayerOne(
			ModelAndView mv
			, Sound sound
			) {
		String soundUrl = service.selectSound(sound);
		System.out.println("soundUrl : " + soundUrl);
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
	public ModelAndView uploadSound(
			ModelAndView mv
			, HttpServletRequest request
			, @RequestParam(name="upload", required = false) MultipartFile multiFile
			) {
		// cloudinary 사용을 위해 등록(properties 파일 이용)
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", cloud_name,
				"api_key", api_key,
				"api_secret", api_secret,
				"secure", true));
		// 파일이 저장될 폴더 이름
		String fileSavePath = "upload";
		// 업로드 될 경로
		String uploadPath = request.getSession().getServletContext().getRealPath(fileSavePath);
		System.out.println("uploadPath: " + uploadPath);
		
		// metadata안 폴더 만들기
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		String orgFileName = multiFile.getOriginalFilename(); // 전송되어오기전 client에서 파일이름
		String type = multiFile.getContentType(); // 전송된 파일의 타입
		System.out.println("오리지날 네임:" + orgFileName);
		System.out.println("type: " +type);
		
		// metadata 안에 파일 저장
		try {
			multiFile.transferTo(new File(uploadPath +"/"+ orgFileName));
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		// 저장된 파일 가지고 cloudinary에 저장
		File newFile = new File(uploadPath + "/" + orgFileName);
		Map uploadResult = null;
		try {
			uploadResult = cloudinary.uploader().upload(newFile, ObjectUtils.asMap(
					"public_id", orgFileName.replace(".mp3", ""),
					"folder", "upload", 
					"resource_type", "auto"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// cloudinary에 저장된 url
		String url = (String)uploadResult.get("url");
		System.out.println("url: " + url);


		
		mv.setViewName("redirect:/");
		return mv;
	}
	
//	@GetMapping("/playlist")
//	public String pageMyPlaylist() {
//		return "myPlaylist";
//	}
	
	@GetMapping("/albumDetail")
	public ModelAndView pageAlbumDetail(
			ModelAndView mv
			,@RequestParam(name="a_no", required = false) String a_no
			) {
		
		mv.addObject("album", service.selectAlbum(a_no));
		mv.setViewName("sound/albumDetail");
		return mv;
	}

}
