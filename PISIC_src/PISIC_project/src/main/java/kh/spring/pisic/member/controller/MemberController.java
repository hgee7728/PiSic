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
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize"
					+ "?client_id=1efab5fef46b7a6b7fb1e374f5eb874f"	// RestApi Key
					+ "&redirect_uri=http://localhost:8091/PISIC/member/login/oauth_kakao"	// Redirect_Url
					+ "&response_type=code";
		
		return reqUrl;
	}
	
	//????????? ???????????? ??????
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
	        
	    return "redirect:/"; //?????? ????????? ?????? ??????
	}
	
	//????????????
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
	    String refresh_Token = "";
	    String reqURL = "https://kauth.kakao.com";

	    try {
	        URL url = new URL(reqURL);

	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        // URL????????? ???????????? ?????? ??? ??? ??????, POST ?????? PUT ????????? ????????? setDoOutput??? true??? ???????????????.
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);

	        // POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=f8071907fae4877f2a0f469e969f639f");	// RestApi Key
	        sb.append("&redirect_uri=http://localhost:8091/PISIC/member/login/oauth_kakao");	// Redirect_Url
	        sb.append("&code=" + authorize_code);
	        bw.write(sb.toString());
	        bw.flush();

	        // ?????? ????????? 200????????? ??????
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        // ????????? ?????? ?????? JSON Response ????????? ????????????
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";

	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);

	        // Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
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
	
	//??????????????????
    public HashMap<String, Object> getUserInfo (String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // ?????? Header ??????
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
	public ModelAndView pageShowMyInfo(
			ModelAndView mv
			, Authentication auth) {
		// ?????? ????????? id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
		
		Member member = service.selectLoginMember(uid);
		System.out.println("==========================================" + member);
		
		mv.addObject("member", member);
		mv.setViewName("member/showMyInfo");
		return mv;
	}
	
	@GetMapping("/updateMyInfo")
	public ModelAndView pageUpdateMyInfo(
			ModelAndView mv
			, Authentication auth) {
		// ?????? ????????? id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
				
		Member member = service.selectLoginMember(uid);
		System.out.println("==========================================" + member);
				
		mv.addObject("member", member);
		mv.setViewName("member/updateMyInfo");
		return mv;
	}
	
	@PostMapping("/updateMyInfo")
	public String updateMyInfo(
			Member member
			, RedirectAttributes rttr) {
		int result = service.updateMyInfo(member);
		if (result < 1) {
			System.out.println("?????????????????? ??????");
			rttr.addFlashAttribute("msg", "????????????????????? ?????????????????????.");
		} else {
			System.out.println("?????????????????? ??????");
			rttr.addFlashAttribute("msg", "????????????????????? ?????????????????????.");
		}
		return "redirect:/member/showMyInfo";
	}
	
	@GetMapping("/updatePassword")
	public ModelAndView pageUpdatePassword(
			ModelAndView mv) {
		mv.setViewName("member/updatePassword");
		return mv;
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(
			Member member
			, RedirectAttributes rttr) {
		// ?????????
		String endcodedPassword = bCryptPasswordEncoder.encode(member.getM_password());
		member.setM_password(endcodedPassword);
		
		int result = service.updatePassword(member);
		if (result < 1) {
			System.out.println("???????????? ?????? ??????");
			rttr.addFlashAttribute("msg", "???????????? ?????? ?????????????????????.");
		} else {
			System.out.println("???????????? ?????? ??????");
			rttr.addFlashAttribute("msg", "???????????? ????????? ?????????????????????.");
		}
		return "redirect:/member/showMyInfo";
	}
	
	@GetMapping("/deleteMember")
	public ModelAndView pageDeleteMember(
			ModelAndView mv
			, Member member) {
		
		mv.setViewName("member/deleteMember");
		return mv;
	}
	
	@PostMapping("/deleteMember")
	public String deleteMember(
			Member member
			, RedirectAttributes rttr) {
		int result = service.deleteMember(member);
		if (result == 1) {
			System.out.println("???????????? ??????");
			rttr.addFlashAttribute("msg", "??????????????? ?????????????????????.");
			SecurityContextHolder.clearContext();
		} else {
			System.out.println("???????????? ??????");
			rttr.addFlashAttribute("msg", "??????????????? ?????????????????????.");
		}
		return "redirect:/";
	}
	
	@PostMapping("/passwordCheck.ax")
	@ResponseBody
	public int passwordCheck(
			@RequestParam (name = "m_id", required = false) String m_id
			, @RequestParam (name = "m_password", required = false) String m_password) {
		
		String password = service.selectPassword(m_id);
		int result = 0;
		if (matchPassword(m_password, password)) {
			System.out.println("================================================================== ??????");
			result = 1;
		} else {
			System.out.println("================================================================== ?????????");
			result = 0;
		}
		return result;
	}
	
	protected boolean matchPassword(String password, String Enpassword) {
		return bCryptPasswordEncoder.matches(password, Enpassword);
	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView handlerBoardException(Exception e) {
		logger.error(e.getMessage());
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", "??????");
		mv.setViewName("redirect:/");
		return mv;
	}
}
