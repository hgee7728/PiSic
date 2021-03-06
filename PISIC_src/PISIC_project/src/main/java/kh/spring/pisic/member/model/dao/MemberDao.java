package kh.spring.pisic.member.model.dao;

import java.util.HashMap;
import java.util.List;

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
	
	public Member loginCheck(Member member) {
		return session.selectOne("Member.loginCheck", member);
	}
	
	public int idCheck(String m_id) {
		return session.selectOne("Member.idCheck", m_id);
	}
	
	public int passwordCheck(String m_id, String m_password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("m_password", m_password);
		return session.selectOne("Member.passwordCheck", map);
	}
	
	public String selectPassword(String m_id) {
		return session.selectOne("Member.selectPassword", m_id);
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

	public List<Member> listMember() {
		return session.selectList("Member.listMember");
	}

	public List<Member> listAdmin() {
		return session.selectList("Member.listAdmin");
	}

	public int updateMyInfo(Member member) {
		return session.update("Member.updateMyInfo", member);
	}
	
	public Member selectLoginMember(String m_id) {
		return session.selectOne("Member.selectLoginMember", m_id);
	}
	
	public int deleteMember(Member member) {
		return session.update("Member.deleteMember", member);
	}
	
	public int updatePassword(Member member) {
		return session.update("Member.updatePassword", member);
	}
	
	public int updateMemberMembershipYn(String m_id) {
		return session.update("Member.updateMemberMembershipYn", m_id);
	}
	
	public int checkMembershipYn(String m_id) {
		return session.selectOne("Member.checkMembershipYn", m_id);
	}
}
