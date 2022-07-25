package kh.spring.pisic.springsecurity.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.springsecurity.domain.CustomUserDetails;

@Repository
public class CustomUserDetailsDao {
	
	@Autowired
	private SqlSession session;
	
	// CustomUserDetails 사용자 정보
	public CustomUserDetails selectCustomUserDetails(String username) {
		return session.selectOne("Security.selectCustomUserDetails", username);
	}
	
	// 로그인 실패 횟수 변경
	public int updateFailureCount(String username) {
		return session.update("Security.updateFailureCount", username);
	}
	
	// 로그인 실패 횟수 정보
	public int selectFailureCount(String username) {
		return session.selectOne("Security.selectFailureCount", username);
	}
	
	// 계정 비활성화 변경
	public int updateDisabled(String username) {
		return session.update("Security.updateDisabled", username);
	}

	// 로그인 실패 횟수 초기화
	public int updateFailureCountReset(String username) {
		return session.update("Security.updateFailureCountReset", username);
	}
}
