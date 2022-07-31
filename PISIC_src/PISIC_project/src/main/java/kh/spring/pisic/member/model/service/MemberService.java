package kh.spring.pisic.member.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.springsecurity.domain.CustomUserDetails;

public interface MemberService {
	
	public int insertMember(Member member);
	
	public Member loginCheck(Member member);
	
	public int idCheck(String m_id);
	
	public int passwordCheck(String m_id, String m_password);
	
	public String selectPassword(String m_id);
	
	public int nicknameCheck(String m_nickname);
	
	public int emailCheck(String m_email);
	
	public int phoneCheck(int m_phone);
	
	public Member findId(Member member);
	
	public Member findPw(Member member);
	
	public int findPwA(Member member);
	
	public List<Member> listMember();
	
	public List<Member> listAdmin();
	
	public int updateMyInfo(Member member);
	
	public Member selectLoginMember(String m_id);

	public int updateFailureCount(String username);

	public int selectFailureCount(String username);

	public int updateDisabled(String username);

	public int updateFailureCountReset(String username);

	public int deleteMember(Member member);
	
	public int updatePassword(Member member);
}
