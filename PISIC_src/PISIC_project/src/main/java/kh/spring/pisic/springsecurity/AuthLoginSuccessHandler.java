package kh.spring.pisic.springsecurity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;


public class AuthLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Autowired
	private MemberService service;
	
	public AuthLoginSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request 
			, HttpServletResponse response
			, Authentication authentication) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		System.out.println("===========================================" + username);
		
		String returnUrl = (String)session.getAttribute("prevPage");
		if (returnUrl != null) {
			session.removeAttribute("prevPage");
			getRedirectStrategy().sendRedirect(request, response, returnUrl);
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}
}
