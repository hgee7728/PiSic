package kh.spring.pisic.springsecurity;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

//@Configuration
//public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
//	
//	private AuthenticationProvider authenticationProvider;
//	
//	public void SpringSecurityConfig(UserDetailsService userDetailsService
//			, AuthenticationProvider authenticationProvider) {
//		this.authenticationProvider = authenticationProvider;
//	}
//	
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.authenticationProvider(authenticationProvider);
//	}
//	
////	@Override
////	protected void configure(WebSecurity web) throws Exception {
////		
////	}
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		
//	}
//}
