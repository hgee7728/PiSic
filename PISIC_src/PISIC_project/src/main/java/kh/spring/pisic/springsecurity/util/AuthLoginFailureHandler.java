package kh.spring.pisic.springsecurity.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kh.spring.pisic.member.model.service.MemberService;

public class AuthLoginFailureHandler implements AuthenticationFailureHandler {

	private String m_id;
	private String m_password;
	private String errormsg_name;
	private String defaultFailureUrl;
	
	public String getM_id() {
		return m_id;
	}
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	public String getM_password() {
		return m_password;
	}
	
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	
	public String getErrormsg_name() {
		return errormsg_name;
	}
	
	public void setErrormsg_name(String errormsg_name) {
		this.errormsg_name = errormsg_name;
	}
	
	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}
	
	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	@Autowired
	private MemberService service;
	
	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request
			, HttpServletResponse response
			, AuthenticationException exception) throws IOException, ServletException {
		
		String username = request.getParameter(m_id);
		String password = request.getParameter(m_password);
		String errormsg = null;
		
		// ???????????? ?????? ??????
		if (exception instanceof BadCredentialsException) {
			loginFailureCount(username);
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		// ????????? ?????? ??????
		} else if (exception instanceof InternalAuthenticationServiceException) {
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		// ???????????? ???????????? ?????? ??????
		} else if (exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("error.CredentialsExpired");
		// ?????? ???????????? ??????
		} else if (exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("error.Disaled");
		// ?????? ?????? ??????
		} else if (exception instanceof LockedException) {
			errormsg = MessageUtils.getMessage("error.Locked");
		}
		
		request.setAttribute(m_id, username);
		request.setAttribute(m_password, password);
		request.setAttribute(errormsg_name, errormsg);
		
		System.out.println("????????? ??????");
		System.out.println(errormsg);
		System.out.println(defaultFailureUrl);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
	
	protected void loginFailureCount(String username) {
		service.updateFailureCount(username);
		int cnt = service.selectFailureCount(username);
		// ???????????? 5??? ?????? ????????? ??? ?????? ??????
		if (cnt == 5) {
			service.updateDisabled(username);
		}
	}


}