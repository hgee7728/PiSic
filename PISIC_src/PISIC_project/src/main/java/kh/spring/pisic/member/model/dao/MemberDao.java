package kh.spring.pisic.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession session;
	
	public int insertMember(Member member) {
		return session.insert("Member.insertMember", member);
	}
	
	public Member selectLogin(Member member) {
		return session.selectOne("Member.selectLogin", member);
	}
	
	public int idCheck(String m_id) {
		return session.selectOne("Member.idCheck", m_id);
	}
	
	public int nicknameCheck(String m_nickname) {
		return session.selectOne("Member.nicknameCheck", m_nickname);
	}
	
	public int emailCheck(String m_email) {
		return session.selectOne("Member.emailCheck", m_email);
	}
	
	public int phoneCheck(int m_phone) {
		return session.selectOne("Member.phoneCheck", m_phone);
	}
	
	public Member findId(Member member) {
		return session.selectOne("Member.findId", member);
	}
	
	public Member findPw(Member member) {
		return session.selectOne("Member.findPw", member);
	}
	
	public int findPwA(Member member) {
		return session.update("Member.findPwA", member);
	}
}
