package kh.spring.pisic.sound.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Controller
@RequestMapping("/sound")
public class SoundController {
	
	@PostMapping("/play")
	public ModelAndView musicPlayer( ModelAndView mv
			, @RequestParam("post_data") String postData
			) {
		mv.setViewName("soundPlayer");
		return mv;
		
	}
	@PostMapping("/play2")
	public ModelAndView musicPlayer2( ModelAndView mv
			, @RequestParam("post_data") String postData
			) {
		mv.setViewName("soundPlayer2");
		return mv;
		
	}
	
	@PostMapping("/upload")
	public ModelAndView uploadSound(
			ModelAndView mv
			, HttpServletRequest request
			, @RequestParam(name="upload", required = false) MultipartFile multiFile
			) {
		// cloudinary 사용을 위해 등록
		// TODO 추후 bean 설정 및 암호화 필요
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", "dj5umvpkd",
				"api_key", "725653185777922",
				"api_secret", "zLHx--j6uWJB2iGwJyrj01kzmQI",
				"secure", true));
		String fileSavePath = "upload";
		String uploadPath = request.getSession().getServletContext().getRealPath(fileSavePath);
		System.out.println("uploadPath: " + uploadPath);
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		// metadata안 폴더 만들기
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		String orgFileName = multiFile.getOriginalFilename(); // 전송되어오기전 client에서 파일이름
		String type = multiFile.getContentType(); // 전송된 파일의 타입
		String upload = multiFile.getName(); // 서버에 저장된 파일이름
		System.out.println("오리지날 네임:" + orgFileName);
		System.out.println("type: " +type);
		System.out.println("서버에 저장된 파일이름 :" + upload);
		
		try {
			multiFile.transferTo(new File(uploadPath +"/"+ orgFileName));
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
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
		
		String url = (String)uploadResult.get("url");
		System.out.println(url);


		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@PostMapping("/test")
	public String testUpload(
			@RequestParam(name="upload", required = false) MultipartFile file
			) {
		return "redirect:/";
	}

}
