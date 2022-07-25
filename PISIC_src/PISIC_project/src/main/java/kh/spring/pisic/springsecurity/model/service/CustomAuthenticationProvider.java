package kh.spring.pisic.springsecurity.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kh.spring.pisic.springsecurity.domain.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		
		CustomUserDetails user = (CustomUserDetails)service.loadUserByUsername(username);
		
		System.out.println("==========================================" + password);
		System.out.println("==========================================" + user.getPassword());
		System.out.println("==========================================" + matchPassword(password, user.getPassword()));
		
		// 계정 비활성화 || 패스워드 만료
		if (!user.isEnabled() || user.isCredentialsNonExpired()) {
			throw new AuthenticationCredentialsNotFoundException(username);
		}

		// 비밀번호 일치
		if (!matchPassword(password, user.getPassword())) {
			throw new BadCredentialsException(username);
		}
		return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	}

	private boolean matchPassword(String loginPwd, String password) {
		return bCryptPasswordEncoder.matches(loginPwd, password);
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
