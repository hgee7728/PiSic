package kh.spring.pisic.member.model.service;

import kh.spring.pisic.member.domain.Member;

public interface MemberService {
	
	public int insertMember(Member member);
	
	public Member selectLogin(Member member);

}
