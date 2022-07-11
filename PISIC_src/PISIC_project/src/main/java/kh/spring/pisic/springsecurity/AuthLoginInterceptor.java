package kh.spring.pisic.springsecurity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("loginSsInfo");
		
		if (obj == null) {
			response.sendRedirect("member/login");
			return false;
		}

		return true;
	}
	
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView mv) throws Exception {
		super.postHandle(request, response, handler, mv);
	}
}
