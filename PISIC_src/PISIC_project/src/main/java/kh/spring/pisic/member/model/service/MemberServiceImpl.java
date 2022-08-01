package kh.spring.pisic.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.dao.MemberDao;
import kh.spring.pisic.springsecurity.model.dao.CustomUserDetailsDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private CustomUserDetailsDao cudDao;
	
	@Override
	public int insertMember(Member member) {
		return dao.insertMember(member);
	}

	@Override
	public Member loginCheck(Member member) {
		return dao.loginCheck(member);
	}

	@Override
	public int idCheck(String m_id) {
		return dao.idCheck(m_id);
	}
	
	@Override
	public int passwordCheck(String m_id, String m_password) {
		return dao.passwordCheck(m_id, m_password);
	}

	@Override
	public String selectPassword(String m_id) {
		return dao.selectPassword(m_id);
	}

	@Override
	public int nicknameCheck(String m_nickname) {
		return dao.nicknameCheck(m_nickname);
	}

	@Override
	public int emailCheck(String m_email) {
		return dao.emailCheck(m_email);
	}

	@Override
	public int phoneCheck(int m_phone) {
		return dao.phoneCheck(m_phone);
	}

	@Override
	public Member findId(Member member) {
		return dao.findId(member);
	}

	@Override
	public Member findPw(Member member) {
		return dao.findPw(member);
	}

	@Override
	public int findPwA(Member member) {
		return dao.findPwA(member);
	}

	@Override
	public List<Member> listMember() {
		return dao.listMember();
	}

	@Override
	public List<Member> listAdmin() {
		return dao.listAdmin();
	}

	@Override
	public int updateMyInfo(Member member) {
		return dao.updateMyInfo(member);
	}

	@Override
	public Member selectLoginMember(String m_id) {
		return dao.selectLoginMember(m_id);
	}

	
	@Override
	public int updateFailureCount(String username) {
		return cudDao.updateFailureCount(username);
	}

	@Override
	public int selectFailureCount(String username) {
		return cudDao.selectFailureCount(username);
	}

	@Override
	public int updateDisabled(String username) {
		return cudDao.updateDisabled(username);
	}

	@Override
	public int updateFailureCountReset(String username) {
		return cudDao.updateFailureCountReset(username);
	}

	@Override
	public int deleteMember(Member member) {
		return dao.deleteMember(member);
	}

	@Override
	public int updatePassword(Member member) {
		return dao.updatePassword(member);
	}

	@Override
	public int updateMemberMembershipYn(String m_id) {
		return dao.updateMemberMembershipYn(m_id);
	}

	@Override
	public int checkMembershipYn(String m_id) {
		return dao.checkMembershipYn(m_id);
	}

}
