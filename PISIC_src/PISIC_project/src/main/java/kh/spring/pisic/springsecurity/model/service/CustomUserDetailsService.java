package kh.spring.pisic.springsecurity.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kh.spring.pisic.springsecurity.domain.CustomUserDetails;
import kh.spring.pisic.springsecurity.model.dao.CustomUserDetailsDao;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private CustomUserDetailsDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails user = dao.selectCustomUserDetails(username);
		if (user == null) {
			System.out.println("========================================== user null");
			throw new InternalAuthenticationServiceException(username);
		}
		return user;
	}
}
