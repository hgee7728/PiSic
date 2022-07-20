package kh.spring.pisic.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
//	@PostMapping("/login")
//	public ModelAndView loginCheck(
//			ModelAndView mv
//			, Member member
//			, RedirectAttributes rttr
//			, HttpSession session) {
////?		if (pwEncoding.matches(null, null))
//		
////암호화	member.setPasswd(pwEncoding.encode(member.getPasswd()));
//		
//		// login 세선이 존재하면 제거
//		if (session.getAttribute("loginSsInfo") != null) {
//			session.removeAttribute("loginSsInfo");
//		}
//		
//		Member result = service.loginCheck(member);
//		
//		if (result != null) {
//			session.setAttribute("loginSsInfo", result);
//			System.out.println("로그인 성공");
//			mv.setViewName("redirect:/");
//		} else {
//			System.out.println("로그인 실패");
//			mv.setViewName("redirect:/member/login");
//		}
//		return mv;
//	}
	
//	@GetMapping("/logout")
//	public String pageLogout(
//			HttpSession session) {
//		// 세션 초기화
//		session.invalidate();
////		session.removeAttribute("loginSsInfo");
//		return "redirect:/";
//	}
	
	@RequestMapping("/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize"
					+ "?client_id=1efab5fef46b7a6b7fb1e374f5eb874f"	// RestApi Key
					+ "&redirect_uri=http://localhost:8091/PISIC/member/login/oauth_kakao"	// Redirect_Url
					+ "&response_type=code";
		
		return reqUrl;
	}
	
	//카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model) throws Exception {

		System.out.println("code : " + code);
	    String access_Token = getAccessToken(code);
	    System.out.println("access_Token : " + access_Token);
	           
	    HashMap<String, Object> userInfo = getUserInfo(access_Token);
	    System.out.println("access_Token : " + access_Token);
	    System.out.println("email : " + userInfo.get("email"));
	    System.out.println("nickname : " + userInfo.get("nickname"));
	       
	    JSONObject kakaoInfo =  new JSONObject(userInfo);
	    model.addAttribute("kakaoInfo", kakaoInfo);
	        
	    return "redirect:/"; //본인 원하는 경로 설정
	}
	
	//토큰발급
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
	    String refresh_Token = "";
	    String reqURL = "https://kauth.kakao.com";

	    try {
	        URL url = new URL(reqURL);

	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        // URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);

	        // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=f8071907fae4877f2a0f469e969f639f");	// RestApi Key
	        sb.append("&redirect_uri=http://localhost:8091/PISIC/member/login/oauth_kakao");	// Redirect_Url
	        sb.append("&code=" + authorize_code);
	        bw.write(sb.toString());
	        bw.flush();

	        // 결과 코드가 200이라면 성공
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        // 요청을 통해 얻은 JSON Response 메세지 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";

	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);

	        // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);

	        access_Token = element.getAsJsonObject().get("access_token").getAsString();
	        refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	        System.out.println("access_token : " + access_Token);
	        System.out.println("refresh_token : " + refresh_Token);

	        br.close();
	        bw.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return access_Token;
	}
	
	//유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청 Header 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    }
	
	@GetMapping("/showMyInfo")
	public String pageShowMyInfo() {
		return "member/showMyInfo";
	}
	
	@GetMapping("/updateMyInfo")
	public ModelAndView pageUpdateMyInfo(
			ModelAndView mv) {
		mv.setViewName("member/updateMyInfo");
		return mv;
	}
	
	@PostMapping("/updateMyInfo")
	public ModelAndView updateMyInfo(
			ModelAndView mv
			, Member member) {
		int result = service.updateMyInfo(member);
		if (result < 1) {
			System.out.println("회원정보수정 실패");
		} else {
			System.out.println("회원정보수정 성공");
		}
		
		mv.setViewName("redirect:/member/showMyInfo");
		return mv;
	}
	
	@PostMapping("/deleteMember")
	public ModelAndView deleteMember(
			ModelAndView mv
			, Member member) {
		
		mv.setViewName("redirect:/");
		return mv;
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
