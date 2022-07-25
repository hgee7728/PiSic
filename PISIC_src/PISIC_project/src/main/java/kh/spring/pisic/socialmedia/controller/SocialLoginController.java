package kh.spring.pisic.socialmedia.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PropertySource("classpath:application.properties")
public class SocialLoginController {
	
	private final String CLIENT_ID = "${spring.security.oauth2.client.registration.naver.client-id}";
	private final String CLI_SECRET = "${spring.security.oauth2.client.registration.naver.client-secret}";
	private final String REDIRECT_URI = "${spring.security.oauth2.client.registration.naver.redirect-uri}";
	
	@RequestMapping("/naver")
	public String testNaver(
			HttpSession session
			, Model model) throws UnsupportedEncodingException, UnknownHostException {
		
		
		return "";
	}
}
