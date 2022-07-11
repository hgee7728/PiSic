package kh.spring.pisic.member.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.sound.domain.Sound;

public interface MemberService {
	
	public int insertMember(Member member);
	
	public Member loginCheck(Member member);
	
	public int idCheck(String m_id);
	
	public int nicknameCheck(String m_nickname);
	
	public int emailCheck(String m_email);
	
	public int phoneCheck(int m_phone);
	
	public Member findId(Member member);
	
	public Member findPw(Member member);
	
	public int findPwA(Member member);
	
	public List<Member> listMember();
	
	public List<Member> listAdmin();
}
