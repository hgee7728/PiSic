package kh.spring.pisic.springsecurity.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kh.spring.pisic.member.model.service.MemberService;

public class AuthLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private String m_id;
	private String defaultUrl;
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	@Autowired
	private MemberService service;
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request 
			, HttpServletResponse response
			, Authentication authentication) throws ServletException, IOException {
		
		// 회원 아이디
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String username = ((UserDetails)principal).getUsername();
		
//		String username = request.getParameter(m_id);
		
		UserDetails ud = (UserDetails)authentication.getPrincipal();
		String username = ud.getUsername();
		System.out.println("===========================================" + username);
		
		// 로그인 실패 횟수 초기화
		service.updateFailureCountReset(username);
		
		// 오류 세션 삭제
		clearAuthenticationAttributes(request);
		
		// 로그인 성공 후 페이지 이동
		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(
			HttpServletRequest request
			, HttpServletResponse response
			, Authentication authentication) throws ServletException, IOException {
     
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		// 로그인 페이지 이전 URL
		String prevPage = (String)request.getSession().getAttribute("prevPage");
		// URL이 있으면 세션 제거
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}
		
		// 관리자 페이지 URL
		String adminURL = "http://localhost:8091/PISIC/admin/album";
				
		// 사용자 권한
		String authStr = authentication.getAuthorities().toString();
		
		// 사용자 권한 확인
		if (authStr.equals("[ROLE_ADMIN]")) {
			redirectStratgy.sendRedirect(request, response, adminURL);
		} else {
			if (savedRequest != null) {
				String targetUrl = savedRequest.getRedirectUrl();
				redirectStratgy.sendRedirect(request, response, targetUrl);
			} else if (prevPage != null && !prevPage.equals("")) {
				redirectStratgy.sendRedirect(request, response, prevPage);
			} else {
				redirectStratgy.sendRedirect(request, response, defaultUrl);
			}
		}
	}
	
//	// 로그인 실패 횟수 세션 삭제 -> SimpleUrlAuthenticationSuccessHandler
//	protected void clearSession(HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		if (session != null) {
//			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
//		}
//	}
}